import 'dart:async';
import 'package:dbvertex/home.dart';
import 'package:dbvertex/login.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Front extends StatefulWidget {
  const Front({super.key});

  @override
  State<Front> createState() => FrontState();
}

class FrontState extends State<Front> {

  static const String KEYLOGIN = "login";

  @override
  void initState() {
    super.initState();

    whereToGo();
    // Timer(Duration(seconds: 3), () {
    //   Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MyApp()));
    //}
    //);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 350),
          child: Column(
            children: [
              Row( mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text('API',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 40,color: Colors.purple)),
                  Text('C',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 40,color: Colors.blue)),
                  Text('R',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 40,color: Colors.red)),
                  Text('U',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 40,color: Colors.green)),
                  Text('D',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 40,color: Colors.black)),
                ],
              ),

              SizedBox(height: 10),

              Row(  mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text('o',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14,color: Colors.blueGrey)),
                  Text('p',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14,color: Colors.blueGrey)),
                  Text('e',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14,color: Colors.blueGrey)),
                  Text('r',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14,color: Colors.blueGrey)),
                  Text('t',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14,color: Colors.blueGrey)),
                  Text('i',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14,color: Colors.blueGrey)),
                  Text('o',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14,color: Colors.blueGrey)),
                  Text('n',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14,color: Colors.blueGrey)),
                  Text('s',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14,color: Colors.blueGrey)),
                ],
              )
            ],
          ),
        ),


      ),
    );
  }

  void whereToGo() async{
    var sharedpref = await SharedPreferences.getInstance();
    var isLoggedIn = sharedpref.getBool(KEYLOGIN);

    Timer(Duration(seconds: 3), () {

      if(isLoggedIn!=null){
        if(isLoggedIn){        //if loggedin
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => profile()));
        } else {               //if not logged in
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => login()));
        }
      }else {               //if null
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => login()));
      }

    });
  }
}

