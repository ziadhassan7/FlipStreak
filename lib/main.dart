import 'package:flip_streak/core/constants/color_constants.dart';
import 'package:flip_streak/index_page/index_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'core/shared_pref/hive_client.dart';
import 'core/utils/system_util.dart';
import 'futures/goal/presentation/pages/welcome/welcome_screen.dart';
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


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static final HiveClient hiveClient = HiveClient();

  Widget getFirstScreen(){
    bool isAppFirstOpen = hiveClient.getFirstOpenState();

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
