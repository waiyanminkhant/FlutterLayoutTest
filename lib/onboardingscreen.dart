import 'package:flutter/material.dart';
import 'mainscreen.dart';

void main(){
  runApp(homescreen());
}

class homescreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Navigation Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Column(
        children: [
          Flexible(child: Image.asset("assets/images/splash.png",width: double.infinity,height: 700,fit: BoxFit.fill,)),
          Container(
            width: 200,
            padding: EdgeInsets.fromLTRB(0, 15, 0, 0),
            child: ElevatedButton(
              child: Text("Get Start"),
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> MyHomePage(title: "Route from OnBoarding Screen"),));
              },
            ),
          )
        ],
      )
      );
  }
  
}