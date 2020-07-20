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
    Map result;
    Map cases ; 

   Future getJasonData() async{

    var response = await http.get( "https://thevirustracker.com/free-api?global=stats");
    result = json.decode(response.body);
    cases = result["results"][0];
    //print(cases[0]['total_cases']);
    print(result[0]);
    
  }

  /*@override
  void initState(){
    super.initState();
  }*/

  @override
  Widget build(BuildContext context) {
    getJasonData();
    print(cases);
    var cards = <Widget>[];
    cases.forEach((key, value) { 

     cards.add( Card(
             child: Column(
              children: <Widget>[

               Text('$key : $value'),

              ],
               
             ),
     )
          );
     });
    return Scaffold(
      backgroundColor: Colors.grey[700],
      body:ListView.builder(
        itemCount: cases.length,
        itemBuilder: (BuildContext context, int index) {

          return cards[index];
          },
        )

    );
  }
}
