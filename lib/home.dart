//
// import 'dart:convert';
//
// import 'package:dbvertex/front.dart';
// import 'package:dbvertex/login.dart';
// import 'package:dbvertex/signup.dart';
// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:http/http.dart' as http;
//
// class Home extends StatefulWidget {
//   Home({super.key,});
//   //String? username,email,mobile,country_code;
//
//   @override
//   _HomeState createState() => _HomeState();
// }
//
// class _HomeState extends State<Home> {
//
//
//   var user_id;
//   var name = '';
//   var email = '';
//   var mobile = '';
//   var dob = '';
//
//   Future<void> getData() async {
//     final SharedPreferences prefs = await SharedPreferences.getInstance();
//     setState(() {
//       user_id = prefs.getString('user_id') ?? '';
//       //  print(user_id);
//       name = prefs.getString('name') ?? '';
//       print(name);
//       email = prefs.getString('email') ?? '';
//       print(email);
//       mobile = prefs.getString('mobile') ?? '';
//       print(mobile);
//       dob = prefs.getString('dob') ?? '';
//       print(dob);
//     });
//   }
//
//   Future<void> fetchUserData(String mobile) async {
//     final url = Uri.parse('https://work.dbvertex.com/portfolio/api/webservice/profile'); // Replace with your API endpoint
//
//     final response = await http.get(url);
//
//     if (response.statusCode == 200) {
//       var data = jsonDecode(response.body.toString());
//       // Successful response, parse the data
//       final userData = json.decode(response.body);
//       print(userData); // Do something with the user data
//       var useriid = data["data"][0]["id"];
//
//       var username = data["data"][0]["name"];
//       print("name");
//       var mobile = data["data"][0]["mobile"];
//       print('mobile');
//       print('email');
//       var email = data["data"][0]["email"];
//       print("email");
//       var dob = data["data"][0]["dob"];
//       setData(useriid, username, email, mobile, dob);
//       var sharedpref = await SharedPreferences.getInstance();
//       sharedpref.setBool(FrontState.KEYLOGIN, true);
//     } else {
//       // Handle errors, e.g., user not found or server issues
//       print('Failed to fetch user data. Status code: ${response.statusCode}');
//     }
//   }
//
//
//   @override
//   void initState() {
//     // TODO: implement initState
//     getData();
//   }
//
//   // String mobile = ""; // Replace with the user's input
//
//   // Future<Map<String, dynamic>> fetchData() async {
//   //   final response = await http.get(Uri.parse('https://alphawizzserver.com/jozzby_bazar_new/app/v1/api/register_user'));
//   //
//   //   if (response.statusCode == 200) {
//   //     return json.decode(response.body);
//   //   } else {
//   //     throw Exception('Failed to fetch data');
//   //   }
//   // }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(backgroundColor: Colors.tealAccent[50],
//       appBar: AppBar(backgroundColor: Colors.blue,
//         title: Text('Home', style: TextStyle(color: Colors.white),),
//         centerTitle: true,
//       ),
//       drawer: Drawer(
//         child: ListView(
//           children: [
//             DrawerHeader(
//               decoration: BoxDecoration(
//                   color: Colors.blueAccent
//               ),
//               child: Column(
//                 children: [
//                   SizedBox(height: 80),
//                   //   Text('MOHIT VERMA',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
//                   Text("            ${name}", style: TextStyle(fontSize: 22,
//                       color: Colors.white,
//                       fontWeight: FontWeight.bold)),
//                   Text("             ${email}", style: TextStyle(fontSize: 22,
//                       color: Colors.white,
//                       fontWeight: FontWeight.bold)),
//                 ],
//               ),
//             ),
//
//             Column(
//               children: [
//                 ListTile(
//                   title: Text('Edit Details'),
//                   leading: Icon(Icons.edit),
//                   onTap: () {
//                     //  Navigator.push(context, MaterialPageRoute(builder: (context) => upto()));
//                   },
//                 ),
//
//                 ListTile(
//                   title: Text('Indore'),
//                   leading: Icon(Icons.location_city),
//                 ),
//                 SizedBox(height: 10),
//                 Divider(color: Colors.grey,
//                     thickness: 2,
//                     height: 10,
//                     indent: 10,
//                     endIndent: 10
//                 ),
//                 SizedBox(height: 10),
//                 ListTile(
//                   title: Text('Signup'),
//                   leading: Icon(Icons.account_box),
//                   onTap: () {
//                     Navigator.push(context,
//                         MaterialPageRoute(builder: (context) => MyRe()));
//                   },
//                 ),
//
//                 ListTile(
//                   title: Text('Login'),
//                   leading: Icon(Icons.login),
//                   onTap: () {
//                     Navigator.push(context,
//                         MaterialPageRoute(builder: (context) => MyApp()));
//                   },
//                 ),
//
//                 Divider(color: Colors.grey,
//                     thickness: 2,
//                     height: 20,
//                     indent: 10,
//                     endIndent: 10),
//                 SizedBox(height: 30),
//                 ListTile(
//                     title: Text('Logout'),
//                     leading: IconButton(onPressed: () async {
//                       // await logout();
//
//                       var sharedPref = await SharedPreferences.getInstance();
//                       sharedPref.setBool(FrontState.KEYLOGIN, false);
//                       Navigator.pushReplacement(context,
//                           MaterialPageRoute(builder: (context) => MyApp()));
//                       //   Navigator.push(context, MaterialPageRoute(builder: (context) =>MyApp()));
//
//                       // .onError((error, stackTrace){
//                       //     Utils().toastMessage(error.toString());
//                       //      });
//                     },
//                       icon: Icon(Icons.logout),)
//                 )
//
//
//               ],
//             )
//           ],
//         ),
//       ),
//
//
//       body: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.only(top: 100),
//           child: Column(
//             children: [
//               Container(
//                 height: 290, margin: EdgeInsets.only(left: 30, right: 30),
//                 decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(10),
//                     color: Colors.cyan[100]
//                 ),
//
//
//                 child: Column( //mainAxisAlignment: MainAxisAlignment.center,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     SizedBox(height: 20,),
//                     Text("  WELCOME ", style: TextStyle(fontSize: 20,
//                         color: Colors.cyan[900],
//                         fontWeight: FontWeight.bold)),
//
//                     SizedBox(height: 20),
//
//                     Text("  id              :        ${user_id}",
//                         style: TextStyle(
//                             fontSize: 20, fontWeight: FontWeight.bold)),
//                     Text("  name       :       ${name}", style: TextStyle(
//                         fontSize: 20, fontWeight: FontWeight.bold)),
//                     Text("  mobile     :      ${mobile}", style: TextStyle(
//                         fontSize: 20, fontWeight: FontWeight.bold)),
//                     Text("  email       :      ${email}", style: TextStyle(
//                         fontSize: 20, fontWeight: FontWeight.bold)),
//                     Text("  dob   :        ${dob}", style: TextStyle(
//                         fontSize: 20, fontWeight: FontWeight.bold)),
//
//                     SizedBox(height: 10),
//
//
//                   ],
//                 ),
//               ),
//
//
//             ],
//           ),
//
//         ),
//       ),
//     );
//   }
//
//   Future<void> setData(String idd, String name, String email, String mobile,
//       String dob) async {
//     final SharedPreferences prefs = await SharedPreferences.getInstance();
//
//     await prefs.setString('user_id', idd);
//     await prefs.setString('name', name);
//     await prefs.setString('email', email);
//     await prefs.setString('mobile', mobile);
//     await prefs.setString('dob', dob);
//   }
//
// }
//
//
import 'package:flutter/material.dart';
import 'dart:convert';
//import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart';
class profile extends StatefulWidget {
  const profile({super.key});

  @override
  State<profile> createState() => _profileState();
}

class _profileState extends State<profile> {

  var stringResponse;
  profile() async{
    try{
      Response response = await get(
        Uri.parse('https://work.dbvertex.com/portfolio/api/webservice/profile'),
        headers: {
          'x-api-key':'dating@123'
        },
      );
      if(response.statusCode==200){
        setState(() {
          stringResponse = jsonDecode(response.body.toString());
        });
        var data = jsonDecode(response.body.toString());
        print(data);
        if(data["status"]==true){
          print('Registeration successfully');
          //Navigator.push(context, MaterialPageRoute(builder: (context)=>login()));
          // Fluttertoast.showToast(
          //     msg: "${data["message"]}",
          //     toastLength: Toast.LENGTH_SHORT,
          //     gravity: ToastGravity.CENTER,
          //     timeInSecForIosWeb: 1,
          //     backgroundColor: Colors.red,
          //     textColor: Colors.black,
          //     fontSize: 16.0

        }else{
          print("Failed");
          // Fluttertoast.showToast(
          //     msg: "${data["message"]}",
          //     toastLength: Toast.LENGTH_SHORT,
          //     gravity: ToastGravity.CENTER,
          //     timeInSecForIosWeb: 1,
          //     backgroundColor: Colors.red,
          //     textColor: Colors.black,
          //     fontSize: 16.0

        }
      }

    }catch(e){
      print(e);
    }
  }

  @override
  void initState() {
    profile();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Card(color: Colors.grey,child: Text(stringResponse.toString())),
                SizedBox(height: 40,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
