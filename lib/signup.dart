import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class signup extends StatefulWidget {
  const signup({super.key});

  @override
  State<signup> createState() => _signupState();
}

class _signupState extends State<signup> {
  Future<void> _launchURL(String url) async{
    final Uri uri=Uri(scheme: "https",host: url);
    if(!await launchUrl(uri,
        mode:LaunchMode.inAppBrowserView )){
      throw "cannot launch the app";
    }
  }
  final formKey = GlobalKey<FormState>();
  String name="";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(height: MediaQuery.of(context).size.height,width:MediaQuery.of(context).size.width ,
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [Colors.white,Color(0xffebb56e)]
            ,begin: Alignment.topCenter,end: Alignment.bottomCenter)
      ),child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.center,mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CircleAvatar(radius: 50,backgroundImage:AssetImage("assets/person.png")),
              Text("Create account",style: TextStyle(fontSize: 25),),
              Container(child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0,right: 20.0,top: 20.0),
                    child: Container(height: 50,decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(11),color: Colors.white.withOpacity(.5)
                    ),
                      child: TextFormField(keyboardType: TextInputType.name,validator: (value){
                        if(value!.isEmpty || !RegExp(r'^[a-z A-Z]+$').hasMatch(value!)){
                          return "Enter correct name";
                        }else{
                          return null;
                        }
                      },
                        decoration: InputDecoration(labelText: "Username",prefixIcon: Icon(Icons.person),
                          hintText: "Create username",
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
                    ),),
                  InkWell(onTap: (){

                      _launchURL("www.youtube.com");


                  },
                    child: Padding(
                      padding: EdgeInsets.all(20.0),
                      child: Container(width: double.infinity,height: 50,decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(11),color: Colors.black),
                          child:Center(child: Text("Sign up",style: TextStyle(color: Colors.white),))

                      ),
                    ),
                  ),
                ],
              ),)
            ],
          ),
      ),),

    );
  }
}
