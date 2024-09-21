import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spotify_demo/Common/Widgets/Appbar/appbar.dart';
import 'package:spotify_demo/Core/Configurations/Assets/App_Vectors.dart';
import 'package:spotify_demo/Presentation/Widgets/Home/home_top_card.dart';
import 'package:spotify_demo/Presentation/Widgets/Home/new_songs.dart';
import 'package:spotify_demo/Presentation/Widgets/Home/tabs.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 5);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Appbar(
        hideBack: true,
        title: SvgPicture.asset(
          AppVectors.Logo,
          height: 40,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const HomeTopCard(),
            Tabs(tabController: _tabController),
            SizedBox(
              height: 260,
              child: TabBarView(
                controller: _tabController,
                children: [
                  const NewSongs(),
                  Container(),
                  Container(),
                  Container(),
                  Container()
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
