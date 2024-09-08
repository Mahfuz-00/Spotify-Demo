import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spotify_demo/Common/Widgets/Buttons/basic_app_button.dart';
import 'package:spotify_demo/Presentation/Pages/Authentication%20Pages/signin.dart';

import '../../../Common/Widgets/Appbar/appbar.dart';
import '../../../Core/Configurations/Assets/App_Vectors.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Appbar(
        title: SvgPicture.asset(
          AppVectors.Logo,
          height: 40,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const RegisterText(),
            const SizedBox(
              height: 40,
            ),
            TextField(
              decoration: const InputDecoration(hintText: 'Full Name')
                  .applyDefaults(Theme.of(context).inputDecorationTheme),
            ),
            const SizedBox(
              height: 15,
            ),
            TextField(
              decoration: const InputDecoration(hintText: 'Email')
                  .applyDefaults(Theme.of(context).inputDecorationTheme),
            ),
            const SizedBox(
              height: 15,
            ),
            TextField(
              decoration: const InputDecoration(hintText: 'Password')
                  .applyDefaults(Theme.of(context).inputDecorationTheme),
            ),
            const SizedBox(
              height: 25,
            ),
            AppButtons(onPressed: () {}, title: 'Create a new account'),
            //Spacer(),
          ],
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
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => const SignIn()));
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
