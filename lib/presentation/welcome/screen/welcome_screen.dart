import 'package:flip_streak/presentation/styles/device_screen.dart';
import 'package:flip_streak/presentation/welcome/view/allow_notification_button.dart';
import 'package:flip_streak/presentation/welcome/view/info_widget.dart';
import 'package:flip_streak/presentation/welcome/view/navigation_widget.dart';
import 'package:flip_streak/provider/welcome_screen_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../app_constants/color_constants.dart';
import '../view/book_counter_input.dart';
import '../view/page_counter_input.dart';

class WelcomeScreen extends ConsumerWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    Pages currentPage = ref.watch(welcomeScreenProvider);

    return Container(
      color: Colors.white,
      child: Scaffold(
        backgroundColor: colorAccent.withOpacity(0.06),

        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(

                    children: [
                      alignmentSpace(context, false),

                      /// Info
                      InfoWidget(currentPage),

                      alignmentSpace(context, false),

                      /// Illustration
                      SvgPicture.asset(getIllustration(currentPage) , height: 200, fit: BoxFit.fitHeight,),

                      alignmentSpace(context, true),

                      /// Counter Input
                      getLeadingWidget(currentPage),

                      alignmentSpace(context, false),
                    ],
                  ),
                ),
              ),

              /// Back & Next
              NavigationWidget(currentPage),
            ]
          ),
        ),
      ),
    );
  }

  getIllustration(currentPage){
    switch(currentPage){
      case Pages.firstPage:
        return "assets/illustrations/pages_goal.svg";
      case Pages.secondPage:
        return "assets/illustrations/books_goal.svg";
      case Pages.thirdPage:
        return "assets/illustrations/notification_ill.svg";
    }
  }

  Widget getLeadingWidget(Pages currentPage){
    switch (currentPage){

      case Pages.firstPage:
        return PagesCounterInput(currentPage);

      case Pages.secondPage:
        return BooksCounterInput(currentPage);

      case Pages.thirdPage:
        return const AllowNotificationButton();
    }
  }

  Widget alignmentSpace(BuildContext context, bool isBig){
    double height;

    if(isBig) {
      height = DeviceScreen(context).height *0.18;
    } else {
      height = 40;
    }

    return SizedBox(height: height,);
  }
}
