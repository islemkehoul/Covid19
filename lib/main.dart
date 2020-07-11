import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
//import 'dart:convert';


void main() {
  runApp(
    MaterialApp(
       initialRoute: '/',
       routes: {
      // When navigating to the "/" route, build the FirstScreen widget.
      '/': (context) => Home(),
      // When navigating to the "/second" route, build the SecondScreen widget.
      //'/second': (context) => SecondScreen(),
    },
    ) 
  );
}
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
    Map results;
    List cases ; 

   Future getJasonData() async{
   var response = await http.get( "https://thevirustracker.com/free-api?global=stats");
      results = json.decode(response.body);
      cases = results["results"];
     print(cases);
      
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      Center(
        child: RaisedButton(
          child:Text('data'),
          onPressed: (){
          getJasonData();
         
          },
          
        ),
      )
      
    );
  }
}
