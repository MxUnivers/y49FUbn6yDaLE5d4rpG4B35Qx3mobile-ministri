import "package:flutter/material.dart";
import "package:video_player/video_player.dart";
import "package:chewie/chewie.dart";

class DetailVideoPage extends StatefulWidget {
  const DetailVideoPage({Key? key}) : super(key: key);

  @override
  State<DetailVideoPage> createState() => _DetailVideoPageState();
}

class _DetailVideoPageState extends State<DetailVideoPage> {
  late VideoPlayerController _videoPlayerController;
  late ChewieController _chewieController;
  @override
  void initState() {
    super.initState();
    _videoPlayerController = VideoPlayerController.network(
        'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4');
    _chewieController = ChewieController(
      videoPlayerController: _videoPlayerController,
      autoPlay: true,
      looping: true,
      subtitle: Subtitles([
        Subtitle(
          index: 0,
          start: Duration.zero,
          end: const Duration(seconds: 10),
          text: 'Hello from subtitles',
        ),
        Subtitle(
          index: 1,
          start: const Duration(seconds: 10),
          end: const Duration(seconds: 20),
          text: 'Whats up? :)',
        ),
      ]),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _videoPlayerController.dispose();
    _chewieController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Column(
              children: [
                Container(
                  color: Colors.black,
                  width: double.infinity,
                  child: Column(
                    children: [
                      Container(
                        height: 300,
                        width: double.infinity,
                        child: Chewie(
                          controller: _chewieController,
                        ),
                      ),
                      Card(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            const ListTile(
                              leading: Icon(Icons.add_circle),
                              title: Text('The Enchanted Nightingale'),
                              subtitle: Text(
                                  'Music by Julie Gable. Lyrics by Sidney Stein.'),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: <Widget>[
                                IconButton(
                                  onPressed: () {/* ... */},
                                  icon: Icon(Icons.sms),
                                ),
                                const SizedBox(width: 8),
                                IconButton(
                                  onPressed: () {/* ... */},
                                  icon: Icon(Icons.sms),
                                ),
                                const SizedBox(width: 8),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class CommentListComponent extends StatefulWidget {
  const CommentListComponent({Key? key}) : super(key: key);

  @override
  State<CommentListComponent> createState() => _CommentListComponentState();
}

class _CommentListComponentState extends State<CommentListComponent> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          width: double.infinity,
          height: 200,
          color: Colors.blue,
        ),
        Positioned(
          top: 50,
          left: 50,
          child: Container(
            width: double.infinity,
            height: 100,
            color: Colors.red,
          ),
        ),
      ],
    );
  }
}

