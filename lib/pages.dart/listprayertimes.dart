import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:http/http.dart' as http;
import 'package:prayertimes/constants/times.dart';
import 'dart:convert';

class prayerTimes extends StatefulWidget {
  String city;
  prayerTimes(
    this.city,
  );

  @override
  _prayerTimesState createState() => _prayerTimesState();
}

class _prayerTimesState extends State<prayerTimes> {
  Future<dynamic> _prayerTimesModel;

  var jsonMap;

  getTimes() async {
    var res = await http.get(Uri.parse(
        "https://api.pray.zone/v2/times/today.json?city=${widget.city}"));
    jsonMap = jsonDecode(res.body);
    setState(() {});
    return jsonMap;
  }

  List<Widget> timeTile(prop) {
    var i;
    var tile;
    List<Widget> childrenlist = [];
    for (i in prop) {
      tile = ListTile(
          title: Text(i),
          subtitle:
              Text(jsonMap["results"]["datetime"][0]["times"][i].toString()));
      childrenlist.add(tile);
    }
    return childrenlist;
  }

  @override
  void initState() {
    super.initState();
    getTimes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: jsonMap != null
                ? Text(jsonMap["results"]["location"]["city"].toString())
                : Text("")),
        body: jsonMap != null
            ? ListView(children: timeTile(Times.properties))
            : Center(child: Container(height : 100, width : 100,child: LoadingIndicator(indicatorType: Indicator.cubeTransition))));
  }
}
