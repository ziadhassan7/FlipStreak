import 'dart:async';
import 'package:flip_streak/core/constants/color_constants.dart';
import 'package:flip_streak/index_page/index_page.dart';
import 'package:flip_streak/recieve_share_intent/recieve_share_intent.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_sharing_intent/flutter_sharing_intent.dart';
import 'package:flutter_sharing_intent/model/sharing_file.dart';
import 'core/custom_log.dart';
import 'core/shared_pref/hive_client.dart';
import 'core/utils/system_util.dart';
import 'features/goal/presentation/pages/welcome/welcome_screen.dart';
import 'injection.dart' as inject;

Future<void> main() async {
  //When you are initializing any future function, it is better to call,
  //ensure initialized as your first line of code, before runApp(),
  //and your initializers
  /*
    The WidgetFlutterBinding is used to interact with the Flutter engine.
    init()s needs to call native code to initialize 'That thing',
    and since the plugin needs to use platform channels to call the native code,
    which is done asynchronously therefore you have to call ensureInitialized()
    to make sure that you have an instance of the WidgetsBinding.
   */
  WidgetsFlutterBinding.ensureInitialized();
  //initialization
  await inject.init();

  runApp(
    // Adding ProviderScope enables Riverpod for the entire project
    const ProviderScope(child: MyApp()),
  );
}


class MyApp extends StatefulWidget {
  const MyApp({super.key});

  static final HiveClient hiveClient = HiveClient();

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  late StreamSubscription _intentDataStreamSubscription;
  List<SharedFile>? list;
  @override
  void initState() {
    super.initState();
    // For sharing images coming from outside the app while the app is in the memory
    _intentDataStreamSubscription = FlutterSharingIntent.instance.getMediaStream()
        .listen((List<SharedFile> value) {
      setState(() {list = value;});
    }, onError: (err) {
      Log.p("getIntentDataStream error: $err");
    });

    // For sharing images coming from outside the app while the app is closed
    FlutterSharingIntent.instance.getInitialSharing().then((List<SharedFile> value) {
      setState(() {list = value;});
    });
  }

  @override
  void dispose() {
    _intentDataStreamSubscription.cancel();
    super.dispose();
  }


  Widget getFirstScreen(){
    bool isAppFirstOpen = MyApp.hiveClient.getFirstOpenState();

    // If user shared a book to the app
    if(list != null && list!.isNotEmpty){
      return ReceiveShareIntent(list!);
    }

    // On first start, open guide screens
    if(isAppFirstOpen){
      return const WelcomeScreen();

    } else {
      return IndexPage();
    }
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    SystemUtil.disableStatusBarColor();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'FlipStreak',

      theme: ThemeData(
        useMaterial3: true,

        // you can just use
        //colorScheme: ColorScheme.fromSeed(seedColor: colorAccent),
        colorScheme: const ColorScheme(
          brightness: Brightness.light,
          primary: colorAccent,
          onPrimary: colorSecondary,
          secondary: colorSecondary,
          onSecondary: colorPrimary,
          error: Colors.red,
          onError: Colors.red,
          background: Colors.white,
          onBackground: Colors.black,
          surface: Colors.white,
          onSurface: Colors.black,
        ),
      ),

      home: getFirstScreen(),
    );
  }
}
