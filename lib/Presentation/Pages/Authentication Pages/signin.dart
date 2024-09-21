import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spotify_demo/Common/Widgets/Buttons/basic_app_button.dart';
import 'package:spotify_demo/Data/Models/Auth/signin_user_req.dart';
import 'package:spotify_demo/Domain/Usecases/Auth/signin.dart';
import 'package:spotify_demo/Presentation/Pages/Authentication%20Pages/signup.dart';
import 'package:spotify_demo/Presentation/Pages/Home/home.dart';
import 'package:spotify_demo/service_locator.dart';

import '../../../Common/Widgets/Appbar/appbar.dart';
import '../../../Core/Configurations/Assets/App_Vectors.dart';

class SignIn extends StatelessWidget {
  SignIn({super.key});

  final TextEditingController _email_controller = new TextEditingController();
  final TextEditingController _password_controller = new TextEditingController();

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
          padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 90),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const RegisterText(),
              const SizedBox(
                height: 40,
              ),
              TextField(
                controller: _email_controller,
                decoration:
                    const InputDecoration(hintText: 'Enter Username or Email')
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
                    var result = await serviceLocator<SignInUseCase>().call(
                        params: SignInUserReq(
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
                  title: 'Sign In'),
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
              'Not A Member?',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => SignUp()));
              },
              child: const Text('Register Now',
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
      'Sign In',
      textAlign: TextAlign.center,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 25,
      ),
    );
  }
}
