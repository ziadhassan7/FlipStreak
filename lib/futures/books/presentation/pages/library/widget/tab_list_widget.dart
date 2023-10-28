import 'package:flutter/material.dart';
import '../../../../../app_common_views/text_view/text_view.dart';
import 'list_item.dart';

class TabListWidget extends StatelessWidget {
  const TabListWidget({Key? key, required this.list}) : super(key: key);

  final List list;

  @override
  Widget build(BuildContext context) {
    return (list.isNotEmpty)

    ? ListView.builder(
        itemCount: list.length,
        itemBuilder: (context, index) {
          return ListItem(book: list[index],);
        })


    : const Center(child: TextView("Nothing here"),);
  }
}
