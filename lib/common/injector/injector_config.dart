import 'package:kiwi/kiwi.dart';
import 'package:todo_app/data/repositories/todo_repository_impl.dart';
import 'package:todo_app/domain/repositories/todo_repository.dart';
import 'package:todo_app/domain/usecases/todo_usecase.dart';
import 'package:todo_app/presentation/journey/todo/todo_list/bloc/todo_bloc.dart';

part 'injector_config.g.dart';

abstract class InjectorConfig {
  static setup() {
    _$InjectorConfig()._register();
  }

  void _register() {
    _registerBlocs();
    _registerUsecases();
    _registerRepositories();
  }

  @Register.factory(TodoBloc)
  void _registerBlocs();

  @Register.singleton(TodoUsecase)
  void _registerUsecases();

  @Register.singleton(TodoRepository, from: TodoRepositoryImpl)
  void _registerRepositories();
}
