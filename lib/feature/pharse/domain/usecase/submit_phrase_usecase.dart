import '../entity/pharse_entity.dart';
import '../repository/phrase_repository.dart';

class SubmitPhraseUseCase {
  final PhraseRepository repository;

  SubmitPhraseUseCase(this.repository);

  Future<void> call(PhraseEntity phrase) async {
    await repository.savePhrase(phrase);
  }
}