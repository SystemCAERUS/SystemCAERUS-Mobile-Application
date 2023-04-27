import 'package:caerus/main.dart';
import 'package:flutter/material.dart';
import 'package:caerus/Views/MainPage/MainPage.dart';
class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState(){
    super.initState();
    _navigatetologin();
  }

  _navigatetologin()async{
    await Future.delayed(Duration(seconds: 2),(){});
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MainPage()));
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white60,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                child: Text("SystemCAERUS", style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
