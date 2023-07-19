class QuestionModel {
  const QuestionModel(this.text, this.answers);
  final String text;
  final List<String> answers;

  List<String> get suffledList {
    final suffled = List.of(answers);
    suffled.shuffle();
    return suffled;
  }
}
