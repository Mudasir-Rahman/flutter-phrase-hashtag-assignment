import '../../domain/entity/pharse_entity.dart';
import '../../domain/repository/phrase_repository.dart';

class PhraseRepositoryImpl implements PhraseRepository {
  PhraseEntity? _cachedPhrase;

  @override
  Future<void> savePhrase(PhraseEntity phrase) async {
    _cachedPhrase = phrase;
  }

  PhraseEntity? getPhrase() {
    return _cachedPhrase;
  }

}