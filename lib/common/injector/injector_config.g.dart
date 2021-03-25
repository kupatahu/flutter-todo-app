// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'injector_config.dart';

// **************************************************************************
// KiwiInjectorGenerator
// **************************************************************************

class _$InjectorConfig extends InjectorConfig {
  void _registerBlocs() {
    final KiwiContainer container = KiwiContainer();
    container.registerFactory((c) => TodoBloc(todoUsecase: c<TodoUsecase>()));
  }

  void _registerUsecases() {
    final KiwiContainer container = KiwiContainer();
    container.registerSingleton(
        (c) => TodoUsecase(todoRepository: c<TodoRepository>()));
  }

  void _registerRepositories() {
    final KiwiContainer container = KiwiContainer();
    container.registerSingleton<TodoRepository>((c) => TodoRepositoryImpl());
  }
}
