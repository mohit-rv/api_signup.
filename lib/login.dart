// import 'dart:convert';
// import 'package:dbvertex/front.dart';
// import 'package:dbvertex/home.dart';
// import 'package:dbvertex/signup.dart';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:email_auth/email_auth.dart';
//
// void main()  {
//   runApp(MyApp());
// }
//
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: Validate(),
//     );
//   }
// }
//
//
//
//
//
// class Validate extends StatefulWidget {
//   const Validate({super.key});
//
//   @override
//   State<Validate> createState() => _ValidateState();
// }
//
// class _ValidateState extends State<Validate> {
//
//   GlobalKey<FormState> formkey = GlobalKey<FormState>();
//
//   bool _obscureText = true;             // Toggles the password show status
//   late String _password;
//   void _toggle() {
//     setState(() {
//       _obscureText = !_obscureText;
//     });
//   }
//
//   TextEditingController email=TextEditingController();
//   TextEditingController password=TextEditingController();
//   //TextEditingController otp=TextEditingController();
//
//
//   void validate(){
//     if(formkey.currentState!.validate())
//     {
//       print("ok");
//     }else{
//       print("Error");
//     }
//   }
//
//   void login() async{
//     try {
//       Response response =await post(
//           Uri.parse('https://work.dbvertex.com/portfolio/api/webservice/login'),
//           body: {
//             'email': email.text.toString(),
//             'password': password.text.toString()
//           }
//       );
//
//       if(response.statusCode == 200){
//         var data = jsonDecode(response.body.toString());
//         print(data);
//
//         //  print('Login Succesfully');
//         if(data['error']==false){
//           //  print(data['token']);
//           print('Login succesful');
//           var sharedpref = await SharedPreferences.getInstance();
//           sharedpref.setBool(FrontState.KEYLOGIN, true);
//
//           Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Home()));
//           // Navigator.push(context, MaterialPageRoute(builder: (context) => PhoneNumberDataFetcher(username:username,mobile:mobile,email:email,country_code:country_code,)),);
//         }else{
//           print("Create Account");
//         }
//
//       }
//       else{
//         print('faild');
//       }
//     }catch(e){
//       print(e.toString());
//     }
//   }
//
//
//   // void sendOTP() async{
//   //   EmailAuth.sessionName = "Test Session";
//   //   var res = await EmailAuth.sendOtp(recipientMail: email.text);
//   //   if(res) {
//   //
//   //   }
//   // }
//   //
//   // void verifyOTP() async{
//   //    var res = EmailAuth.validate(
//   //      recievermail: email.text, userOTP: otp.text
//   //    )
//   // }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.tealAccent[50],
//
//       body: SingleChildScrollView(
//
//         padding: EdgeInsets.all(20.0),
//         child: Center(
//           child: Form(
//             key: formkey,
//             child: Container(
//               padding: EdgeInsets.only(top: 60),
//               child: Column(
//                 children: [
//                   Text('Login through API',style: TextStyle(
//                       color: Colors.blue,fontSize: 30,
//                       fontWeight: FontWeight.bold),),
//                   SizedBox(height: 150),
//                   Padding(
//                     padding: const EdgeInsets.only(right: 120),
//                     child: Text('Login to your account',style: TextStyle(
//                       fontSize: 20,
//                     ),),
//                   ),
//                   SizedBox(height: 15),
//
//
//                   TextFormField(
//                     controller: email,
//                     decoration: InputDecoration(
//                         labelText: "Email",
//                         border: OutlineInputBorder( borderRadius: BorderRadius.circular(10))
//                     ),
//                     validator: (val){
//                       if (val!.isEmpty){
//                         return 'Required';
//                       }if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]").hasMatch(val)){
//                         return 'please Enter a valid email id';
//                       }else{
//                         return null;
//                       }
//                     },
//                   ),
//
//
//                   Padding(padding: EdgeInsets.only(top: 20.0),
//
//                     child:  TextFormField(
//                       controller: password,
//                       decoration: InputDecoration(
//                         hintText: 'Password',
//                         prefixIcon: Icon(Icons.lock),
//                         border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(10),
//                             borderSide: BorderSide(color: Colors.greenAccent)
//                         ),
//                         suffixIconColor: MaterialStateColor.resolveWith((states) => states.contains(MaterialState.focused)
//                             ? Colors.grey
//                             : Colors.black),
//                         labelText: "Password",
//                         suffixIcon: IconButton(
//                           icon: Icon(
//                             _obscureText ? Icons.visibility : Icons.visibility_off,
//                           ),
//                           onPressed: () {
//                             setState(() {
//                               _obscureText = !_obscureText; // Toggle password visibility
//                             });
//                           },
//                         ),
//                         floatingLabelBehavior: FloatingLabelBehavior.always,
//                         labelStyle: TextStyle(color: Colors.black),
//                         //prefixIcon: Icon(Icons.lock),
//                         prefixIconColor: Colors.black38,
//                         fillColor: Colors.blue,
//                         focusedBorder: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(10),
//                           borderSide: BorderSide(
//                             color: Colors.blue,
//                           ),
//                         ),
//                       ),
//                       validator: (val) => val!.length < 6 ? 'Password too short.' : null,
//                       onSaved: (val) => _password = val!,
//                       obscureText: _obscureText,
//                     ),
//                   ),
//
//
//
//                   SizedBox(height: 25),
//
//                   Padding(padding:
//                   EdgeInsets.only(top: 20.0),
//                     child: ElevatedButton(
//                       style: ElevatedButton.styleFrom(
//                         elevation: 5, // Adjust the elevation (shadow) if needed
//                         minimumSize: Size(200, 40), // Set the desired width and height
//                       ),
//                       onPressed: () async{
//                         // var sharedpref = await SharedPreferences.getInstance();
//                         // sharedpref.setBool(FrontState.KEYLOGIN, true);
//
//                         validate();
//                         login();
//                       },
//                       child: Text("Login"),
//                     ),
//                   ),
//
//                   SizedBox(height: 30),
//
//                   Row(mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Text('OR'),
//                     ],
//                   ),
//
//                   SizedBox(height: 10),
//
//
//                   Row( mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       TextButton(onPressed: () {
//                         Navigator.push(context, MaterialPageRoute(builder: (context) => MyRe()),);
//                       },
//                           child: Text('Create account', style: TextStyle(
//                             decoration: TextDecoration.underline,
//                             fontSize: 18,
//                             color: Color(0xff4c505b),
//                           ),
//                           )),
//
//                     ],
//                   )
//
//
//                 ],
//               ),
//
//
//
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//
//
//
// }
//

import 'dart:convert';

import 'package:dbvertex/home.dart';
import 'package:dbvertex/signup.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
class login extends StatefulWidget {
  const login({super.key});

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  final formkey= GlobalKey<FormState>();

  TextEditingController email=TextEditingController();
  TextEditingController password=TextEditingController();

  log() async{
    try{
      Response response = await post(
          Uri.parse('https://work.dbvertex.com/portfolio/api/webservice/login'),
          headers: {
            'x-api-key':'dating@123'
          },
          body: {
            'email' : email.text.toString(),
            'password' : password.text.toString(),
          }
      );
      if(response.statusCode==200){
        var data = jsonDecode(response.body.toString());
        print(data);
        if(data["status"]==true){
          print('Registeration successfully');
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
        child: Form(key: formkey,
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
                    labelText: 'Enter email'
                ),
              ),

              TextFormField(
                controller: password,
                validator: (v){
                  if(v!.isEmpty){
                    return 'Required';
                  }
                },
                decoration: InputDecoration(
                    hintText: 'password',
                    labelText: 'Enter password'
                ),
              ),

              ElevatedButton(
                  onPressed: (){
                    if(formkey.currentState!.validate()){
                      log();
                    }
                  }, child: Text('login')
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

