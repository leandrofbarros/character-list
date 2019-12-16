
import 'package:character_list/view/detail/detail_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ListViewItem extends StatelessWidget {
  ListViewItem(this.data);
  List data;
  @override
  Widget build(BuildContext context) {
    return new ListView.builder(itemBuilder: (ctx, i) {
      if (i.isOdd) return new Divider();
      int index = i ~/ 2;
      Map item = data[index];
      return new ListTile(
          onTap: () {
            Navigator.push(
              context,
              new CupertinoPageRoute(
                  builder: (context) => new DetailView(item['id'])),
            );
          },
          title: new Text(item['name']));
    });
  }
}