import 'package:dartz/dartz.dart';
import 'package:spotify_demo/Data/Sources/Song/song_firebase_service.dart';
import 'package:spotify_demo/Domain/Repositories/Song/song.dart';
import 'package:spotify_demo/service_locator.dart';

class SongRepositoriesImplementation extends SongRepositories {
  @override
  Future<Either> getNewSongs() async {
    return await serviceLocator<SongFirebaseService>().getNewSongs();
  }
}
