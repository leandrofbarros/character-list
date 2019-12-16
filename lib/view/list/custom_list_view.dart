import 'package:character_list/components/item_list_view.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'dart:io';

class CustomListView extends StatelessWidget {
  final API = "5ca369c58bae720014a9623e.mockapi.io";
  final PATH = "/data";

  Future<List> getDataList() async {
    var httpClient = new HttpClient();
    var uri = new Uri.http(API, PATH);
    var request = await httpClient.getUrl(uri);
    var response = await request.close();
    return jsonDecode(await response.transform(utf8.decoder).join());
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
            title: new Text("List", style: new TextStyle(color: Colors.white))),
        body: new FutureBuilder(
          future: getDataList(),
          builder: (ctx, snapshot) {
            if (!snapshot.hasData) return new Container();
            return new ListViewItem(snapshot.data);
          },
        ));
  }
}