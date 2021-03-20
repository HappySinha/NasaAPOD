import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class Apod extends StatefulWidget {
  @override
  _ApodState createState() => _ApodState();
}

class _ApodState extends State<Apod> {
  var api =
      "https://api.nasa.gov/planetary/apod?api_key=aWPhODExHc5j48m59viPzCysv1jkoaN7ID2dchPw&date=2017-07-10";
  var res, nasa;
  @override
  void initState() {
    super.initState();
    fetchData();
  }

  fetchData() async {
    res = await http.get(api);
    print('Response body: ${res.body}');

    setState(() {});
    nasa = jsonDecode(res.body);
  }

  Widget build(BuildContext context) {
    var fWidth = MediaQuery.of(context).devicePixelRatio;
    return Scaffold(
        appBar:
            AppBar(title: Text("NASA APOD"), actions: [Icon(Icons.arrow_back)]),
        body: Center(
          child: nasa != null
              ? ListView(children: [
                  Image.network(nasa["url"], width: fWidth),
                  Padding(
                      padding: const EdgeInsets.all(12),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 18),
                            Text("Title: ${nasa["title"]}",
                                style: TextStyle(
                                    fontSize: 22, fontWeight: FontWeight.bold)),
                            SizedBox(height: 8),
                            Text("Date: ${nasa["date"]}",
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold)),
                            SizedBox(height: 16),
                            Text(nasa["explanation"],
                                style: TextStyle(fontSize: 15))
                          ]))
                ])
              : CircularProgressIndicator(),
        ));
  }
}
