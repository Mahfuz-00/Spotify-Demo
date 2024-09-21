import 'package:dartz/dartz.dart';

abstract class SongRepositories {
  Future<Either> getNewSongs();
}
