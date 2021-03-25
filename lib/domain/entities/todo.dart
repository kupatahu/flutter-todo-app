class Todo {
  final int id;
  final String title;
  bool isCompleted;

  Todo({
    this.id,
    this.title,
    this.isCompleted = false,
  });

  void toggleCompleted() => isCompleted = !isCompleted;
}
