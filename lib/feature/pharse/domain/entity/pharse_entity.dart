class PhraseEntity {
  final String phrase ;
  final List<String> hashtage;
  PhraseEntity({
    required this.hashtage,
    required this.phrase, required List<String> hashtags
});

  @override
  List<Object?> get props => [phrase, hashtage];
}