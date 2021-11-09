import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/pages/home-page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Food server',
        theme: ThemeData(
         // fontFamily: 'Nunito',
          primarySwatch: Colors.red,
          textTheme: TextTheme(
              bodyText1: TextStyle(color: Colors.black),
              bodyText2: TextStyle(color: Colors.black)),
        ),
        home: MyHomePage(title: 'Food server'),
        debugShowCheckedModeBanner: false);
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
        body: Stack(children: [
      Container(width: size.width, child: Image.asset("home.jpg")),
      Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          width: size.width,
          height: size.height / 2,
          decoration: BoxDecoration(
            color: Colors.deepPurple,
            borderRadius:
                BorderRadius.vertical(top: Radius.elliptical(size.width, 100)),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RichText(
                  text: TextSpan(
                      style: TextStyle(color: Colors.white, fontSize: 20),
                      children: [
                    TextSpan(text: "F"),
                    TextSpan(
                        text: "00", style: TextStyle(color: Colors.red[600], fontWeight: FontWeight.bold)),
                    TextSpan(text: "D"),
                    TextSpan(text: " SERVERS")
                  ])),
              Padding(
                padding: const EdgeInsets.only(top: 40),
                child: SizedBox(
                  height: 40,
                  width: 100,
                  child: ElevatedButton(
                    style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)))),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => HomePage()));
                    },
                    child: Text(
                      "Get started",
                      style: TextStyle(fontSize: 15),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    ]));
  }
}
