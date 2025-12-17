import 'package:bloc/bloc.dart';
import 'package:softwer_eng_assignment/feature/pharse/presentation/bloc/phrase_event.dart';
import 'package:softwer_eng_assignment/feature/pharse/presentation/bloc/phrase_state.dart';

import '../../domain/entity/pharse_entity.dart';
import '../../domain/usecase/extract_hashtags_usecase.dart';
import '../../domain/usecase/submit_phrase_usecase.dart';

class PhraseBloc extends Bloc<PhraseEvent, PhraseState> {
  final ExtractHashtagsUseCase extractHashtagsUseCase;
  final SubmitPhraseUseCase submitPhraseUseCase;

  PhraseBloc({
    required this.extractHashtagsUseCase,
    required this.submitPhraseUseCase,
  }) : super(const PhraseState()) {
    on<PhraseTextChanged>(_onPhraseTextChanged);
    on<HashtagsTextChanged>(_onHashtagsTextChanged);
    on<SubmitPhrase>(_onSubmitPhrase);
  }

  void _onPhraseTextChanged(
      PhraseTextChanged event,
      Emitter<PhraseState> emit,
      ) {
    final extractedHashtags = extractHashtagsUseCase(event.phrase);
    emit(state.copyWith(
      phrase: event.phrase,
      autoHashtags: extractedHashtags,
    ));
  }

  void _onHashtagsTextChanged(
      HashtagsTextChanged event,
      Emitter<PhraseState> emit,
      ) {
    final manualHashtags = extractHashtagsUseCase(event.hashtags);
    final uniqueManualHashtags = manualHashtags
        .where((tag) => !state.autoHashtags.contains(tag))
        .toList();
    emit(state.copyWith(manualHashtags: uniqueManualHashtags));
  }

  Future<void> _onSubmitPhrase(
      SubmitPhrase event,
      Emitter<PhraseState> emit,
      ) async {
    final phraseEntity = PhraseEntity(
      phrase: state.phrase,
      hashtags: state.allHashtags, hashtage: [],
    );
    await submitPhraseUseCase(phraseEntity);
    emit(state.copyWith(isSubmitted: true));
  }
}