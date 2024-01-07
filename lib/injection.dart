import 'package:hive_flutter/hive_flutter.dart';
import 'core/constants/hive_keys.dart';
import 'core/utils/notification_util.dart';
import 'features/app_common_views/text_view/default_font.dart';
import 'features/app_common_views/text_view/text_view.dart';
import 'features/books/presentation/managers/controllers/helpers/streak/streak_state_util.dart';

Future<void> init() async {

  //Init default font
  TextViewInit.setDefaultFont(FontFamily.inriaSans);

  //Initialize Notification
  NotificationUtil.init();

  //Initialize Hive
  await Hive.initFlutter();
  await Hive.openBox(GLOBAL_DATA_BOX);

  //Update Streak
  StreakStateUtil.updateStreakState();
}