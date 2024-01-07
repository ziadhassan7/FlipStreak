import 'package:flutter/material.dart';
import '../../../../../../../core/styles/device_screen.dart';

class BookAutoCompleteList extends StatelessWidget {
  const BookAutoCompleteList({
    super.key,
    required this.onSelected,
    required this.listOptions,
  });

  final AutocompleteOnSelected<String> onSelected;
  final Iterable<String> listOptions;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Material(
        elevation: 4.0,
        child: SizedBox(
          width: AppScreen(context).width *0.6,
          height: 200.0,
          child: ListView.builder(
            padding: const EdgeInsets.all(8.0),
            itemCount: listOptions.length,
            itemBuilder: (BuildContext context, int index) {
              final String option = listOptions.elementAt(index);
              return GestureDetector(
                onTap: () {
                  onSelected(option);
                },
                child: ListTile(
                  title: Text(option),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
