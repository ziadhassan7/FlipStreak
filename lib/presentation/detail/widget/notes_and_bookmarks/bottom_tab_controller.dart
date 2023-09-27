import 'package:flutter/material.dart';
import '../../../views/tabs_names_widget.dart';
import 'bookmarks/bookmark_list.dart';
import 'notes/notes_list.dart';

class BottomTabController extends StatelessWidget {
  const BottomTabController({Key? key}) : super(key: key);

  static const List<String> _tabs = ["Notes", "Bookmarks"];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: _tabs.length,

      child: Expanded( //All Column, has to be expanded
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 40),
          child: Column(
            children: [
              /// Tab Names
              const TabsWidget(
                tabList: _tabs,
                isRoundedBorder: false,
              ),

              /// Tab Content
              Expanded( //TabView, has to be expanded
                child: TabBarView(
                  children: [
                    //Notes
                    const NotesList(),

                    //Books
                    BookmarkList(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
