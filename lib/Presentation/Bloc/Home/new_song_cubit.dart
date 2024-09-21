import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:spotify_demo/Domain/Entities/Songs/song.dart';
import 'package:spotify_demo/Domain/Usecases/Song/get_new_songs.dart';
import 'package:spotify_demo/service_locator.dart';

part 'new_song_state.dart';

class NewSongCubit extends Cubit<NewSongState> {
  NewSongCubit() : super(NewSongsLoading());

  Future<void> getNewSongs() async {
    var returnedSongs = await serviceLocator<GetNewSongUseCase>().call();
    returnedSongs.fold((l) {
      emit(NewSongsLoadFailer());
    }, (data) {
      emit(NewSongsLoaded(songs: data));
    });
  }
}
