import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spotify_demo/Common/Widgets/Buttons/basic_app_button.dart';
import 'package:spotify_demo/Core/Configurations/Assets/App_Vectors.dart';
import 'package:spotify_demo/Core/Configurations/Assets/app_images.dart';
import 'package:spotify_demo/Core/Configurations/Themes/App_Colors.dart';

import '../Choose Mode Page/choose_mode.dart';

class GetStartedPage extends StatefulWidget {
  const GetStartedPage({super.key});

  @override
  State<GetStartedPage> createState() => _GetStartedPageState();
}

class _GetStartedPageState extends State<GetStartedPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
          children: [
            Container(
              //padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 40),
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.fill, image: AssetImage(AppImages.IntroBG))),
            ),
            Container(
              color: Colors.black.withOpacity(0.15),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 40),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topCenter,
                    child: SvgPicture.asset(
                      AppVectors.Logo,
                    ),
                  ),
                  const Spacer(),
                  const Text(
                    'Welcome to Spotify',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    'Enjoy listening to music anytime and anywhere with ease. '
                    'Discover and enjoy your favorite songs and playlists on Spotify. '
                    'Immerse yourself in endless music, tailored just for you.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: AppColors.grey,
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  AppButtons(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const ChooseMode()));
                      },
                      title: 'Get Started')
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
