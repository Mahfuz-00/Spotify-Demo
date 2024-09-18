import 'package:dartz/dartz.dart';
import 'package:spotify_demo/Core/Usecase/usecase.dart';
import 'package:spotify_demo/Data/Models/Auth/create_user_req.dart';
import 'package:spotify_demo/Domain/Repositories/Auth/auth.dart';
import 'package:spotify_demo/service_locator.dart';

class SignUpUseCase implements Usecase<Either,CreateUserReq>{
  @override
  Future<Either> call({CreateUserReq? params}) async {
   return serviceLocator<AuthRepositories>().signup(params!);
  }
}