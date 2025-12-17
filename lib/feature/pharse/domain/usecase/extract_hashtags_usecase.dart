class ExtractHashtagsUseCase {
  List<String> call(String text) {
    final hashtagRegex = RegExp(r'#\w+');
    final matches = hashtagRegex.allMatches(text);
    return matches.map((match) => match.group(0)!).toSet().toList();
  }
}