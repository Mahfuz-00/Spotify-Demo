import 'package:dartz/dartz.dart';
import 'package:spotify_demo/Data/Models/Auth/create_user_req.dart';
import 'package:spotify_demo/Data/Models/Auth/signin_user_req.dart';
import 'package:spotify_demo/Data/Sources/Auth/auth_firebase_service.dart';
import 'package:spotify_demo/Domain/Repositories/Auth/auth.dart';
import 'package:spotify_demo/service_locator.dart';

class AuthRepositoryImplementation extends AuthRepositories {
  @override
  Future<Either> signin(SignInUserReq signinUser) async{
   return await serviceLocator<AuthFirebaseService>().signin(signinUser);
  }

  @override
  Future<Either> signup(CreateUserReq createUserReq) async {
    return await serviceLocator<AuthFirebaseService>().signup(createUserReq);
  }

}