

import 'package:music_app/features/playlist/data/datasources/music_datasources.dart';
import 'package:music_app/features/playlist/domain/entities/music.dart';
import 'package:music_app/features/playlist/domain/repositories/music_repo.dart';

class MusicRepositoryImpl implements MusicRepository {
  final MusicDataSource localDataSource;

  MusicRepositoryImpl(this.localDataSource);

  @override
  Future<List<Music>> getSongs() async {
    return await localDataSource.getMusic();
  }
}
