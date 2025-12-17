import '../entity/pharse_entity.dart';

abstract class PhraseRepository {
  Future<void> savePhrase(PhraseEntity phrase);
  PhraseEntity? getPhrase();
}