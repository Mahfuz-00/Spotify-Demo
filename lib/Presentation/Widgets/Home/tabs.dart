import 'package:flutter/material.dart';
import 'package:spotify_demo/Common/Helpers/is_dark.dart';
import 'package:spotify_demo/Core/Configurations/Themes/app_colors.dart';

class Tabs extends StatelessWidget {
  const Tabs({
    super.key,
    required TabController tabController,
  }) : _tabController = tabController;

  final TabController _tabController;

  @override
  Widget build(BuildContext context) {
    return TabBar(
        labelColor: context.isDarkMode ? Colors.white : Colors.black,
        padding: const EdgeInsets.symmetric(vertical: 30),
        isScrollable: true,
        indicatorColor: AppColors.primary,
        controller: _tabController,
        tabs: const [
          Text(
            'New',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
            ),
          ),
          Text(
            'Artists',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
            ),
          ),
          Text(
            'Videos',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
            ),
          ),
          Text(
            'Podcasts',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
            ),
          ),
          Text(
            'Favorites',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
            ),
          ),
        ]);
  }
}