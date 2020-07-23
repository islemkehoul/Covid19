import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
//import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
//import 'dart:convert';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map result;
  Map cases;

  Future getJasonData() async {
    var response =  await http.get("https://api.thevirustracker.com/free-api?global=stats");

    result = json.decode(response.body);
    setState(() {
       cases = result["results"][0];
    cases.remove('source');
    print(cases);
    });
   
  }

 /* @override
  void initState() {
    super.initState();
    
  }*/

  @override
  Widget build(BuildContext context) {
    getJasonData();
    
    var cards = <Widget>[];
    cases.forEach((key, value) {
      cards.add(
        Card(
          child: Column(
            children: <Widget>[
              ListTile(
                
                title: Text('$value',
                style: TextStyle(
                  fontSize: 20,
                ),),
                subtitle: Text('$key',
                 style:GoogleFonts.montserrat(
                   fontSize: 15
                 ),
                 ),
              
              ),
              // Text('$key : $value'),
            ],
          ),
        ),
      );
    });
    return Scaffold(
        backgroundColor: Colors.grey[700],
        appBar: AppBar(
          backgroundColor: Colors.red,
          title :Text('Covid19 Global Statistics ')),
        body: RefreshIndicator(
          onRefresh: getJasonData,
          child: ListView.builder(
            itemCount: cases.length,
            itemBuilder: (BuildContext context, int index) {

              return cards[index];
            },
          ),
        ));
  }
}
