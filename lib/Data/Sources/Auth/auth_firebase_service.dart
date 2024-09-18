import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:spotify_demo/Data/Models/Auth/create_user_req.dart';
import 'package:spotify_demo/Data/Models/Auth/signin_user_req.dart';

abstract class AuthFirebaseService{
  Future<Either> signup(CreateUserReq createUser);

  Future<Either> signin(SignInUserReq signinUser);
}

class FirebaseAuthServiceImplementation extends AuthFirebaseService{
  @override
  Future<Either> signin(SignInUserReq signinUser) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: signinUser.email,
          password: signinUser.password);

      return Right('Sign In was Successful');
    } on FirebaseAuthException catch (e) {
      String errorMessage = '';
      if(e.code == 'invalid-email') {
        errorMessage = 'No User found in this Email. Please enter Valid Email';
      } else if (e.code == 'invalid-credential') {
        errorMessage = 'Wrong Password. Please try again';
      }
      return Left(errorMessage);
    }
  }

  @override
  Future<Either> signup(CreateUserReq createUser) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: createUser.email,
          password: createUser.password);

      return Right('Sign Up was Successful');
    } on FirebaseAuthException catch (e) {
      String errorMessage = '';
      if(e.code == 'weak-password') {
        errorMessage = 'The Password provided is too weak.';
      } else if (e.code == 'email-already-in-use') {
        errorMessage = 'An Account already exists with this email address';
      }
      return Left(errorMessage);
    }
  }

}