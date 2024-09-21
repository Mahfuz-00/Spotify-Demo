import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spotify_demo/Common/Widgets/Buttons/basic_app_button.dart';
import 'package:spotify_demo/Data/Models/Auth/create_user_req.dart';
import 'package:spotify_demo/Domain/Usecases/Auth/signup.dart';
import 'package:spotify_demo/Presentation/Pages/Authentication%20Pages/signin.dart';
import 'package:spotify_demo/Presentation/Pages/Home/home.dart';
import 'package:spotify_demo/service_locator.dart';

import '../../../Common/Widgets/Appbar/appbar.dart';
import '../../../Core/Configurations/Assets/App_Vectors.dart';

class SignUp extends StatelessWidget {
  SignUp({super.key});

  final TextEditingController _fullname_controller =
      new TextEditingController();
  final TextEditingController _email_controller = new TextEditingController();
  final TextEditingController _password_controller =
      new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //resizeToAvoidBottomInset: false,
      appBar: Appbar(
        title: SvgPicture.asset(
          AppVectors.Logo,
          height: 40,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 50),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const RegisterText(),
              const SizedBox(
                height: 40,
              ),
              TextField(
                controller: _fullname_controller,
                decoration: const InputDecoration(hintText: 'Full Name')
                    .applyDefaults(Theme.of(context).inputDecorationTheme),
              ),
              const SizedBox(
                height: 15,
              ),
              TextField(
                controller: _email_controller,
                decoration: const InputDecoration(hintText: 'Email')
                    .applyDefaults(Theme.of(context).inputDecorationTheme),
              ),
              const SizedBox(
                height: 15,
              ),
              TextField(
                controller: _password_controller,
                decoration: const InputDecoration(hintText: 'Password')
                    .applyDefaults(Theme.of(context).inputDecorationTheme),
              ),
              const SizedBox(
                height: 25,
              ),
              AppButtons(
                  onPressed: () async {
                    var result = await serviceLocator<SignUpUseCase>().call(
                        params: CreateUserReq(
                            fullname: _fullname_controller.text.toString(),
                            email: _email_controller.text.toString(),
                            password: _password_controller.text.toString()));
                    result.fold((l) {
                      ScaffoldMessenger.of(context)
                          .showSnackBar(SnackBar(content: Text(l)));
                    }, (r) {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) => const HomePage()),
                        (route) => false,
                      );
                    });
                  },
                  title: 'Create a new account'),
              //Spacer(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Already have an account?',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => SignIn()));
              },
              child: const Text('Sign In',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.blue,
                  )),
            ),
          ],
        ),
      ),
    );
  }
}

class RegisterText extends StatelessWidget {
  const RegisterText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Register',
      textAlign: TextAlign.center,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 25,
      ),
    );
  }
}
