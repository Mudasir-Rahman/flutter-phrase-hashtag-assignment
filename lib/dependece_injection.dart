import 'package:get_it/get_it.dart';

import 'feature/pharse/data/repository_impl/repository_impl.dart';
import 'feature/pharse/domain/repository/phrase_repository.dart';
import 'feature/pharse/domain/usecase/extract_hashtags_usecase.dart';
import 'feature/pharse/domain/usecase/submit_phrase_usecase.dart';
import 'feature/pharse/presentation/bloc/phrase_bloc.dart';

final getIt = GetIt.instance;

void setupDependencies() {
  // Repositories
  getIt.registerLazySingleton<PhraseRepository>(
        () => PhraseRepositoryImpl(),
  );

  // Use Cases
  getIt.registerLazySingleton(() => ExtractHashtagsUseCase());
  getIt.registerLazySingleton(() => SubmitPhraseUseCase(getIt()));

  // BLoC
  getIt.registerFactory(
        () => PhraseBloc(
      extractHashtagsUseCase: getIt(),
      submitPhraseUseCase: getIt(),
    ),
  );
}