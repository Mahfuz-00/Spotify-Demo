import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spotify_demo/Common/Helpers/is_dark.dart';
import 'package:spotify_demo/Common/Widgets/Buttons/basic_app_button.dart';
import 'package:spotify_demo/Core/Configurations/Assets/App_Vectors.dart';
import 'package:spotify_demo/Presentation/Pages/Authentication%20Pages/signin.dart';
import 'package:spotify_demo/Presentation/Pages/Authentication%20Pages/signup.dart';

import '../../../Common/Widgets/Appbar/appbar.dart';
import '../../../Core/Configurations/Assets/app_images.dart';
import '../../../Core/Configurations/Themes/App_Colors.dart';

class SignupOrSignIn extends StatelessWidget {
  const SignupOrSignIn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        const Appbar(),
        Align(
          alignment: Alignment.topRight,
          child: SvgPicture.asset(AppVectors.TopPattern),
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: SvgPicture.asset(AppVectors.BottomPattern),
        ),
        Align(
            alignment: Alignment.bottomLeft,
            child: Image.asset(AppImages.SignupOrSigninBG)),
        Align(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    AppVectors.Logo,
                    height: 70,
                  ),
                  const SizedBox(
                    height: 55,
                  ),
                  const Text(
                    'Enjoy Listening to Music',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 26,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    'Spotify is the Proprietary of Swedish audio streaming and media service provider',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: AppColors.grey,
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    children: [
                      Expanded(
                          flex: 1,
                          child: AppButtons(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (BuildContext context) => SignUp()));
                            },
                            title: 'Register',
                          )),
                      const SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        flex: 1,
                        child: TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) => SignIn()));
                          },
                          child: Text(
                            'Sign in',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: context.isDarkMode
                                  ? Colors.white
                                  : Colors.black,
                            ),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            )),
      ],
    ));
  }
}
