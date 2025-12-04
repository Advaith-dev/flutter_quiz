class QuizQuestions {
  const QuizQuestions(this.question, this.ansoptions);

  final String question;
  final List<String> ansoptions;

  List<String> getShuffledAns() {
    final shuffledList = List.of(ansoptions);
    shuffledList.shuffle();
    return shuffledList;
  }
}
