import 'package:music_app/features/playlist/domain/entities/music.dart';

abstract class MusicRepository {
  Future<List<Music>> getSongs();
}