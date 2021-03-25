import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/common/injector/injector.dart';
import 'package:todo_app/domain/entities/todo.dart';
import 'package:todo_app/presentation/journey/todo/todo_list/bloc/todo_bloc.dart';
import 'package:todo_app/presentation/journey/todo/todo_list/widgets/todo_list_app_bar.dart';
import 'package:todo_app/presentation/journey/todo/todo_list/widgets/todo_list_body.dart';

class TodoListScreen extends StatefulWidget {
  @override
  _TodoListScreenState createState() => _TodoListScreenState();
}

class _TodoListScreenState extends State<TodoListScreen> {
  TodoBloc todoBloc;

  @override
  void initState() {
    super.initState();

    todoBloc = Injector.resolve<TodoBloc>()..add(FetchTodo());
  }

  @override
  void dispose() {
    todoBloc?.close();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => todoBloc,
      child: Scaffold(
        appBar: const TodoListAppBar(),
        body: BlocBuilder<TodoBloc, TodoState>(
          builder: (context, state) {
            return TodoListBody(
              todos: state.todos,
              onItemPressed: _addToggleTodoEvent,
            );
          },
        ),
      ),
    );
  }

  void _addToggleTodoEvent(Todo todo) {
    todoBloc.add(ToggleTodo(todo));
  }
}
