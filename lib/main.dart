import 'package:covid19/service.dart';
import 'package:flutter/material.dart';

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
  Service obj = new Service();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      Center(
        child: RaisedButton(
          child:Text('data'),
          onPressed: (){
             obj.getJasonData();
           
          },
          
        ),
      )
      
    );
  }
}
