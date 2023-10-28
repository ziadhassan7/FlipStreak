import 'package:flutter/widgets.dart';

class DeviceScreen{

  BuildContext context;

  late final double width;
  late final double height;

  DeviceScreen(this.context){
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
  }

}