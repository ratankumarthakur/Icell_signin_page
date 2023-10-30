import 'package:flutter/material.dart';
import 'package:signin/signup.dart';
import 'package:signin/splash.dart';
import 'package:url_launcher/url_launcher.dart';
import 'for.dart';

void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: sc1(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  Future<void> _launchURL(String url) async{
    final Uri uri=Uri(scheme: "https",host: url);
    if(!await launchUrl(uri,
        mode:LaunchMode.inAppBrowserView )){
      throw "cannot launch the app";
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffbfbdb6),
      body: SafeArea(
        child: Container(decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [Color(0xffebb56e),Colors.white],begin: Alignment.topCenter,end: Alignment.bottomCenter)
        ),
          padding:  EdgeInsets.symmetric(horizontal: 30,vertical: 50),
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          child:  Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(Icons.login,color: Colors.black,size: 70,),
              SizedBox(height:20 ,),
              Text("Welcome back you've been missed!"),
              SizedBox(height:20 ,),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(height: 50,decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(11),color: Colors.white.withOpacity(.5)
                ),
                  child: TextField(keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(labelText: "Email",prefixIcon: Icon(Icons.email_outlined),
                      hintText: "Enter your email id",
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(11),
                        borderSide: const BorderSide(
                          color: Colors.blue
                        )
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(11),
                          borderSide: const BorderSide(
                              color: Colors.grey
                          )
                      ),
                    ),
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(left: 20.0,right: 20,),
                child: Container(height: 50,decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(11),color: Colors.white.withOpacity(.5)),
                  child: TextField(obscureText: true,
                    decoration: InputDecoration(labelText: "Password",prefixIcon: Icon(Icons.lock),
                      hintText: "Enter your password",
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(11),
                          borderSide: const BorderSide(
                              color: Colors.blue
                          )
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(11),
                          borderSide: const BorderSide(
                              color: Colors.grey
                          )
                      ),
                    ),
                  ),
                ),
              ),SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.only(right: 20.0),
                child: InkWell(onTap: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>forgot()));
                },child:
                const Text("                                                                                       Forgot password",
                  style: TextStyle(color: Colors.blue),)),
              ),
              SizedBox(height: 20,),
              InkWell(onTap: (){
                _launchURL("www.youtube.com");

              },
                child: Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Container(width: double.infinity,height: 50,decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(11),color: Colors.black),
                      child:Center(child: Text("Sign in",style: TextStyle(color: Colors.white),))

                  ),
                ),
              ),
              SizedBox(height: 10,),
              Divider(),
              Padding(
                padding:  EdgeInsets.all(20.0),
                child: Row(mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                  Text("or ",),
                    InkWell(onTap: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>signup()));
                    },child: Text("Signup",style: TextStyle(color: Colors.blue),))
                  ],
                ),
              ),
              SizedBox(height: 10,),
              Align(alignment:Alignment.bottomLeft,child: Container(height: 100,width: 100,decoration: BoxDecoration(borderRadius: BorderRadius.circular(11)),
                child:ClipRRect(borderRadius:BorderRadius.circular(11),child: Image.asset("assets/icell.png",fit: BoxFit.fill,)) ,))



        ],
          ),
        ),
      ),
    );
  }
}
