import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spotify_demo/Core/Configurations/Assets/App_Vectors.dart';
import 'package:spotify_demo/Core/Configurations/Assets/app_images.dart';

class HomeTopCard extends StatelessWidget {
  const HomeTopCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 140,
        child: Stack(children: [
          Align(
              alignment: Alignment.bottomCenter,
              child: SvgPicture.asset(AppVectors.homeTopCard)),
          Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.only(right: 60),
                child: Image.asset(AppImages.HomeArtist),
              ))
        ]),
      ),
    );
  }
}