import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:todo_app/domain/entities/todo.dart';
import 'package:todo_app/presentation/journey/todo/todo_list/widgets/todo_item.dart';

import '../../../../../domain/entities/__mocks__/mock_todo.dart';

class MockFunction extends Mock {
  dynamic onPressed(dynamic arg);
}

void main() {
  group('TodoItem', () {
    Todo todo = mockCompletedTodo;
    int index = 0;
    Function onPressed;

    setUp(() {
      onPressed = MockFunction().onPressed;
    });

    Future<void> pumpTodoItem(WidgetTester tester) async {
      final widget = TodoItem(
        todo: todo,
        index: index,
        onPressed: onPressed,
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
      testWidgets(
        'render todo item with checkbox and text',
        (WidgetTester tester) async {
          await pumpTodoItem(tester);

          expect(find.byType(Checkbox), findsOneWidget);
          expect(find.byKey(ValueKey('todo_item_$index')), findsOneWidget);
          expect(find.text(todo.title), findsOneWidget);
        },
      );

      testWidgets(
        'invoke onPressed callback when tap on checkbox',
        (WidgetTester tester) async {
          await pumpTodoItem(tester);

          await tester.tap(find.byType(Checkbox));

          verify(onPressed(todo)).called(1);
        },
      );

      testWidgets(
        'render completed todo with active checkbox',
        (WidgetTester tester) async {
          todo = mockCompletedTodo;
          await pumpTodoItem(tester);
          final checkboxPredicate = (widget) =>
              widget is Checkbox &&
              widget.key == ValueKey('todo_item_checkbox_$index') &&
              widget.value == true;

          await tester.tap(find.byType(Checkbox));
          
          expect(find.byWidgetPredicate(checkboxPredicate), findsOneWidget);
        },
      );

      testWidgets(
        'render uncompleted todo with inactive checkbox',
        (WidgetTester tester) async {
          todo = mockUncompletedTodo;
          await pumpTodoItem(tester);
          final checkboxPredicate = (widget) =>
              widget is Checkbox &&
              widget.key == ValueKey('todo_item_checkbox_$index') &&
              widget.value == false;

          await tester.tap(find.byType(Checkbox));
          
          expect(find.byWidgetPredicate(checkboxPredicate), findsOneWidget);
        },
      );
    });
  });
}
