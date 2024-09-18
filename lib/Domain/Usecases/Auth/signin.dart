import 'package:dartz/dartz.dart';
import 'package:spotify_demo/Core/Usecase/usecase.dart';
import 'package:spotify_demo/Data/Models/Auth/signin_user_req.dart';
import 'package:spotify_demo/Domain/Repositories/Auth/auth.dart';
import 'package:spotify_demo/service_locator.dart';

class SignInUseCase implements Usecase<Either,SignInUserReq>{
  @override
  Future<Either> call({SignInUserReq? params}) async {
    return serviceLocator<AuthRepositories>().signin(params!);
  }
}