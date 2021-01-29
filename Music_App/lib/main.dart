import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MusicApp(),
    );
  }
}

class MusicApp extends StatefulWidget {
  MusicApp({Key key}) : super(key: key);

  @override
  _MusicAppState createState() => _MusicAppState();
}

class _MusicAppState extends State<MusicApp> {
  bool _playing = false;
  IconData _playButton = Icons.play_arrow_rounded;

  AudioPlayer _player;
  AudioCache cache;

  Duration position = new Duration();
  Duration musicLength = new Duration();

  List<String> songs = new List();

  Widget slider() {
    return Slider.adaptive(
        activeColor: Colors.purple[900],
        inactiveColor: Colors.grey[700],
        value: position.inSeconds.toDouble(),
        max: musicLength.inSeconds.toDouble(),
        onChanged: (value) {
          seekTosecond(value.toInt());
        });
  }

  String songName;
  Widget dropDown() {
    return DropdownButton(
      hint: Text('Select Song'),
      value: songName,
      onChanged: (value) {
        setState(() {
          songName = value;
          _playing = false;
        });
      },
      items: songs
          .map(
            (song) => DropdownMenuItem(
              child: Text(song),
              value: song,
            ),
          )
          .toList(),
    );
  }

  void seekTosecond(int sec) {
    Duration newPos = Duration(seconds: sec);
    _player.seek(newPos);
  }

  @override
  void initState() {
    super.initState();
    _player = AudioPlayer();
    cache = AudioCache(fixedPlayer: _player);
    songs.add('Ivan B-Sweaters');
    songs.add('Kaise Hua');
    songs.add('Yeh Aaina');
    songs.add('Sun Mere Hamsafar');

    _player.durationHandler = (d) {
      setState(() {
        musicLength = d;
      });
    };

    _player.positionHandler = (p) {
      setState(() {
        position = p;
      });
    };

    cache.load('${songName}.mp3');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Colors.purple[900], Colors.red[900]]),
        ),
        child: Padding(
          padding: EdgeInsets.only(top: 48),
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 12.0),
                  child: Text(
                    'Music Player',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 38,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 12.0),
                  child: Text(
                    'Listen to your favourite music',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.w100),
                  ),
                ),
                SizedBox(
                  height: 36,
                ),
                Center(
                  child: GestureDetector(
                    onTap: () {
                      return dropDown();
                    },
                    child: Container(
                      width: 300,
                      height: 300,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(38.0),
                          image: DecorationImage(
                              image: AssetImage('assets/images.jpg'))),
                    ),
                  ),
                ),
                SizedBox(
                  height: 18,
                ),
                Container(
                  alignment: Alignment.center,
                  child: dropDown(),
                ),
                SizedBox(
                  height: 30,
                ),
                Expanded(
                    child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30.0),
                          topRight: Radius.circular(30.0)),
                      color: Colors.grey[900]),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          children: [
                            Text(
                              '${position.inMinutes}:${position.inSeconds.remainder(60)}',
                              style: TextStyle(
                                  fontSize: 18.0, color: Colors.white),
                            ),
                            Expanded(child: slider()),
                            Text(
                                '${musicLength.inMinutes}:${musicLength.inSeconds.remainder(60)}',
                                style: TextStyle(
                                    fontSize: 18.0, color: Colors.white)),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                              iconSize: 45.0,
                              icon: Icon(Icons.skip_previous_rounded),
                              color: Colors.pinkAccent,
                              onPressed: () {}),
                          IconButton(
                              iconSize: 62.0,
                              icon: Icon(_playButton),
                              color: Colors.purpleAccent,
                              onPressed: () {
                                if (!_playing) {
                                  cache.play('${songName}.mp3');
                                  setState(() {
                                    _playButton = Icons.pause_rounded;
                                    _playing = true;
                                  });
                                } else {
                                  _player.pause();
                                  setState(() {
                                    _playButton = Icons.play_arrow_rounded;
                                    _playing = false;
                                  });
                                }
                              }),
                          IconButton(
                              iconSize: 45.0,
                              icon: Icon(Icons.skip_next_rounded),
                              color: Colors.pinkAccent,
                              onPressed: () {})
                        ],
                      )
                    ],
                  ),
                )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
