import 'package:kiwi/kiwi.dart';
import 'package:todo_app/data/repositories/todo_repository_impl.dart';
import 'package:todo_app/domain/repositories/todo_repository.dart';
import 'package:todo_app/domain/usecases/todo_usecase.dart';
import 'package:todo_app/presentation/journey/todo/todo_list/bloc/todo_bloc.dart';

abstract class Injector {
  static final container = KiwiContainer();

  static final T Function<T>([String name]) resolve = container.resolve;

  static setup() {
    _registerBlocs();
    _registerUsecases();
    _registerRepositories();
  }

  static _registerBlocs() {
    container.registerFactory<TodoBloc>(
      (c) => TodoBloc(
        todoUsecase: c<TodoUsecase>(),
      ),
    );
  }

  static _registerUsecases() {
    container.registerSingleton<TodoUsecase>(
      (c) => TodoUsecase(
        todoRepository: c<TodoRepository>(),
      ),
    );}

  static _registerRepositories() {
    container.registerSingleton<TodoRepository>(
      (c) => TodoRepositoryImpl(),
    );
  }
}
