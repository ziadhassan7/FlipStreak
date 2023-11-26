import 'package:flip_streak/core/constants/color_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import '../futures/books/presentation/pages/home/screen/home_page.dart';
import '../futures/books/presentation/pages/library/screen/library_page.dart';
import '../futures/goal/presentation/pages/achievements/achievements_page.dart';
import '../futures/notes/presentation/pages/note_index/screen/notes_page.dart';
import 'nav_bar_provider.dart';

class IndexPage extends ConsumerWidget {
  IndexPage({Key? key,}) : super(key: key);

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    _currentIndex = ref.watch(navBarProvider);

    return Scaffold(

      body: IndexedStack(
          index: _currentIndex,
          children: const [
            HomePage(),
            LibraryPage(),
            NoteIndexPage(),
            AchievementsPage(),
          ]
      ),

      bottomNavigationBar: Material(

        elevation: 5,

        child: SalomonBottomBar(
          //settings
          margin: EdgeInsets.symmetric(
              horizontal: getAdaptiveMargin(context),
              vertical: 14),
          //itemPadding: const EdgeInsets.symmetric(horizontal: 22, vertical: 12),
          backgroundColor: getNavBarColor(_currentIndex),
          currentIndex: _currentIndex,
          //tap
          onTap: (newIndex) {
              ref.read(navBarProvider.notifier).changeIndex(newIndex);
          },
          //items
          items: [

            /// Home
            navBarItem(
              title: "Home",
              iconPath: "assets/icons/home.svg",
              itemIndex: 0,
            ),

            /// Library
            navBarItem(
              title: "Library",
              iconPath: "assets/icons/library.svg",
              itemIndex: 1,
            ),

            /// Notes
            navBarItem(
              title: "Notes",
              iconPath: "assets/icons/note.svg",
              itemIndex: 2,
            ),

            /// Achievements
            navBarItem(
              title: "Achievements",
              iconPath: "assets/icons/achievement.svg",
              itemIndex: 3,
            ),

          ],
        ),
      ),


    );
  }


  navBarItem({required String title,
    required String iconPath,
    required int itemIndex,}) {
    Color selectColor = colorAccent;
    Color defaultColor = colorBrown.withOpacity(0.6);

    return SalomonBottomBarItem(
      icon: SvgPicture.asset(
          iconPath,
          height: 18,
          width: 18,
          color: itemIndex == _currentIndex
              ? selectColor
              : defaultColor
      ),

      title: Text(title),

      selectedColor: selectColor,
    );
  }


  Color getNavBarColor(int index){

    switch(index){
      case 0:
        return colorSecondary.withOpacity(0.8);

      case 1:
        return colorSecondary.withOpacity(0.5);

      default:
        return colorSecondary.withOpacity(0.4);
    }

  }

  double getAdaptiveMargin(context){
    double screenWidth = MediaQuery.of(context).size.width;

    if(screenWidth > 800){
      return screenWidth*0.2;

    }

    if(screenWidth> 500){
      return screenWidth*0.1;

    }else {
      return 25;
    }
  }
}
