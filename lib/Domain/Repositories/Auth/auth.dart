import 'package:dartz/dartz.dart';
import 'package:spotify_demo/Data/Models/Auth/create_user_req.dart';
import 'package:spotify_demo/Data/Models/Auth/signin_user_req.dart';

abstract class AuthRepositories {
  Future<Either> signup(CreateUserReq createUserReq);

  Future<Either> signin(SignInUserReq signinUser);
}
