import 'package:flutter/services.dart' as services;
import "package:chewie/chewie.dart" as chewie;
import "package:video_player/video_player.dart" as video_player;
import 'package:flutter/material.dart';
import "dart:io" as io;

enum Language { english, spanish, german, french }

String languageToLangCode(Language lang) => switch (lang) {
  Language.english => "en",
  Language.spanish => "es",
  Language.german => "de",
  Language.french => "fr",
};

enum Video { kiosk, workshop, wheel, paintJob }

const videosBasePath = "/storage/emulated/0/Movies/videos";

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await services.SystemChrome.setPreferredOrientations(const [
    services.DeviceOrientation.landscapeLeft,
    services.DeviceOrientation.landscapeRight,
  ]);

  await services.SystemChrome.setEnabledSystemUIMode(
    services.SystemUiMode.immersiveSticky,
  );

  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Tour",
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: const Color(0xFF2196F3),
        brightness: Brightness.dark,
      ),
      home: const LanguageSelectionPage(),
    );
  }
}

class LanguageSelectionPage extends StatelessWidget {
  const LanguageSelectionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/img/background-building.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: const Text(
                    "¡Bienvenido!",
                    style: TextStyle(fontSize: 48),
                  ),
                ),
                const Text(
                  "Seleccione su idioma",
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(height: 32),
                Row(
                  children: [
                    Expanded(
                      child: FilledButton.icon(
                        onPressed: () => Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (_) => const VideoSelectionPage(
                              translation: VideoSelectionPageTranslation.es(),
                            ),
                          ),
                        ),
                        icon: Image.asset("assets/img/flag-es.jpg", height: 16),
                        label: const Text("Español"),
                      ),
                    ),
                    SizedBox(width: 32),
                    Expanded(
                      child: FilledButton.icon(
                        onPressed: () => Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (_) => const VideoSelectionPage(
                              translation: VideoSelectionPageTranslation.en(),
                            ),
                          ),
                        ),
                        icon: Image.asset("assets/img/flag-en.jpg", height: 16),
                        label: const Text("English"),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 32),
                Row(
                  children: [
                    Expanded(
                      child: FilledButton.icon(
                        onPressed: () => Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (_) => const VideoSelectionPage(
                              translation: VideoSelectionPageTranslation.fr(),
                            ),
                          ),
                        ),
                        icon: Image.asset("assets/img/flag-fr.jpg", height: 16),
                        label: const Text("Français"),
                      ),
                    ),
                    SizedBox(width: 32),
                    Expanded(
                      child: FilledButton.icon(
                        onPressed: () => Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (_) => const VideoSelectionPage(
                              translation: VideoSelectionPageTranslation.de(),
                            ),
                          ),
                        ),
                        icon: Image.asset("assets/img/flag-de.jpg", height: 16),
                        label: const Text("Deutsch"),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class VideoSelectionPageTranslation {
  final Language language;
  final String zone;
  final String selectZone;
  final String kiosk;
  final String workshop;
  final String wheel;
  final String paintJob;

  const VideoSelectionPageTranslation({
    required this.language,
    required this.zone,
    required this.selectZone,
    required this.kiosk,
    required this.workshop,
    required this.wheel,
    required this.paintJob,
  });

  const VideoSelectionPageTranslation.en()
    : this(
        language: Language.english,
        zone: "Zone",
        selectZone: "Select Your Zone",
        kiosk: "Kiosk",
        workshop: "Workshop",
        wheel: "Wheel",
        paintJob: "Paint Job",
      );

  const VideoSelectionPageTranslation.es()
    : this(
        language: Language.spanish,
        zone: "Zona",
        selectZone: "Seleccione su Zona",
        kiosk: "Kiosko",
        workshop: "Taller",
        wheel: "Rueda",
        paintJob: "Pintura",
      );

  const VideoSelectionPageTranslation.de()
    : this(
        language: Language.german,
        zone: "Zone",
        selectZone: "Wählen Sie Ihre Zone",
        kiosk: "Kiosk",
        workshop: "Werkstatt",
        wheel: "Wagenrad",
        paintJob: "Bemalung",
      );

  const VideoSelectionPageTranslation.fr()
    : this(
        language: Language.french,
        zone: "Zone",
        selectZone: "Sélectionnez votre zone",
        kiosk: "kiosque",
        workshop: "atelier",
        wheel: "roue",
        paintJob: "peinture",
      );
}

class VideoSelectionPage extends StatelessWidget {
  final VideoSelectionPageTranslation _trans;

  const VideoSelectionPage({
    super.key,
    required VideoSelectionPageTranslation translation,
  }) : _trans = translation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(backgroundColor: Colors.transparent, elevation: 0),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/img/background-wheel.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Text(_trans.zone, style: TextStyle(fontSize: 48)),
                ),
                Text(_trans.selectZone, style: TextStyle(fontSize: 20)),
                SizedBox(height: 32),
                Row(
                  children: [
                    Expanded(
                      child: FilledButton.icon(
                        onPressed: () => Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (_) => VideoPlayerPage(
                              language: _trans.language,
                              video: Video.kiosk,
                            ),
                          ),
                        ),
                        icon: Image.asset(
                          "assets/img/video-kiosk.jpg",
                          height: 16,
                        ),
                        label: Text(_trans.kiosk),
                      ),
                    ),
                    SizedBox(width: 32),
                    Expanded(
                      child: FilledButton.icon(
                        onPressed: () => Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (_) => VideoPlayerPage(
                              language: _trans.language,
                              video: Video.workshop,
                            ),
                          ),
                        ),
                        icon: Image.asset(
                          "assets/img/video-workshop.jpg",
                          height: 16,
                        ),
                        label: Text(_trans.workshop),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 32),
                Row(
                  children: [
                    Expanded(
                      child: FilledButton.icon(
                        onPressed: () => Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (_) => VideoPlayerPage(
                              language: _trans.language,
                              video: Video.wheel,
                            ),
                          ),
                        ),
                        icon: Image.asset(
                          "assets/img/video-wheel.jpg",
                          height: 16,
                        ),
                        label: Text(_trans.wheel),
                      ),
                    ),
                    SizedBox(width: 32),
                    Expanded(
                      child: FilledButton.icon(
                        onPressed: () => Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (_) => VideoPlayerPage(
                              language: _trans.language,
                              video: Video.paintJob,
                            ),
                          ),
                        ),
                        icon: Image.asset(
                          "assets/img/video-paintjob.jpg",
                          height: 16,
                        ),
                        label: Text(_trans.paintJob),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class VideoPlayerPage extends StatefulWidget {
  final Language language;
  final Video video;

  const VideoPlayerPage({
    super.key,
    required this.language,
    required this.video,
  });

  @override
  State<VideoPlayerPage> createState() => _VideoPlayerPageState();
}

class _VideoPlayerPageState extends State<VideoPlayerPage> {
  late video_player.VideoPlayerController videoController;
  late chewie.ChewieController chewieController;

  String videoPath() {
    final langCode = languageToLangCode(widget.language);

    final path = switch (widget.video) {
      Video.kiosk => "$langCode/kiosk.mp4",
      Video.paintJob => "$langCode/paintjob.mp4",
      Video.workshop => "$langCode/workshop.mp4",
      Video.wheel => "$langCode/wheel.mp4",
    };

    return io.Platform.isAndroid
        ? "$videosBasePath/$path"
        : "/Users/joseprogdp/dev/commercial/andres/guided-tour/guided_tour/assets/videos/$path";
  }

  @override
  void initState() {
    super.initState();

    final file = io.File(videoPath());

    if (!file.existsSync()) {
      throw "$file does not exist";
    }

    videoController = video_player.VideoPlayerController.file(file);

    chewieController = chewie.ChewieController(
      videoPlayerController: videoController,
      autoInitialize: true,
      autoPlay: true,
      fullScreenByDefault: true,
      allowedScreenSleep: false,
    );
  }

  @override
  void dispose() {
    super.dispose();

    videoController.dispose();
    chewieController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(elevation: 0, backgroundColor: Colors.transparent),
      body: Center(child: chewie.Chewie(controller: chewieController)),
    );
  }
}
