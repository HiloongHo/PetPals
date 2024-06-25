import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:video_player/video_player.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: VideoDownloader(),
    );
  }
}

class VideoDownloader extends StatefulWidget {
  @override
  _VideoDownloaderState createState() => _VideoDownloaderState();
}

class _VideoDownloaderState extends State<VideoDownloader> {
  VideoPlayerController? _controller;
  bool _isDownloading = false;
  String _progress = "";

  Future<void> _downloadVideo() async {
    setState(() {
      _isDownloading = true;
    });

    Dio dio = Dio();
    try {
      // 获取应用的临时目录
      Directory tempDir = await getTemporaryDirectory();
      String tempPath = tempDir.path;
      String filePath = '$tempPath/video.mp4';

      await dio.download(
        'https://www.example.com/path/to/video.mp4', // 替换为你的视频 URL
        filePath,
        onReceiveProgress: (received, total) {
          if (total != -1) {
            setState(() {
              _progress = (received / total * 100).toStringAsFixed(0) + "%";
            });
          }
        },
      );

      setState(() {
        _isDownloading = false;
        _progress = "Download completed";
        _controller = VideoPlayerController.file(File(filePath))
          ..initialize().then((_) {
            setState(() {});
            _controller!.play();
          });
      });
    } catch (e) {
      setState(() {
        _isDownloading = false;
        _progress = "Download failed";
      });
      print(e);
    }
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Video Downloader'),
      ),
      body: Center(
        child: _isDownloading
            ? Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(),
            SizedBox(height: 20),
            Text(_progress),
          ],
        )
            : _controller != null && _controller!.value.isInitialized
            ? AspectRatio(
          aspectRatio: _controller!.value.aspectRatio,
          child: VideoPlayer(_controller!),
        )
            : ElevatedButton(
          onPressed: _downloadVideo,
          child: Text("Download Video"),
        ),
      ),
      floatingActionButton: _controller != null && _controller!.value.isInitialized
          ? FloatingActionButton(
        onPressed: () {
          setState(() {
            _controller!.value.isPlaying
                ? _controller!.pause()
                : _controller!.play();
          });
        },
        child: Icon(
          _controller!.value.isPlaying ? Icons.pause : Icons.play_arrow,
        ),
      )
          : null,
    );
  }
}
