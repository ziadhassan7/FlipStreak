import 'package:flip_streak/futures/books/presentation/pages/book/views/scroll_bar/scroll_icon.dart';
import 'package:flip_streak/futures/books/presentation/pages/book/views/scroll_bar/scroll_pages_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../managers/state_manager/scroll_view_provider.dart';

class CustomScrollBar extends ConsumerWidget {
  const CustomScrollBar({Key? key}) : super(key: key);

  static const double limit = 100; //screen limit

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return PositionedDirectional(
      end: 0,
      top: ref.watch(scrollViewPositionProvider),

      child: const Row(
        children: [
          ScrollPagesIndicator(),

          SizedBox(width: 10,),

          ScrollIcon(),
        ],
      ),
    );
  }
}
