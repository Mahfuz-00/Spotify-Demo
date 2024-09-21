import 'package:dartz/dartz.dart';
import 'package:spotify_demo/Core/Usecase/usecase.dart';
import 'package:spotify_demo/Data/Repositories/Song/song.dart';
import 'package:spotify_demo/service_locator.dart';

class GetNewSongUseCase implements Usecase<Either, dynamic> {
  @override
  Future<Either> call({params}) async {
    return await serviceLocator<SongRepositoriesImplementation>().getNewSongs();
  }
}
