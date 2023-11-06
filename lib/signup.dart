import 'dart:convert';
import 'package:dbvertex/home.dart';
import 'package:dbvertex/otp.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;


void main()  {
  runApp(MyRe());
}
class MyRe extends StatelessWidget {
  const MyRe({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Validate(),
    );
  }
}



class Validate extends StatefulWidget {
  const Validate({super.key});

  @override
  State<Validate> createState() => _ValidateState();
}

class _ValidateState extends State<Validate> {

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController dobController = TextEditingController();
  TextEditingController addressController = TextEditingController();




  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  bool _obscureText = true;             // Toggles the password show status
  late String _password;
  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  void validate(){
    if(formkey.currentState!.validate()){
      print("ok");
    }else{
      print("Error");
    }
  }


  Future<void> postUserData() async {
    final Uri url = Uri.parse('https://work.dbvertex.com/portfolio/api/webservice/register');
    final response = await http.post(
        url,
        headers: {
          'x-api-Key': "dating@123",
        },
        body: {
          'email':    emailController.text.toString(),            // 'email' variable is taken from postman
          'name':     nameController.text.toString(),               // 'name' variable is taken from postman
          'mobile':   mobileController.text.toString(),           // 'mobile' variable is taken from postman
          'password': passwordController.text.toString(),       //data is being stored in server through these variables
          'dob':      dobController.text.toString(),
          'address':  addressController.text.toString()
        }
    );

    if (response.statusCode == 200) {
      // Successful POST request
      var data = jsonDecode(response.body.toString());
      print(response.body.toString());
      if(data['error']==false){
        print('Data sent successfully');
        Navigator.push(context, MaterialPageRoute(builder: (context) => otp()),);

      }else{
            print('detail allready exist in server');
      }

    } else {
      // Handle errors here
      print('Failed to send data. Status code: ${response.statusCode}');
      print('Response body: ${response.body}');

    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.tealAccent[50],


        body: SingleChildScrollView(

          padding: EdgeInsets.all(20.0),
          child: Center(
            child: Form(
              key: formkey,
              child: Container(
                padding: EdgeInsets.only(top: 30),
                child: Column(
                    children: [

                      Text('API',style: TextStyle(
                          color: Colors.blue,fontSize: 30,
                          fontWeight: FontWeight.bold),),
                      SizedBox(height: 60,),
                      Padding(
                        padding: const EdgeInsets.only(right: 130),
                        child: Text('Create your account',style: TextStyle(
                          fontSize: 20,
                        ),),
                      ),
                      SizedBox(height: 10,),


                      TextFormField(
                        controller: nameController,
                        decoration: InputDecoration(
                            labelText: "Name",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)
                            )
                        ),
                        validator: (val){
                          if(val!.isEmpty){
                            return "Required";
                          }else{
                            return null;
                          }
                        },
                      ),

                      SizedBox(height: 10,),

                      TextFormField(
                        controller: dobController,
                        decoration: InputDecoration(
                            labelText: "Dob",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)
                            )
                        ),
                        validator: (val){
                          if(val!.isEmpty){
                            return "Required";
                          }else{
                            return null;
                          }
                        },
                      ),


                      SizedBox(height: 10,),
                      TextFormField(
                        controller: emailController,
                        decoration: InputDecoration(
                            labelText: "Email",
                            border: OutlineInputBorder( borderRadius: BorderRadius.circular(10))
                        ),
                        validator: (val){
                          if (val!.isEmpty){
                            return 'Required';
                          }if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]").hasMatch(val)){
                            return 'please Enter a valid email id';
                          }else{
                            return null;
                          }
                        },
                      ),

                      SizedBox(height: 10,),
                      TextFormField(
                        controller: addressController,
                        decoration: InputDecoration(
                            labelText: "address",
                            border: OutlineInputBorder( borderRadius: BorderRadius.circular(10))
                        ),
                        validator: (val){
                          if(val!.isEmpty){
                            return "Required";
                          }else {
                            return null;
                          }
                        },
                      ),

                      SizedBox(height: 10,),

                      TextFormField(
                        controller: mobileController,
                        maxLength: 10,
                        decoration: InputDecoration(
                            labelText: "Phone",
                            border: OutlineInputBorder( borderRadius: BorderRadius.circular(10))
                        ),
                        validator: (val){
                          if(val!.isEmpty){
                            return "Required";
                          }else {
                            return null;
                          }
                        },
                      ),


                      Padding(padding: EdgeInsets.only(top: 20.0),

                        child:  TextFormField(
                          controller: passwordController,
                          decoration: InputDecoration(
                            hintText: 'Password',
                            //   prefixIcon: Icon(Icons.password),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(color: Colors.greenAccent)
                            ),
                            suffixIconColor: MaterialStateColor.resolveWith((states) => states.contains(MaterialState.focused)
                                ? Colors.grey
                                : Colors.black),
                            labelText: "Password",
                            suffixIcon: IconButton(
                              icon: Icon(
                                _obscureText ? Icons.visibility : Icons.visibility_off,
                              ),
                              onPressed: () {
                                setState(() {
                                  _obscureText = !_obscureText; // Toggle password visibility
                                });
                              },
                            ),
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            labelStyle: TextStyle(color: Colors.black),
                            //prefixIcon: Icon(Icons.lock),
                            prefixIconColor: Colors.black38,
                            fillColor: Colors.black,
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                color: Colors.black,
                              ),
                            ),
                          ),
                         // validator: (val) => val!.length < 6 ? 'Password too short.' : null,
                          validator: (val){
                            if (val!.isEmpty){
                              return 'Required';
                            }if (val!.length < 6){
                              return 'password is too short';
                            }else{
                              return null;
                            }
                          },
                          onSaved: (val) => _password = val!,
                          obscureText: _obscureText,
                        ),
                      ),

                      SizedBox(height: 10),
                      Padding(padding:
                      EdgeInsets.only(top: 20.0),
                          child:   GestureDetector(
                            onTap: (){
                              validate();
                              postUserData();
                            },
                            child: Container(height: 40,width: 200,
                              decoration: BoxDecoration(
                                  color: Colors.blueAccent,
                                  borderRadius: BorderRadius.circular(10)
                              ),
                              child: Center(child: Text('SignUp',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18),),),
                            ),
                          )

                      ),

                      SizedBox(height: 20),

                      Row(mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('OR'),
                        ],
                      ),

                      SizedBox(height: 10),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextButton(onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => profile()),);
                          },
                              child: Text('Login', style: TextStyle(
                                decoration: TextDecoration.underline,
                                fontSize: 18,
                                color: Color(0xff4c505b),
                              ),
                              )),

                          TextButton(onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => otp()),);
                          },
                              child: Text('verify email', style: TextStyle(
                                decoration: TextDecoration.underline,
                                fontSize: 18,
                                color: Color(0xff4c505b),
                              ),
                              )),

                        ],
                      ),



                    ]
                ),
              ),
            ),
          ),
        )
    );
  }
}
