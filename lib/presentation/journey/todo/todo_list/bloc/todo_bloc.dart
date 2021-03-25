import 'package:bloc/bloc.dart';
import 'package:todo_app/domain/usecases/todo_usecase.dart';
import 'package:todo_app/presentation/journey/todo/todo_list/bloc/todo_event.dart';
import 'package:todo_app/presentation/journey/todo/todo_list/bloc/todo_state.dart';

export 'package:todo_app/presentation/journey/todo/todo_list/bloc/todo_event.dart';
export 'package:todo_app/presentation/journey/todo/todo_list/bloc/todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  final TodoUsecase todoUsecase;

  TodoBloc({this.todoUsecase});

  @override
  TodoState get initialState => TodoInitial();

  @override
  Stream<TodoState> mapEventToState(TodoEvent event) async* {
    if (event is FetchTodo) {
      yield* _mapFetchTodoToState(event);
    }
    if (event is ToggleTodo) {
      yield* _mapToggleTodoToState(event);
    }
  }

  Stream<TodoState> _mapFetchTodoToState(FetchTodo event) async* {
    final todos = await todoUsecase.getAll();

    yield TodoLoaded(todos: todos);
  }

  Stream<TodoState> _mapToggleTodoToState(ToggleTodo event) async* {
    await todoUsecase.toggleCompleted(event.todo);

    final todos = await todoUsecase.getAll();

    yield TodoUpdated(todos: todos);
  }
}
