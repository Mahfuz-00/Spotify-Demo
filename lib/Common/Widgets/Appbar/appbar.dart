import 'package:flutter/material.dart';
import 'package:spotify_demo/Common/Helpers/is_dark.dart';

class Appbar extends StatelessWidget implements PreferredSize {
  final Widget? title;
  final bool hideBack;

  const Appbar({super.key, this.title, this.hideBack = false});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      title: title ?? Text(''),
      centerTitle: true,
      elevation: 0,
      leading: hideBack? null : IconButton(
        icon: Container(
            height: 50,
            width: 50,
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: context.isDarkMode
                    ? Colors.white.withOpacity(0.03)
                    : Colors.black.withOpacity(0.04)),
            child: Icon(
              Icons.arrow_back_ios_new_outlined,
              size: 20,
              color: context.isDarkMode ? Colors.white : Colors.black,
            )),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }

  @override
  Widget get child => throw UnimplementedError();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
