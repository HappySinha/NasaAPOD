import 'package:flutter/material.dart';
import 'package:webapp/apod.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var fHeigh = MediaQuery.of(context).size.height;
    var fWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
          title: Text("NASA APOD"),
        ),
        body: Container(
            child: Center(
                child: Stack(children: [
          Image.asset(
            "assets/galaxy.jpg",
            height: fHeigh,
            width: fWidth,
          ),
          Align(alignment: Alignment.bottomCenter, child: find())
        ]))));
  }

  Widget find() {
    // ignore: deprecated_member_use
    return RaisedButton(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(50)),
          side: BorderSide(color: Colors.blue, width: 2.0)),
      color: Colors.white12,
      onPressed: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Apod()));
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 8),
        child: Text("Find", style: TextStyle(fontSize: 24)),
      ),
    );
  }
}
