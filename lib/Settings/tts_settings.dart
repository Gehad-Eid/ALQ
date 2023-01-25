// import 'dart:async';
// import 'dart:io' show Platform;
// import 'package:flutter/foundation.dart' show kIsWeb;
// import 'package:flutter/material.dart';
// import 'package:flutter_tts/flutter_tts.dart';
// class ttsSetting extends StatefulWidget {
//   @override
//   _ttsSettingState createState() => _ttsSettingState();
// }
// class _ttsSettingState extends State<ttsSetting> {
//   FlutterTts flutterTts = FlutterTts();
//   TextEditingController controller = TextEditingController();
//   double volume = 1.0;
//   double pitch = 1.0;
//   double speechRate = 0.5;
//   List<String>? languages;
//   String langCode = "en-US";
//   @override
//   void initState() {
//     super.initState();
//     init();
//   }
//   void init() async {
//     languages = List<String>.from(await flutterTts.getLanguages);
//     setState(() {});
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           centerTitle: true,
//           title: const Text("Text To Speech"),
//         ),
//         body: Container(
//           margin: const EdgeInsets.only(top: 20),
//           child: Center(
//             child: Column(children: [
//               Row(
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   SizedBox(
//                     width: 200,
//                     height: 60,
//                     child: TextField(
//                       controller: controller,
//                       decoration: const InputDecoration(
//                         border: OutlineInputBorder(),
//                         hintText: 'Enter Text',
//                       ),
//                     ),
//                   ),
//                   const SizedBox(
//                     width: 10,
//                   ),
//                   ElevatedButton(
//                     child: const Text("Speak"),
//                     onPressed: _speak,
//                   ),
//                   const SizedBox(
//                     width: 10,
//                   ),
//                   ElevatedButton(
//                     child: const Text("Stop"),
//                     onPressed: _stop,
//                   ),
//                 ],
//               ),
//               Container(
//                 margin: const EdgeInsets.only(left: 10),
//                 child: Row(
//                   children: [
//                     const SizedBox(
//                       width: 80,
//                       child: Text(
//                         "Volume",
//                         style: TextStyle(fontSize: 17),
//                       ),
//                     ),
//                     Slider(
//                       min: 0.0,
//                       max: 1.0,
//                       value: volume,
//                       onChanged: (value) {
//                         setState(() {
//                           volume = value;
//                         });
//                       },
//                     ),
//                     Container(
//                       margin: const EdgeInsets.only(left: 10),
//                       child: Text(
//                           double.parse((volume).toStringAsFixed(2)).toString(),
//                           style: const TextStyle(fontSize: 17)),
//                     )
//                   ],
//                 ),
//               ),
//               Container(
//                 margin: const EdgeInsets.only(left: 10),
//                 child: Row(
//                   children: [
//                     const SizedBox(
//                       width: 80,
//                       child: Text(
//                         "Pitch",
//                         style: TextStyle(fontSize: 17),
//                       ),
//                     ),
//                     Slider(
//                       min: 0.5,
//                       max: 2.0,
//                       value: pitch,
//                       onChanged: (value) {
//                         setState(() {
//                           pitch = value;
//                         });
//                       },
//                     ),
//                     Container(
//                       margin: const EdgeInsets.only(left: 10),
//                       child: Text(
//                           double.parse((pitch).toStringAsFixed(2)).toString(),
//                           style: const TextStyle(fontSize: 17)),
//                     )
//                   ],
//                 ),
//               ),
//               Container(
//                 margin: const EdgeInsets.only(left: 10),
//                 child: Row(
//                   children: [
//                     const SizedBox(
//                       width: 80,
//                       child: Text(
//                         "Speech Rate",
//                         style: TextStyle(fontSize: 17),
//                       ),
//                     ),
//                     Slider(
//                       min: 0.0,
//                       max: 1.0,
//                       value: speechRate,
//                       onChanged: (value) {
//                         setState(() {
//                           speechRate = value;
//                         });
//                       },
//                     ),
//                     Container(
//                       margin: const EdgeInsets.only(left: 10),
//                       child: Text(
//                           double.parse((speechRate).toStringAsFixed(2))
//                               .toString(),
//                           style: const TextStyle(fontSize: 17)),
//                     )
//                   ],
//                 ),
//               ),
//               if (languages != null)
//                 Container(
//                   margin: const EdgeInsets.only(left: 10),
//                   child: Row(
//                     children: [
//                       const Text(
//                         "Language :",
//                         style: TextStyle(fontSize: 17),
//                       ),
//                       const SizedBox(
//                         width: 10,
//                       ),
//                       DropdownButton<String>(
//                         focusColor: Colors.white,
//                         value: langCode,
//                         style: const TextStyle(color: Colors.white),
//                         iconEnabledColor: Colors.black,
//                         items: languages!
//                             .map<DropdownMenuItem<String>>((String? value) {
//                           return DropdownMenuItem<String>(
//                             value: value!,
//                             child: Text(
//                               value,
//                               style: const TextStyle(color: Colors.black),
//                             ),
//                           );
//                         }).toList(),
//                         onChanged: (String? value) {
//                           setState(() {
//                             langCode = value!;
//                           });
//                         },
//                       ),
//                     ],
//                   ),
//                 )
//             ]),
//           ),
//         ));
//   }
//   void initSetting() async {
//     await flutterTts.setVolume(volume);
//     await flutterTts.setPitch(pitch);
//     await flutterTts.setSpeechRate(speechRate);
//     await flutterTts.setLanguage(langCode);
//   }
//   void _speak() async {
//     initSetting();
//     await flutterTts.speak(controller.text);
//   }
//   void _stop() async {
//     await flutterTts.stop();
//   }
// }

import 'dart:async';
import 'dart:io' show Platform;
import 'package:flutter/foundation.dart' show kIsWeb;

import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

class ttsSetting extends StatefulWidget {
  @override
  _ttsSettingState createState() => _ttsSettingState();
}

enum TtsState { playing, stopped, paused, continued }

class _ttsSettingState extends State<ttsSetting> {
  late FlutterTts flutterTts;
  String? language;
  String? engine;
  double volume = 0.5;
  double pitch = 1.0;
  double rate = 0.5;
  bool isCurrentLanguageInstalled = false;

  String? _newVoiceText;
  int? _inputLength;

  TtsState ttsState = TtsState.stopped;

  get isPlaying => ttsState == TtsState.playing;
  get isStopped => ttsState == TtsState.stopped;
  get isPaused => ttsState == TtsState.paused;
  get isContinued => ttsState == TtsState.continued;

  bool get isIOS => !kIsWeb && Platform.isIOS;
  bool get isAndroid => !kIsWeb && Platform.isAndroid;
  bool get isWindows => !kIsWeb && Platform.isWindows;
  bool get isWeb => kIsWeb;

  @override
  initState() {
    super.initState();
    initTts();
  }

  initTts() {
    flutterTts = FlutterTts();

    _setAwaitOptions();

    if (isAndroid) {
      _getDefaultEngine();
      _getDefaultVoice();
    }

    flutterTts.setStartHandler(() {
      setState(() {
        print("Playing");
        ttsState = TtsState.playing;
      });
    });

    if (isAndroid) {
      flutterTts.setInitHandler(() {
        setState(() {
          print("TTS Initialized");
        });
      });
    }

    flutterTts.setCompletionHandler(() {
      setState(() {
        print("Complete");
        ttsState = TtsState.stopped;
      });
    });

    flutterTts.setCancelHandler(() {
      setState(() {
        print("Cancel");
        ttsState = TtsState.stopped;
      });
    });

    flutterTts.setPauseHandler(() {
      setState(() {
        print("Paused");
        ttsState = TtsState.paused;
      });
    });

    flutterTts.setContinueHandler(() {
      setState(() {
        print("Continued");
        ttsState = TtsState.continued;
      });
    });

    flutterTts.setErrorHandler((msg) {
      setState(() {
        print("error: $msg");
        ttsState = TtsState.stopped;
      });
    });
  }

  Future<dynamic> _getLanguages() async => await flutterTts.getLanguages;

  Future<dynamic> _getEngines() async => await flutterTts.getEngines;

  Future _getDefaultEngine() async {
    var engine = await flutterTts.getDefaultEngine;
    if (engine != null) {
      print(engine);
    }
  }

  Future _getDefaultVoice() async {
    var voice = await flutterTts.getDefaultVoice;
    if (voice != null) {
      print(voice);
    }
  }

  Future _speak() async {
    await flutterTts.setVolume(volume);
    await flutterTts.setSpeechRate(rate);
    await flutterTts.setPitch(pitch);

    if (_newVoiceText != null) {
      if (_newVoiceText!.isNotEmpty) {
        await flutterTts.speak(_newVoiceText!);
      }
    }
  }

  Future _setAwaitOptions() async {
    await flutterTts.awaitSpeakCompletion(true);
  }

  Future _stop() async {
    var result = await flutterTts.stop();
    if (result == 1) setState(() => ttsState = TtsState.stopped);
  }

  Future _pause() async {
    var result = await flutterTts.pause();
    if (result == 1) setState(() => ttsState = TtsState.paused);
  }

  @override
  void dispose() {
    super.dispose();
    flutterTts.stop();
  }

  List<DropdownMenuItem<String>> getEnginesDropDownMenuItems(dynamic engines) {
    var items = <DropdownMenuItem<String>>[];
    for (dynamic type in engines) {
      items.add(DropdownMenuItem(
          value: type as String?, child: Text(type as String)));
    }
    return items;
  }

  void changedEnginesDropDownItem(String? selectedEngine) async {
    await flutterTts.setEngine(selectedEngine!);
    language = null;
    setState(() {
      engine = selectedEngine;
    });
  }

  List<DropdownMenuItem<String>> getLanguageDropDownMenuItems(
      dynamic languages) {
    var items = <DropdownMenuItem<String>>[];
    for (dynamic type in languages) {
      items.add(DropdownMenuItem(
          value: type as String?, child: Text(type as String)));
    }
    return items;
  }

  void changedLanguageDropDownItem(String? selectedType) {
    setState(() {
      language = selectedType;
      flutterTts.setLanguage(language!);
      if (isAndroid) {
        flutterTts
            .isLanguageInstalled(language!)
            .then((value) => isCurrentLanguageInstalled = (value as bool));
      }
    });
  }

  void _onChange(String text) {
    setState(() {
      _newVoiceText = text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Flutter TTS'),
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              _inputSection(),
              _btnSection(),
              _engineSection(),
              _futureBuilder(),
              _buildSliders(),
              if (isAndroid) _getMaxSpeechInputLengthSection(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _engineSection() {
    if (isAndroid) {
      return FutureBuilder<dynamic>(
          future: _getEngines(),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            if (snapshot.hasData) {
              return _enginesDropDownSection(snapshot.data);
            } else if (snapshot.hasError) {
              return Text('Error loading engines...');
            } else
              return Text('Loading engines...');
          });
    } else
      return Container(width: 0, height: 0);
  }

  Widget _futureBuilder() => FutureBuilder<dynamic>(
      future: _getLanguages(),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if (snapshot.hasData) {
          return _languageDropDownSection(snapshot.data);
        } else if (snapshot.hasError) {
          return Text('Error loading languages...');
        } else
          return Text('Loading Languages...');
      });

  Widget _inputSection() => Container(
      alignment: Alignment.topCenter,
      padding: EdgeInsets.only(top: 25.0, left: 25.0, right: 25.0),
      child: TextField(
        maxLines: 11,
        minLines: 6,
        onChanged: (String value) {
          _onChange(value);
        },
      ));

  Widget _btnSection() {
    return Container(
      padding: EdgeInsets.only(top: 50.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildButtonColumn(Colors.green, Colors.greenAccent, Icons.play_arrow,
              'PLAY', _speak),
          _buildButtonColumn(
              Colors.red, Colors.redAccent, Icons.stop, 'STOP', _stop),
          _buildButtonColumn(
              Colors.blue, Colors.blueAccent, Icons.pause, 'PAUSE', _pause),
        ],
      ),
    );
  }

  Widget _enginesDropDownSection(dynamic engines) => Container(
        padding: EdgeInsets.only(top: 50.0),
        child: DropdownButton(
          value: engine,
          items: getEnginesDropDownMenuItems(engines),
          onChanged: changedEnginesDropDownItem,
        ),
      );

  Widget _languageDropDownSection(dynamic languages) => Container(
      padding: EdgeInsets.only(top: 10.0),
      child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        DropdownButton(
          value: language,
          items: getLanguageDropDownMenuItems(languages),
          onChanged: changedLanguageDropDownItem,
        ),
        Visibility(
          visible: isAndroid,
          child: Text("Is installed: $isCurrentLanguageInstalled"),
        ),
      ]));

  Column _buildButtonColumn(Color color, Color splashColor, IconData icon,
      String label, Function func) {
    return Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
              icon: Icon(icon),
              color: color,
              splashColor: splashColor,
              onPressed: () => func()),
          Container(
              margin: const EdgeInsets.only(top: 8.0),
              child: Text(label,
                  style: TextStyle(
                      fontSize: 12.0,
                      fontWeight: FontWeight.w400,
                      color: color)))
        ]);
  }

  Widget _getMaxSpeechInputLengthSection() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ElevatedButton(
          child: Text('Get max speech input length'),
          onPressed: () async {
            _inputLength = await flutterTts.getMaxSpeechInputLength;
            setState(() {});
          },
        ),
        Text("$_inputLength characters"),
      ],
    );
  }

  Widget _buildSliders() {
    return Column(
      children: [_volume(), _pitch(), _rate()],
    );
  }

  Widget _volume() {
    return Slider(
        value: volume,
        onChanged: (newVolume) {
          setState(() => volume = newVolume);
        },
        min: 0.0,
        max: 1.0,
        divisions: 10,
        label: "Volume: $volume");
  }

  Widget _pitch() {
    return Slider(
      value: pitch,
      onChanged: (newPitch) {
        setState(() => pitch = newPitch);
      },
      min: 0.5,
      max: 2.0,
      divisions: 15,
      label: "Pitch: $pitch",
      activeColor: Colors.red,
    );
  }

  Widget _rate() {
    return Slider(
      value: rate,
      onChanged: (newRate) {
        setState(() => rate = newRate);
      },
      min: 0.0,
      max: 1.0,
      divisions: 10,
      label: "Rate: $rate",
      activeColor: Colors.green,
    );
  }
}
