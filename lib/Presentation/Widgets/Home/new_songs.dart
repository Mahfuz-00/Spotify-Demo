import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify_demo/Presentation/Bloc/Home/new_song_cubit.dart';
import 'package:spotify_demo/Presentation/Widgets/Home/songs.dart';

class NewSongs extends StatelessWidget {
  const NewSongs({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => NewSongCubit()..getNewSongs(),
      child: SizedBox(
        height: 200,
        child: BlocBuilder<NewSongCubit, NewSongState>(
          builder: (context, state) {
            if (state is NewSongsLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is NewSongsLoaded) {
              return Songs(songs: state.songs);
            } else if (state is NewSongsLoadFailer) {
              return const Center(
                child: Text('Error occurred while loading songs'),
              );
            }
            return Container();
          },
        ),
      ),
    );
  }
}
