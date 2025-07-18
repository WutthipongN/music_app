import 'package:music_app/features/playlist/domain/entities/music.dart';
import 'package:music_app/features/playlist/domain/repositories/music_repo.dart';

class GetPlaylist {
  final MusicRepository repository;

  GetPlaylist(this.repository);

  Future<List<Music>> call() async {
    return await repository.getSongs();
  }
}