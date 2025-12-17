import 'package:equatable/equatable.dart';

abstract class PhraseEvent extends Equatable{
  const PhraseEvent();

  @override
  List<Object?> get props => [];
}

class PhraseTextChanged extends PhraseEvent {
  final String phrase;

  const PhraseTextChanged(this.phrase);

  @override
  List<Object?> get props => [phrase];
}

class HashtagsTextChanged extends PhraseEvent {
  final String hashtags;

  const HashtagsTextChanged(this.hashtags);

  @override
  List<Object?> get props => [hashtags];
}

class SubmitPhrase extends PhraseEvent {
  const SubmitPhrase();
}