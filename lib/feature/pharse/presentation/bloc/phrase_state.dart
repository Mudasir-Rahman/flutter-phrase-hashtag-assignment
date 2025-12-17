import 'package:equatable/equatable.dart';

class PhraseState extends Equatable {
  final String phrase;
  final List<String> autoHashtags;
  final List<String> manualHashtags;
  final bool isSubmitted;

  const PhraseState({
    this.phrase = '',
    this.autoHashtags = const [],
    this.manualHashtags = const [],
    this.isSubmitted = false,
  });

  List<String> get allHashtags {
    final combined = <String>{...autoHashtags, ...manualHashtags};
    return combined.toList();
  }

  PhraseState copyWith({
    String? phrase,
    List<String>? autoHashtags,
    List<String>? manualHashtags,
    bool? isSubmitted,
  }) {
    return PhraseState(
      phrase: phrase ?? this.phrase,
      autoHashtags: autoHashtags ?? this.autoHashtags,
      manualHashtags: manualHashtags ?? this.manualHashtags,
      isSubmitted: isSubmitted ?? this.isSubmitted,
    );
  }

  @override
  List<Object?> get props => [phrase, autoHashtags, manualHashtags, isSubmitted];
}
