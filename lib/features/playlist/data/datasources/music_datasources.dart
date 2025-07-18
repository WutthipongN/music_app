import 'package:music_app/features/playlist/data/models/music_model.dart';



abstract class MusicDataSource {
  Future<List<MusicModel>> getMusic();
}

class MusicDataSourceImpl implements MusicDataSource {
  @override
  Future<List<MusicModel>> getMusic() async {
    return [
      const MusicModel(
        title: 'SoundHelix Song 1',
        artist: 'T. Schürger',
        imageUrl: 'https://daily.jstor.org/wp-content/uploads/2023/01/good_times_with_bad_music_1050x700.jpg',
        url: "https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3"
      ),
       const MusicModel(
        title: 'SoundHelix Song 2',
        artist: 'T. Schürger',
        imageUrl: 'https://daily.jstor.org/wp-content/uploads/2023/01/good_times_with_bad_music_1050x700.jpg',
        url: "https://www.soundhelix.com/examples/mp3/SoundHelix-Song-2.mp3"
      ),
       const MusicModel(
        title: 'SoundHelix Song 3',
        artist: 'T. Schürger',
        imageUrl: 'https://daily.jstor.org/wp-content/uploads/2023/01/good_times_with_bad_music_1050x700.jpg',
        url: "https://www.soundhelix.com/examples/mp3/SoundHelix-Song-3.mp3"
      ),
       const MusicModel(
        title: 'SoundHelix Song 4',
        artist: 'T. Schürger',
        imageUrl: 'https://daily.jstor.org/wp-content/uploads/2023/01/good_times_with_bad_music_1050x700.jpg',
        url: "https://www.soundhelix.com/examples/mp3/SoundHelix-Song-4.mp3"
      ),
       const MusicModel(
        title: 'SoundHelix Song 5',
        artist: 'T. Schürger',
        imageUrl: 'https://daily.jstor.org/wp-content/uploads/2023/01/good_times_with_bad_music_1050x700.jpg',
        url: "https://www.soundhelix.com/examples/mp3/SoundHelix-Song-5.mp3"
      ),
      
    ];
  }
}