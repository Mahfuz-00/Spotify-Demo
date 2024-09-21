import 'package:get_it/get_it.dart';
import 'package:spotify_demo/Data/Repositories/Auth/auth_repository_implementation.dart';
import 'package:spotify_demo/Data/Repositories/Song/song.dart';
import 'package:spotify_demo/Data/Sources/Auth/auth_firebase_service.dart';
import 'package:spotify_demo/Data/Sources/Song/song_firebase_service.dart';
import 'package:spotify_demo/Domain/Repositories/Auth/auth.dart';
import 'package:spotify_demo/Domain/Repositories/Song/song.dart';
import 'package:spotify_demo/Domain/Usecases/Auth/signin.dart';
import 'package:spotify_demo/Domain/Usecases/Auth/signup.dart';
import 'package:spotify_demo/Domain/Usecases/Song/get_new_songs.dart';

final GetIt serviceLocator = GetIt.instance;

Future<void> initializeDependencies() async {
  serviceLocator.registerSingleton<AuthFirebaseService>(
      FirebaseAuthServiceImplementation()
  );

  serviceLocator.registerSingleton<SongFirebaseService>(
      SongFirebaseServiceImplementation()
  );

  serviceLocator.registerSingleton<AuthRepositories>(
      AuthRepositoryImplementation()
  );

  serviceLocator.registerSingleton<SongRepositories>(
      SongRepositoriesImplementation()
  );

  serviceLocator.registerSingleton<SignUpUseCase>(
      SignUpUseCase()
  );

  serviceLocator.registerSingleton<SignInUseCase>(
      SignInUseCase()
  );

  serviceLocator.registerSingleton<GetNewSongUseCase>(
      GetNewSongUseCase()
  );
}