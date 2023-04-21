class TodoModel{
  String text;
  bool complete;

  TodoModel(this.text, this.complete);

  @override
  String toString() {
    return 'TodoModel{text: $text, complete: $complete}';
  }
}