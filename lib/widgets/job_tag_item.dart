import 'package:flutter/material.dart';

class JobTagItem extends StatelessWidget {
  final String tagName;

  JobTagItem(this.tagName);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(2),
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: Text(tagName),
      ),
      decoration:
      BoxDecoration(border: Border.all(width: 1), color: Colors.white38),
    );
  }
}