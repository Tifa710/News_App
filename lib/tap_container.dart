import 'package:flutter/material.dart';
import 'package:untitled19/NewsContainer.dart';
import 'package:untitled19/tap_item.dart';

import 'model/sourceRespones.dart';

class Tap_container extends StatefulWidget {
  List<Source> sourceList;

  Tap_container({required this.sourceList});

  @override
  State<Tap_container> createState() => _Tap_containerState();
}

class _Tap_containerState extends State<Tap_container> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: widget.sourceList.length,
        child: Column(
          children: [
            TabBar(
                onTap: (index) {
                  selectedIndex = index;
                  setState(() {});
                },
                isScrollable: true,
                indicatorColor: Colors.transparent,
                tabs: widget.sourceList
                    .map((source) => Tap_Item(
                        source: source,
                        isSelected:
                            selectedIndex == widget.sourceList.indexOf(source)))
                    .toList()),
            NewsContainer(source:widget.sourceList[selectedIndex])
          ],
        ));
  }
}
