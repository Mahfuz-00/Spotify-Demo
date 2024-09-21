import 'package:flutter/material.dart';
import 'package:spotify_demo/Core/Constant/app_urls.dart';
import 'package:spotify_demo/Domain/Entities/Songs/song.dart';

class Songs extends StatelessWidget {
  final List<SongEntity> songs;

   const Songs({
    super.key,
    required this.songs,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return SizedBox(
            width: 160,
            child: Column(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.cover,
                            image: NetworkImage(AppURLs.fireStorage +
                                songs[index].artist +
                                ' - ' +
                                songs[index].title +
                                '.jpg?' +
                                AppURLs.mediaAlt))),
                  ),
                )
              ],
            ),
          );
        },
        separatorBuilder: (context, index) => SizedBox(
              width: 15,
            ),
        itemCount: songs.length);
  }
}
