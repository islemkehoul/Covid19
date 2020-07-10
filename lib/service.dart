import 'package:http/http.dart' as http;
import 'dart:async';
//import 'dart:convert';



class Service {
  String url = "https://reqres.in/api/users?page=2" ;

  // ignore: missing_return
  Future getJasonData() async{
    http.Response response = await http.get(url);
   print(response.body);
    
  }
}