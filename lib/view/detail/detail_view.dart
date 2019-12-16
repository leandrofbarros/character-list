import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DetailView extends StatelessWidget {
  DetailView(this.id);
  final String id;
  final httpClient = new HttpClient();
  final API = "5ca369c58bae720014a9623e.mockapi.io";
  final PATH = "/data/";

  Future getDataDetail(id) async {
    var httpClient = new HttpClient();
    var uri =
    new Uri.http(API, PATH + id);
    var request = await httpClient.getUrl(uri);
    var response = await request.close();
    return jsonDecode(await response.transform(utf8.decoder).join());
  }


  final _textStyleSection = new TextStyle(
      fontSize: 20.0, fontStyle: FontStyle.italic, fontWeight: FontWeight.bold);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(title: new Text("Detail")),
        body: new FutureBuilder(
            future: getDataDetail(this.id),
            builder: (ctx, snapshot) {
              print(snapshot.hasData);
              if (!snapshot.hasData) {
                return new Center(
                  child: new CircularProgressIndicator(),
                );
              }
              var data = snapshot.data;
              return new Container(
                  padding: new EdgeInsets.all(16.0),
                  child: new Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      new Container(
                        padding: new EdgeInsets.only(top: 8.0),
                        child: new Text(
                          "ID: ${data['id']}",
                          style: _textStyleSection,
                        ),
                      ),
                      new Container(
                        padding: new EdgeInsets.only(top: 8.0),
                        child: new Text(
                          "Name: ${data['name']}",
                          style: _textStyleSection,
                        ),
                      ),
                      Image.network(
                        "${data['avatar']}",
                      ),
                    ],
                  ));
            }));
  }
}