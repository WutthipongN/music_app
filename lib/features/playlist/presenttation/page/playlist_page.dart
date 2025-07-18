import 'package:flutter/material.dart';
import 'package:music_app/features/playlist/presenttation/provider/playlist_provider.dart';
import 'package:music_app/features/playlist/presenttation/widget/playing_bar.dart';
import 'package:provider/provider.dart';

class PlaylistPage extends StatelessWidget {
  const PlaylistPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<PlaylistProvider>(builder: (context, provider, _) {
      return Scaffold(
        appBar: AppBar(title: const Text('My Playlist')),
        body: Column(
          children: [
            Expanded(
              child: provider.isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : provider.error != null
                      ? Center(child: Text('Error: ${provider.error}'))
                      : ListView.builder(
                          itemCount: provider.music.length,
                          itemBuilder: (context, index) {
                            final song = provider.music[index];
                            return ListTile(
                              leading: Image.network(song.imageUrl),
                              title: Text(song.title),
                              subtitle: Text(song.artist),
                              trailing:
                                  provider.nowPlaying?.title == song.title && provider.isPlaying
                                      ? const Icon(Icons.stop_circle)
                                      : const Icon(Icons.play_circle_outline),
                              onTap: () {
                                if (provider.nowPlaying?.title == song.title &&
                                    provider.isPlaying) {
                                  provider.stop();
                                } else {
                                  provider.playSong(song);
                                }
                              },
                            );
                          },
                        ),
            ),
            const PlayingBar()
          ],
        ),
      );
    });
  }
}
