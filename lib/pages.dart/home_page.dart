import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prayertimes/pages.dart/listprayertimes.dart';
import 'package:intl/intl.dart';

class home_page extends StatefulWidget {
  const home_page({Key key}) : super(key: key);

  @override
  _home_pageState createState() => _home_pageState();
}

var city;

class _home_pageState extends State<home_page> {
  List<String> cities = ["ipoh", "putrajaya", "pekan", "segamat"];
  List<Widget> listofcity(listofcity) {
    String i;
    Widget tile;
    List<Widget> childrenlistview = [];
    for (i in listofcity) {
      String title = i;
      tile = ListTile(
        title: Text(toBeginningOfSentenceCase(i)),
        onTap: () {
          openPage(prayerTimes(title));
        },
      );
      childrenlistview.add(tile);
    }
    return childrenlistview;
  }

  void openPage(where) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => where));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Select City",
        ),
      ),
      body: ListView(children: listofcity(cities)),
    );
  }
}
