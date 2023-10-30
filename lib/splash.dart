import 'dart:async';

import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:signin/main.dart';
class sc1 extends StatefulWidget {
  const sc1({super.key});

  @override
  State<sc1> createState() => _sc1State();
}

class _sc1State extends State<sc1> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(milliseconds:3700 ),(){
      Navigator.pushReplacement(context,MaterialPageRoute(builder: (context)=>HomePage()));
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.white,
      body: Center(
        child: Column(crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(height: MediaQuery.of(context).size.height/2,child: Image.asset("assets/icell.png",fit: BoxFit.fill,),),
            AnimatedTextKit(totalRepeatCount: 1,animatedTexts: [TypewriterAnimatedText("Innovation cell welcomes you!!",
                speed: Duration(milliseconds: 65),textStyle: TextStyle(color: Colors.blue,fontSize: 33))])
          ],
        ),
      )
    );
  }
}
