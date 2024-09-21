import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:spotify_demo/Data/Models/Song/song.dart';
import 'package:spotify_demo/Domain/Entities/Songs/song.dart';

abstract class SongFirebaseService {
  Future<Either> getNewSongs();
}

class SongFirebaseServiceImplementation implements SongFirebaseService {
  @override
  Future<Either> getNewSongs() async {
    try {
      List<SongEntity> songs = [];
      var data = await FirebaseFirestore.instance
          .collection('Songs')
          .orderBy('Release Date', descending: true)
          .limit(3)
          .get();

      for (var elements in data.docs) {
        var songModel = SongModel.fromJson(elements.data());
        songModel.toEntity();
      }
      return Right(songs);
    } catch (e) {
      return Left('An Error Occured. Please try again!');
    }
  }
}
