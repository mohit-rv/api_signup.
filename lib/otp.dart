import 'dart:convert';
import 'package:dbvertex/home.dart';
import 'package:dbvertex/login.dart';
import 'package:dbvertex/signup.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
class otp extends StatefulWidget {
  const otp({super.key});

  @override
  State<otp> createState() => _loginState();
}

class _loginState extends State<otp> {


  final formkey= GlobalKey<FormState>();

  TextEditingController email=TextEditingController();


  Otp() async{
    try{
      Response response = await post(
          Uri.parse('https://work.dbvertex.com/portfolio/api/webservice/verifyotp'),
          headers: {
            'x-api-key':'dating@123'
          },
          body: {
            'email' : email.text.toString(),
          }
      );
      if(response.statusCode==200){
        var data = jsonDecode(response.body.toString());
        print(data);
        if(data["status"]==true){
          print('verify successfully');
          Navigator.push(context, MaterialPageRoute(builder: (context)=>profile()));

        }else{
          print("Failed");

        }
      }

    }catch(e){
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: formkey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              TextFormField(
                controller: email,
                validator: (v){
                  if(v!.isEmpty){
                    return 'Required';
                  }
                },
                decoration: InputDecoration(
                    hintText: 'email',
                    labelText: 'Enter previes email'
                ),
              ),


              ElevatedButton(
                  onPressed: (){
                    if(formkey.currentState!.validate()){
                      Otp();
                    }
                  }, child: Text('Verify OTP')
              ),
              TextButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>MyRe()));
              }, child: Text('you have not account? Register',style: TextStyle(fontSize: 20),))
            ],
          ),
        ),
      ),
    );
  }
}
