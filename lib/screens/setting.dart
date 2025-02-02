import 'package:authentification/database.dart';
import 'package:authentification/reybo_app_icons.dart';
import 'package:authentification/screens/signin.dart';
import 'package:firebase_auth/firebase_auth.dart';
//import 'package:authentification/screens/profile.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

void main() {
  runApp(Setting());
}

class Setting extends StatefulWidget {
  @override
  _SettingState createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: Text(
          "Settings",
          style: TextStyle(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.w400),
        ),
        backgroundColor: Colors.white,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(ReyboApp.arrow),
            color: HexColor("C4C4C4"),
          )
        ],
      ),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          Container(
            height: 10,
          ),
          ElevatedButton(
              child: Text('ACCOUNT SETTINGS',
                  style: TextStyle(
                      fontSize: 17,
                      color: Colors.black,
                      fontWeight: FontWeight.bold)),
              style: ElevatedButton.styleFrom(
                  minimumSize: Size(341, 36),
                  primary: HexColor("BED0D0"),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  )),
              onPressed: () {
                //print("at Setting" + Database.thisUserInfo.Id);
                var user = FirebaseAuth.instance.currentUser;
                if (user != null) {
                  print("Setting " + user.uid);
                  try {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Edit_Infor(
                                text: "TJlwUb6IZfg6DRPWxUYYGkhHqKp2")));
                  } on FirebaseAuthException catch (error) {
                    print(error.toString());
                  }
                }
              }),
          ElevatedButton(
              child: Text('HELP & SUPPORT',
                  style: TextStyle(
                      fontSize: 17,
                      color: Colors.black,
                      fontWeight: FontWeight.bold)),
              style: ElevatedButton.styleFrom(
                  minimumSize: Size(341, 36),
                  primary: HexColor("BED0D0"),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  )),
              onPressed: () {}),
          ElevatedButton(
              child: Text('LOG OUT',
                  style: TextStyle(
                      fontSize: 17,
                      color: Colors.black,
                      fontWeight: FontWeight.bold)),
              style: ElevatedButton.styleFrom(
                  minimumSize: Size(341, 36),
                  primary: HexColor("BED0D0"),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  )),
              onPressed: () {
                //logout auth
                Database.Auth.signOut();
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => SignInScreen()));
              }),
        ]),
      ),
    ));
  }

  Edit_Infor({text, Auth}) {}
}
