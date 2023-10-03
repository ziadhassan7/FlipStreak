import 'package:flutter/material.dart';
import '../../styles/padding.dart';

class MyGroupedList<T, E> extends StatelessWidget {

  ///Normal List View
  MyGroupedList(
      {Key? key,
      required this.shrinkWrap,
      required this.items,
      required this.sortBy,
      required this.itemBuilder,
      required this.groupSeparatorBuilder,})
      : super(key: key);

  /// Grid List
  MyGroupedList.grid(
      {Key? key,
        required this.shrinkWrap,
        required this.items,
        required this.sortBy,
        required this.itemBuilder,
        required this.groupSeparatorBuilder,
        this.crossAxisCount,
        this.gridDelegate,
      })
      : super(key: key) {

    assert(crossAxisCount != null || gridDelegate != null);
  }

  final bool shrinkWrap;
  final List<T> items;
  final E Function(T) sortBy;
  final Widget Function(BuildContext, T) itemBuilder;
  final Widget Function(E) groupSeparatorBuilder;
  int? crossAxisCount;
  SliverGridDelegate? gridDelegate;

  static final List _sortHeaders = [];

  @override
  Widget build(BuildContext context) {

    _generateHeaderList();

    return groupWidget();
  }


  /// Main Widget - (Header & Group)
  Widget groupWidget(){
    return Column(
      children: [

        for(var header in _sortHeaders)
          Column(
            children: [
              Padding(
                padding: const CustomPadding(vertical: 20),
                child: groupSeparatorBuilder(header),
              ),
              sliverList(currentHeaderGroup(header))
            ],
          ),

      ],
    );

  }


  /// Current Group widget
  Widget sliverList(List currentGroup){
    return Padding(
      padding: const CustomPadding(top: 30),

      child: CustomScrollView(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        slivers: [
          SliverGrid(
            delegate: SliverChildBuilderDelegate(
              /// use count of headers
              childCount: currentGroup.length,
              (context, index) {
                return itemBuilder(context, items[index]);
              },
            ),

            gridDelegate: gridDelegate ?? SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: crossAxisCount ?? 1,
              childAspectRatio: 2 / 3.2,
              crossAxisSpacing: 25,
              mainAxisSpacing: 15,),
          )
        ],
      ),
    );
  }


  ///                                                                           / Functions

  // List of headers
  void _generateHeaderList(){

    for(var item in items){
      if(!_sortHeaders.contains(sortBy(item))){
        _sortHeaders.add(sortBy(item));
      }
    }
  }

  // List of groups
  currentHeaderGroup(var header){

    List currentGroup = [];

    for(var item in items){

      if(sortBy(item) == header){
        currentGroup.add(item);
      }
    }

    return currentGroup;
  }

}
