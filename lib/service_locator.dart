import 'package:get_it/get_it.dart';
import 'package:spotify_demo/Data/Repositories/Auth/auth_repository_implementation.dart';
import 'package:spotify_demo/Data/Sources/Auth/auth_firebase_service.dart';
import 'package:spotify_demo/Domain/Repositories/Auth/auth.dart';
import 'package:spotify_demo/Domain/Usecases/Auth/signin.dart';
import 'package:spotify_demo/Domain/Usecases/Auth/signup.dart';

final serviceLocator = GetIt.instance;

Future<void> initializeDependencies() async {
  serviceLocator.registerSingleton<AuthFirebaseService>(
      FirebaseAuthServiceImplementation()
  );

  serviceLocator.registerSingleton<AuthRepositories>(
      AuthRepositoryImplementation()
  );

  serviceLocator.registerSingleton<SignUpUseCase>(
      SignUpUseCase()
  );

  serviceLocator.registerSingleton<SignInUseCase>(
      SignInUseCase()
  );
}