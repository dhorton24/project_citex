import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:google_fonts/google_fonts.dart';
import 'FullScreen.dart';
import 'SmallScreen.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CITex',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.grey,
        primaryColor: Colors.white,

      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool launchAnimation = false;
  String longParagraph =
      'Lorem ipsum rsus, sit amet scelerisque ligula bibendum. Suspendisse jsus tortor blandit eget. Mo et malesuada fames ac ante ipsum primis in faucibus';
  String shortParagraph =
      'Lorem ipsum rsus, sit amet scelerisque ligula bibendum. Suspendisse justo mi, eleifend ut tortor eget, semper tristique massa. Sed gravida c';

  @override
  void initState() {
    super.initState();

    launchAnimation = true;
  }


  Widget getW(w){
    if (w>=1050){
      return  FullScreen();
    }else{
      return SmallScreen();
    }
  }

  @override
  Widget build(BuildContext context) {
    return getW(MediaQuery.of(context).size.width);
  }



  Widget firstContainer(){
    return Container(
      height: MediaQuery.of(context).size.height/2,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.topRight,
              colors: [Color(0xffE3CB9A), Color(0xffE4CB9C),Color(0xffab5a4b),Color(0xffab5a4b), Color(0xffab5a4b)]
          )
      ),
      child: Padding(
        padding: EdgeInsets.only(left: 48, right: 48),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              height: MediaQuery.of(context).size.height/6,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                end: Alignment.topRight,
                  colors: [Color(0xffE3CB9A), Color(0xffE4CB9C),Color(0xffccb68d), Color(0xffab5a4b)]
                )
                  //color: Color(0xffE3CB9A)
              ),
              child: Flexible(
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: Text(
                    'We Chase Innovations so that you don\'t have to!',
                    style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0xff211F39),fontSize: 54,
                        )
                    ),
                    textAlign: TextAlign.center,),
                ),
              ),

            ),

                Container(
                  height: MediaQuery.of(context).size.height/3,
                  //width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: Color(0xff211F39),
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20))
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [

                      Flexible(child: Column(
                        children: [
                          Flexible(
                              child: Padding(
                                padding: EdgeInsets.all(16),
                                child: Text(
                                  'Guaranteed Most Affordable Software in the Area While still Maintaining a Quality Product',
                                  style: GoogleFonts.paytoneOne(textStyle: TextStyle(
                                      fontSize: 36,color: Color(0xffE3CB9A)
                                  )),
                                  textAlign: TextAlign.center,
                                ),
                              )
                          ),

                          Flexible(child: Text(shortParagraph,textAlign: TextAlign.center,style: TextStyle(
                            fontSize: 24
                          ),))
                        ],
                      ),),
                      Container(
                        child: Image.asset('lib/Images/favicon.png',),
                      )

                    ],
                  )
                ),
          ],
        ),
      )
    );




  }

  Widget secondContainer(){
    return Container(
      height: MediaQuery.of(context).size.height/2,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.topRight,
              colors: [Color(0xffE3CB9A), Color(0xffE4CB9C),Color(0xffab5a4b), Color(0xffab5a4b)]
          )
      ),
      child: Padding(
        padding: EdgeInsets.only(left: 48, right: 48),
        child: Container(
          height: MediaQuery.of(context).size.height/2,
          decoration: BoxDecoration(
              color: Color(0xff211F39),
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20))
          ),
        ),
      ),

    );
  }

  Widget secondText() {
    return Flexible(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsets.all(16),
          child: Text(
            "This is a Paragraph Title",
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 30),
            textAlign: TextAlign.center,
          ),
        ),
        Padding(
          padding: EdgeInsets.all(8),
          child: Text(shortParagraph,
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              softWrap: true,
              textAlign: TextAlign.center,
              overflow: TextOverflow.fade),
        )
      ],
    ));
  }

  Widget mainText() {
    return Flexible(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsets.all(16),
          child: Text(
            "This is a Paragraph Title",
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 30),
            textAlign: TextAlign.center,
          ),
        ),
        Padding(
          padding: EdgeInsets.all(8),
          child: Text(
            longParagraph,
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            softWrap: true,
            textAlign: TextAlign.center,
            overflow: TextOverflow.fade,
          ),
        )
      ],
    ));
  }

  roundButton(String buttonText) {
    return Padding(
      padding: EdgeInsets.all(8),
      child: ElevatedButton(
        onPressed: () => {},
        child: Text(buttonText),
        style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18),
            )),
            backgroundColor: MaterialStateProperty.all(Color(0xffE3CB9A))),
      ),
    );
  }
}
