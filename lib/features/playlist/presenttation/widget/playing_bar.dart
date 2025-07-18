import 'package:flutter/material.dart';
import 'package:music_app/features/playlist/presenttation/provider/playlist_provider.dart';
import 'package:provider/provider.dart';

class PlayingBar extends StatelessWidget {
  const PlayingBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<PlaylistProvider>(
      builder: (context, provider,_ ) {
        final song = provider.nowPlaying;
        if (song == null) return const SizedBox();

        return Container(
          color: Colors.yellow[700],
          padding: const EdgeInsets.all(8),
          child: Row(
            children: [
              Image.network(
                song.imageUrl,
                width: 50,
                height: 50,
                fit: BoxFit.cover,
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(song.title, style: const TextStyle(fontWeight: FontWeight.bold)),
                    Text(song.artist),
                  ],
                ),
              ),
              IconButton(
                icon: Icon(
                  provider.isPlaying ? Icons.stop : Icons.play_arrow,
                ),
                onPressed: () {
                  if (provider.isPlaying) {
                    provider.stop();
                  } else {
                    provider.playSong(song);
                  }
                },
              )
            ],
          ),
        );
      },
    );
  }
}