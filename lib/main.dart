import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:project_citex/route/pageNotifier.dart';
import 'package:project_citex/route/routeDelegator.dart';
import 'package:project_citex/route/routeInfoParser.dart';
import 'package:provider/provider.dart';
import 'CustomObjects/Website Stats.dart';
import 'FullScreen.dart';
import 'SmallScreen.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async{
 // setUrlStrategy(PathUrlStrategy());
  WidgetsFlutterBinding.ensureInitialized();

  Firebase.initializeApp();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyBQ7ZxZqlH4svgtyMOBakSUWTo1urptU0c",
          authDomain: "citex-website.firebaseapp.com",
          projectId: "citex-website",
          storageBucket: "citex-website.appspot.com",
          messagingSenderId: "663276517249",
          appId: "1:663276517249:web:2639421ae14f8652b51a80",
          measurementId: "G-4NN0QQBKR3"));

  runApp( NewApp());
}

class NewApp extends StatelessWidget {

  //Future<FirebaseApp> initialization;
   NewApp({Key? key, }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider<PageNotifier>(create: (context)=> PageNotifier())
        ],
        child:

        // FutureBuilder(
        //     future: initialization,
        //     builder: (context, snapshot){
        //       if(snapshot.hasError){
        //         print(snapshot.error);
        //       }
              //if(snapshot.connectionState == ConnectionState.done){
                 const MyApp()
             // }
           //   return const CircularProgressIndicator();
           // },
           // )
    );
  }
}



class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MaterialApp.router(
      title: 'CITex',
      debugShowCheckedModeBanner: false,
      routeInformationParser: AppRouteInformationParser(),
      routerDelegate: AppRouterDelegate(
        notifier: Provider.of<PageNotifier>(context)
      ),
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
        popupMenuTheme: const PopupMenuThemeData(
          color: Colors.grey
        )

      ),

    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});



  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  late bool webLive;

  WebsiteStats websiteStats = WebsiteStats(isLive: false, status: 'off');

  @override
  void initState() {
    super.initState();

    setUp();
  }

  //final docRef = FirebaseFirestore.instance.collection('websiteStats').doc('123456').withConverter(fromFirestore: WebsiteStats.fromFireStore, toFirestore: (WebsiteStats websiteState, _) => websiteState.toFireStore());

  Future <void>setUp() async {
    final docRef = FirebaseFirestore.instance.collection('websiteStats').doc('123456').withConverter(fromFirestore: WebsiteStats.fromFireStore, toFirestore: (WebsiteStats websiteState, _) => websiteState.toFireStore());

    final docSnap = await docRef.get();
    websiteStats = docSnap.data()!;

    //print('webstates: ${websiteStats.status}');
  }


  Widget getW(w){

    if (w>=1050){
      return  const FullScreen();
    }else{
      return SmallScreen(
websiteStats: websiteStats,
      );
    }
  }
  @override
  Widget build(BuildContext context) {
    return getW(MediaQuery.of(context).size.width);
    //   FutureBuilder(
    //   future: setUp(),
    //     initialData: const CircularProgressIndicator(),
    //     builder: (BuildContext context, AsyncSnapshot text){
    //      if(text.connectionState == ConnectionState.done){
    //        return getW(MediaQuery.of(context).size.width);
    //      }
    //      else if(text.connectionState == ConnectionState.waiting){
    //        return const CircularProgressIndicator();
    //      }
    //      return const CircularProgressIndicator();
    //     }
    //
    // );
      //getW(MediaQuery.of(context).size.width);
  }

}
