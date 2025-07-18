

import 'package:music_app/features/playlist/domain/entities/music.dart';

class MusicModel extends Music {
  const MusicModel({
    required String title,
    required String artist,
    required String imageUrl,
    required String url
  }) : super(title: title, artist: artist, imageUrl: imageUrl, url:url);

  factory MusicModel.fromJson(Map<String, dynamic> json) {
    return MusicModel(
      title: json['title'],
      artist: json['artist'],
      imageUrl: json['imageUrl'],
      url: json['url']
    );
  }
}