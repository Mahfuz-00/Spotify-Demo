part of 'new_song_cubit.dart';

@immutable
sealed class NewSongState {}

class NewSongsLoading extends NewSongState{
}

class NewSongsLoaded extends NewSongState{
  final List<SongEntity> songs;

  NewSongsLoaded({required this.songs});
}

class NewSongsLoadFailer extends NewSongState {

}
