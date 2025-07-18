import 'package:flutter/material.dart';
import 'package:music_app/features/playlist/data/datasources/music_datasources.dart';
import 'package:music_app/features/playlist/data/repositories/music_repo_imp.dart';
import 'package:music_app/features/playlist/domain/usecases/get_playlist.dart';
import 'package:music_app/features/playlist/presenttation/page/playlist_page.dart';
import 'package:music_app/features/playlist/presenttation/provider/playlist_provider.dart';
import 'package:provider/provider.dart';



void main() {
  final localDataSource = MusicDataSourceImpl();
  final repository = MusicRepositoryImpl(localDataSource);
  final getPlaylist = GetPlaylist(repository);

  runApp(MyApp(getPlaylist: getPlaylist));
}

class MyApp extends StatelessWidget {
  final GetPlaylist getPlaylist;

  const MyApp({super.key, required this.getPlaylist});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => PlaylistProvider(getPlaylist: getPlaylist),
        ),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'My Playlist',
        home: PlaylistPage(),
      ),
    );
  }
}