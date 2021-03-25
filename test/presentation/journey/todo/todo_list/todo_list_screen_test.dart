import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:todo_app/common/injector/injector.dart';
import 'package:todo_app/domain/entities/todo.dart';
import 'package:todo_app/presentation/journey/todo/todo_list/bloc/todo_bloc.dart';
import 'package:todo_app/presentation/journey/todo/todo_list/todo_list_screen.dart';
import 'package:todo_app/presentation/journey/todo/todo_list/widgets/todo_list_app_bar.dart';
import 'package:todo_app/presentation/journey/todo/todo_list/widgets/todo_list_body.dart';

import '../../../../domain/entities/__mocks__/mock_todo.dart';
import 'bloc/__mocks__/mock_todo_bloc.dart';

void main() {
  group('TodoListScreen', () {
    TodoBloc todoBloc;

    setUp(() {
      todoBloc = MockTodoBloc();
      Injector.container.registerInstance<TodoBloc>(todoBloc);

      when(todoBloc.state).thenReturn(TodoInitial());
    });

    tearDown(() {
      Injector.container?.clear();
    });

    Future<void> pumpTodoListScreen(WidgetTester tester) async {
      final widget = TodoListScreen();

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: widget,
          ),
        ),
      );
    }

    group('#initState', () {
      testWidgets('add FetchTodo to TodoBloc', (WidgetTester tester) async {
        await pumpTodoListScreen(tester);

        verify(todoBloc.add(argThat(isA<FetchTodo>()))).called(1);
      });
    });

    group('#build', () {
      List<Todo> todos;

      setUp(() {
        todos = mockTodoList;

        when(todoBloc.state).thenReturn(
          TodoLoaded(todos: todos),
        );
      });
      testWidgets(
        'render app bar and body with todos from bloc state',
        (WidgetTester tester) async {
          final bodyPredicate = (widget) =>
              widget is TodoListBody && widget.todos == mockTodoList;

          await pumpTodoListScreen(tester);

          expect(find.byType(TodoListAppBar), findsOneWidget);
          expect(find.byWidgetPredicate(bodyPredicate), findsOneWidget);
        },
      );

      testWidgets(
        'invoke onItemPressed when todo item is pressed',
        (WidgetTester tester) async {
          await pumpTodoListScreen(tester);
          final todoListBodyFinder = find.byType(TodoListBody);
          final todoListBody = tester.firstWidget<TodoListBody>(
            todoListBodyFinder,
          );

          todoListBody.onItemPressed(todos.first);

          verify(todoBloc.add(argThat(isA<ToggleTodo>()))).called(1);
        },
      );
    });
  });
}
