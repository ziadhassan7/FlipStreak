import 'package:flutter/material.dart';
import '../../../../../../core/styles/padding.dart';

class ZiGroupedList<T, E> extends StatelessWidget {

  ///Normal List View
  ZiGroupedList(
      {Key? key,
      required this.shrinkWrap,
      required this.items,
      required this.sortBy,
      required this.itemBuilder,
      required this.groupSeparatorBuilder,
      this.descendingOrder = true})
      : super(key: key);

  /// Grid List
  ZiGroupedList.grid(
      {Key? key,
        required this.shrinkWrap,
        required this.items,
        required this.sortBy,
        required this.itemBuilder,
        required this.groupSeparatorBuilder,
        this.crossAxisCount,
        this.gridDelegate,
        this.descendingOrder = true
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
  bool descendingOrder;

  static final List _sortHeaders = [];

  @override
  Widget build(BuildContext context) {

    _generateHeaderList();

    return groupWidget(context);
  }


  /// Main Widget - (Header & Group)
  Widget groupWidget(BuildContext context){
    return Column(
      children: [

        for(var header in _sortHeaders)
          Column(
            children: [
              //header
              Padding(
                padding: const CustomPadding(vertical: 20),
                child: groupSeparatorBuilder(header),
              ),
              //group
              sliverList(getGroupByHeader(header)),
            ],
          ),

      ],
    );

  }


  // Your Group Widget
  Widget sliverList(List currentGroup){
    return Padding(
      padding: const CustomPadding(top: 30),

      child: CustomScrollView(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        slivers: [
          SliverGrid(
            delegate: SliverChildBuilderDelegate(
              // use count of group items
              childCount: currentGroup.length,
              (context, index) {
                return itemBuilder(context, currentGroup[index]);
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

    //arrange headers
    _sortHeaders.sort((a,b) {
      return descendingOrder
          ? b.compareTo(a)
          : a.compareTo(b);
    });
  }

  // List of groups
  getGroupByHeader(var header){

    List currentGroup = [];

    for(var item in items){
      if(sortBy(item) == header){
        currentGroup.add(item);
      }
    }

    return currentGroup;
  }

}
