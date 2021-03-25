import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:todo_app/domain/entities/todo.dart';
import 'package:todo_app/presentation/journey/todo/todo_list/todo_list_constant.dart';
import 'package:todo_app/presentation/journey/todo/todo_list/widgets/todo_item.dart';
import 'package:todo_app/presentation/journey/todo/todo_list/widgets/todo_list_body.dart';

import '../../../../../domain/entities/__mocks__/mock_todo.dart';

class MockFunction extends Mock {
  dynamic onItemPressed(dynamic arg);
}

void main() {
  group('TodoListBody', () {
    List<Todo> todos = mockTodoList;
    Function onItemPressed;

    setUp(() {
      onItemPressed = MockFunction().onItemPressed;
    });

    Future<void> pumpTodoListBody(WidgetTester tester) async {
      final widget = TodoListBody(
        todos: todos,
        onItemPressed: onItemPressed,
      );

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: widget,
          ),
        ),
      );
    }

    group('#build', () {
      testWidgets('render list of todo item', (WidgetTester tester) async {
        await pumpTodoListBody(tester);

        expect(find.byKey(TodoListConstant.bodyKey), findsOneWidget);
        expect(find.byType(TodoItem), findsNWidgets(todos.length));
      });

      testWidgets(
        'invoke onItemPressed when todo item is pressed',
        (WidgetTester tester) async {
          await pumpTodoListBody(tester);
          final todoItemFinder = find.byType(TodoItem);
          final todoItem = tester.firstWidget<TodoItem>(todoItemFinder);

          todoItem.onPressed(todos.first);

          verify(onItemPressed(todos.first)).called(1);
        },
      );
    });
  });
}
