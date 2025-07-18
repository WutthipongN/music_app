import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:music_app/features/playlist/domain/entities/music.dart';
import 'package:music_app/features/playlist/domain/usecases/get_playlist.dart';


class PlaylistProvider extends ChangeNotifier {
  final GetPlaylist getPlaylist;
  final AudioPlayer _audioPlayer = AudioPlayer();

  PlaylistProvider({required this.getPlaylist}) {
    fetchSongs();
  }

  List<Music> _music = [];
  List<Music> get music => _music;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String? _error;
  String? get error => _error;

  Music? _nowPlaying;
  Music? get nowPlaying => _nowPlaying;

  bool _isPlaying = false;
  bool get isPlaying => _isPlaying;

  

  Future<void> fetchSongs() async {
    _isLoading = true;
    notifyListeners();

    try {
      _music = await getPlaylist();
      _error = null;
    } catch (e) {
      _error = e.toString();
    }

    _isLoading = false;
    notifyListeners();
  }

  Future<void> playSong(Music music) async {
  try { 
    _nowPlaying = music; 
    await _audioPlayer.setUrl(music.url);
    _audioPlayer.play();

    _isPlaying = true;
    notifyListeners();
  } catch (e) {
    _error = e.toString();
    notifyListeners();
  }
}

  Future<void> stop() async {
    _isPlaying = false;
    _audioPlayer.stop();
    notifyListeners();
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }
}
