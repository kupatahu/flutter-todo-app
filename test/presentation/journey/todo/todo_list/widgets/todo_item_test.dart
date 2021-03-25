import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:todo_app/domain/entities/todo.dart';
import 'package:todo_app/presentation/journey/todo/todo_list/widgets/todo_item.dart';

class MockFunction extends Mock {
  dynamic onPressed(dynamic arg);
}

void main() {
  group('TodoItem', () {
    Todo todo = Todo(title: 'todo', isCompleted: false);
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
    });
  });
}