import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:project_citex/Constants/Colors.dart';
import 'package:project_citex/enums.dart';
import 'package:project_citex/route/pageNotifier.dart';
import 'package:provider/provider.dart';
import 'package:spring/spring.dart';
import 'package:getwidget/getwidget.dart';
import 'package:flutter_timer_countdown/flutter_timer_countdown.dart';

import 'CustomObjects/Website Stats.dart';

class FullScreen extends StatefulWidget {
  const FullScreen({Key? key}) : super(key: key);

  @override
  State<FullScreen> createState() => _FullScreenState();
}

class _FullScreenState extends State<FullScreen> {
  final SpringController springController =
      SpringController(initialAnim: Motion.mirror);
  ConstantColors colors = ConstantColors();
  late bool webLive;

  // late DocumentReference reference;

  getLiveStatus() async {
    final docRef = FirebaseFirestore.instance
        .collection('websiteStats')
        .doc('123456')
        .withConverter(
            fromFirestore: WebsiteStats.fromFireStore,
            toFirestore: (WebsiteStats websiteState, _) =>
                websiteState.toFireStore());

    final docSnap = await docRef.get();
    webLive = docSnap.data()!.isLive;
  }

  toggleLive() {
    final ref =
        FirebaseFirestore.instance.collection('websiteStats').doc('123456');
    ref.update({'isLive': true}).then((value) => {
          setState(() {
            webLive = true;
          })
        });
  }

  Future dialog() {
    return AwesomeDialog(
            context: context,
            dialogType: DialogType.warning,
            borderSide: BorderSide(
              color: colors.constantOffWhite,
              width: 2,
            ),
            // width: 280,
            buttonsBorderRadius: const BorderRadius.all(Radius.circular(2)),
            dismissOnTouchOutside: true,
            dismissOnBackKeyPress: false,
            animType: AnimType.topSlide,
            title: 'Enter Website?',
            desc: "Bypass this screen and visit website?",
            btnOkText: "Go to Live.",
            btnCancelText: 'Cancel',
            btnCancelOnPress: () => {Navigator.pop(context)},
            btnOkOnPress: () => {toggleLive()},
            showCloseIcon: true)
        .show();
  }

  Widget notLiveScreen() {
    return Material(
      color: colors.constantBlue,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Flexible(
                  child: GestureDetector(
                    onLongPress: () => {dialog()},
                    child: Image.asset(
                      'lib/Images/CITex_noBack.png',
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                ),
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      'Come back at a later date and check out the place. Otherwise, meet us at the launch event when this timer hits zero!',
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: colors.constantOffWhite),
                      textAlign: TextAlign.center,
                      softWrap: true,
                    ),
                  ),
                ),
                Flexible(
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 30),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: colors.constantBlue,
                      border:
                          Border.all(width: 6, color: colors.constantOrange),
                    ),
                    child: TimerCountdown(
                      format: CountDownTimerFormat.daysHoursMinutesSeconds,
                      endTime: DateTime(2024, 1, 27, 18),
                      timeTextStyle: TextStyle(
                        color: colors.constantOffWhite,
                        fontWeight: FontWeight.w300,
                        fontSize: 40,
                        // fontFeatures: const <FontFeature>[
                        //   FontFeature.tabularFigures()
                        // ]
                      ),
                      descriptionTextStyle:
                          const TextStyle(color: Colors.white),
                      colonsTextStyle:
                          TextStyle(color: colors.constantOffWhite),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();

    // reference = FirebaseFirestore.instance.collection('websiteStats').doc('123456');
    // if(mounted) {
    //   reference.snapshots().listen((event) {
    //     setState(() {
    //       webLive = event.get('isLive');
    //     });
    //   });
    // }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getLiveStatus(),
        builder: (BuildContext context, AsyncSnapshot text) {
          if (text.connectionState == ConnectionState.done) {
            return Scaffold(
              body: webLive
                  ? SingleChildScrollView(
                      child: Container(
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.topRight,
                              colors: [
                            colors.constantLighterBlue,
                            colors.constantBlue
                          ])
                          //color: Color(0xffE3CB9A)
                          ),
                      child: Column(
                        children: [
                          //header(),
                          stackedContainers(context),
                          //firstContainer(),
                          bottomContainer(),
                          secondContainer(),
                          thirdContainer(),
                          fourthContainer(),
                          barTab()
                        ],
                      ),
                    ))
                  : notLiveScreen(),
            );
          }
          return const CircularProgressIndicator();
        });
  }

  Widget header() {
    final notifier = Provider.of<PageNotifier>(context);

    return Container(
      decoration: BoxDecoration(
          // gradient: LinearGradient(
          //     begin: Alignment.topLeft,
          //     end: Alignment.topRight,
          //     colors: [colors.constantLighterBlue, colors.constantBlue]
          // )
          color: Colors.transparent
          //color: Color(0xffE3CB9A)
          ),
      height: 60,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(
            'lib/Images/CITex_noBack.png',
            fit: BoxFit.fitWidth,
          ),
          Row(
            children: [
              TextButton(
                  onPressed: () => {
                        if (notifier.pageName != PageName.home)
                          {
                            notifier.changePage(
                                page: PageName.home, unknown: false)
                          }
                      },
                  child: const Text(
                    'Home',
                    style: TextStyle(color: Colors.white),
                  )),
              TextButton(
                  onPressed: () => {
                        if (notifier.pageName != PageName.services)
                          {
                            notifier.changePage(
                                page: PageName.services, unknown: false)
                          }
                      },
                  child: const Text(
                    'Services',
                    style: TextStyle(color: Colors.white),
                  )),
              TextButton(
                  onPressed: () => {
                        if (notifier.pageName != PageName.contact)
                          {
                            notifier.changePage(
                                page: PageName.contact, unknown: false)
                          }
                      },
                  child: const Text(
                    'Contact Us',
                    style: TextStyle(color: Colors.white),
                  )),
            ],
          ),
          Row(
            children: [roundButton('Sign Up'), roundButton('Log In')],
          )
        ],
      ),
    );
  }

  ///start of new
  Stack stackedContainers(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      fit: StackFit.passthrough,
      children: [
        firstContainer(context),

        //rectangle box
        Positioned(
          top: 400,
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: const EdgeInsets.only(right: 36.0, left: 36),
            child: Container(
              height: MediaQuery.of(context).size.height / 2,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey, spreadRadius: 3, blurRadius: 3),
                  ],
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              child: Column(
                //crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Flexible(
                    child: GestureDetector(
                      onLongPress: () { //have website locked
                        FirebaseFirestore.instance
                            .collection('websiteStats')
                            .doc('123456')
                            .update({'isLive': false}).then((value) => {
                                  setState(() {
                                    webLive = false;
                                  })
                                });
                      },
                      child: Container(
                        padding: EdgeInsets.zero,
                        height: 250,
                        child: Image.asset('lib/images/CITex_noBack.png'),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 0.0, left: 8),
                          child: Container(
                            // color: Colors.red,
                            width: MediaQuery.of(context).size.width / 2,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "Dream it, Chase it, Own it",
                                  style: GoogleFonts.permanentMarker(
                                    textStyle: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 36),
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                Expanded(
                                  child: Text(
                                      "The goal of CITex is to bring aspiring entrepreneurs, small business owners, and other organizations closer to their dreams through the integration of digital solutions. CITex strives to make the integration process as seamless as possible by collaborating directly with the client from the intake process and well beyond the launch of their solution.",
                                      style: GoogleFonts.caveat(
                                          textStyle: const TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold)),
                                      // softWrap: true,
                                      textAlign: TextAlign.center),
                                )
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding:
                                const EdgeInsets.only(left: 63.0, right: 64),
                            child: Column(
                              children: [
                                Flexible(
                                  child: Text("Sign in to your client account",
                                      style: GoogleFonts.caveat(
                                          textStyle: const TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold))),
                                ),
                                const TextField(
                                  decoration: InputDecoration(
                                      label: Text("Email"),
                                      icon: Icon(Icons.email_outlined)),
                                ),
                                const TextField(
                                  decoration: InputDecoration(
                                      label: Text("Password"),
                                      icon: Icon(Icons.password_outlined)),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: ElevatedButton(
                                      onPressed: () {},
                                      child: Text("Sign In",
                                          style: GoogleFonts.caveat(
                                              textStyle: const TextStyle(
                                                  fontSize: 18,
                                                  fontWeight:
                                                      FontWeight.bold)))),
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget firstContainer(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height / 1.5,
              width: MediaQuery.of(context).size.width,
              color: Colors.white,
              child: Image.asset(
                'lib/images/37_Sunset_Broadway_Bridge_and_Little_Rock_Skyline.jpg',
                fit: BoxFit.fill,
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * .3,
              color: Colors.grey[300],
            ),
          ],
        ),
        header()
      ],
    );
  }

  ///end of new

  Widget barTab() {
    return Container(
      decoration: BoxDecoration(color: Colors.grey[300]),
      height: MediaQuery.sizeOf(context).height * .1,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          TextButton(
              onPressed: () {},
              child: Text(
                "Privacy Policy",
                style: TextStyle(
                    decoration: TextDecoration.underline, color: Colors.black),
              )),
          TextButton(
              onPressed: () {},
              child: Text(
                "Privacy Policy",
                style: TextStyle(
                    decoration: TextDecoration.underline, color: Colors.black),
              )),
          TextButton(
              onPressed: () {},
              child: Text(
                "Privacy Policy",
                style: TextStyle(
                    decoration: TextDecoration.underline, color: Colors.black),
              ))
        ],
      ),
    );
  }

  // Widget firstContainer(){
  //   return Container(
  //       height: 700,//MediaQuery.of(context).size.height/1.5,
  //       decoration:  BoxDecoration(
  //           gradient: LinearGradient(
  //               begin: Alignment.centerLeft,
  //               end: Alignment.centerRight,
  //               colors: [ colors.constantLighterBlue,colors.constantBlue]
  //           )
  //         //color: Color(0xffE3CB9A)
  //       ),
  //     child: Padding(
  //       padding: const EdgeInsets.only(left: 48, right: 48),
  //       child: Row(children: [
  //        Expanded(
  //          child: Column(
  //            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //
  //            children: [
  //
  //              Spring.rotate(
  //                  child: GestureDetector(
  //                    onLongPress: () => {
  //                      FirebaseFirestore.instance.collection('websiteStats').doc('123456').update({
  //                        'isLive':false
  //                      }).then((value) => {
  //                        setState((){
  //                          webLive = false;
  //                        })
  //                      })
  //                    },
  //                    child: SizedBox(
  //                      height: 250,
  //                      child: Image.asset('lib/Images/CITex_Static.png'),
  //                    ).animate().scale(duration: 1000.ms),
  //                  ),springController: springController,
  //                  //alignment: Alignment.topRight,
  //                  curve: Curves.easeInCubic),
  //
  //              // SizedBox(
  //              //     height: 250,
  //              //     child: Image.asset('lib/Images/CITex_noBack.png')),
  //
  //              Text(
  //                'We Chase Your Innovations So That You Don\'t Have To!',
  //                style: GoogleFonts.poppins(
  //                    textStyle: const TextStyle(
  //                      color: Color(0xffab5a4b),fontSize: 30,
  //                      fontWeight: FontWeight.bold
  //                    )
  //                ),softWrap: true,
  //                textAlign: TextAlign.center,),
  //
  //
  //              Column(
  //                children: [
  //                  const Text('Launch Countdown. -Will be removed before launch',style: TextStyle(color: Colors.black),),
  //                  TimerCountdown(
  //                    format: CountDownTimerFormat.daysHoursMinutesSeconds,
  //                    endTime: DateTime(2024,1,27,18),
  //                  ),
  //                ],
  //              )
  //
  //              // Spring.shake(
  //              //        child: Flexible(
  //              //          child: Padding(
  //              //            padding: const EdgeInsets.only(bottom: 16.0),
  //              //            child: SizedBox(
  //              //                    height: 260,
  //              //                    child: Image.asset('lib/Images/phone1.png'))
  //              //                .animate()
  //              //                .fade(duration: 2500.ms),
  //              //          ),
  //              //        )),
  //               ],
  //          ),
  //        ),
  //           Expanded(
  //             child: Column(
  //               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //               children: [
  //
  //                 SizedBox(
  //                     height: 350,
  //                     child: Image.asset('lib/Images/CITex_noBack.png',fit: BoxFit.fitHeight,)),
  //                 // Spring.rotate(
  //                 //   child: SizedBox(
  //                 //   height: 250,
  //                 //   child: Image.asset('lib/Images/CITex_Static.png'),
  //                 // ).animate().scale(duration: 1000.ms),springController: springController,
  //                 // //alignment: Alignment.topRight,
  //                 // curve: Curves.easeInCubic),
  //
  //
  //                 Text(
  //                   'CITex looks out for the smaller players, bringing more affordable software so that small & upcoming businesses can still have funds to allocate elsewhere. We also focus on ensuring each business is apart of the development process and bring that \'family\' feeling to the table.',
  //                   style: GoogleFonts.poppins(
  //                       textStyle: const TextStyle(
  //                         color: Colors.white,fontSize: 18,
  //                       )
  //                   ),
  //                   textAlign: TextAlign.center,),
  //
  //                 Row(
  //                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //                   children: [
  //                     optionButtons('Contact Us', Colors.white),
  //                     optionButtons('Meet Exec Team', Colors.white)
  //                   ],
  //                 )
  //               ],
  //             ),
  //           )
  //         ],
  //       ),
  //     ),
  //   );
  // }

  Widget bottomContainer() {
    return Container(
      height: 80,
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset('lib/Images/androidLogo.png'),
          Image.asset('lib/Images/appleLogo.png'),
          Image.asset('lib/Images/internetLog.png')
        ],
      ),
    );
  }

  Widget secondContainer() {
    return Container(
        color: Colors.grey[100],
        height: 700, //MediaQuery.of(context).size.height*.5,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  customCard(
                      'Android',
                      "lib/Images/androidLogo.png",
                      'Developed by Google, Microsoft and more, the Android operating system is currently on a variety of devices including Samsung, LG, and many more!',
                      const Color(0xffab5a4b),
                      'Start With Android',
                      context,
                      "Google"),
                  customCard(
                      'Iphone',
                      "lib/Images/appleLogo.png",
                      'Popular due to its simple, yet elegant style, iOS can be found on any Apple device such as iPhone, IPad, iMac and more!',
                      const Color(0xffab5a4b),
                      'Start With Apple',
                      context,
                      'Apple'),
                  customCard(
                      'Web',
                      "lib/Images/internetLog.png",
                      'World Wide Web! It can be accessed from just about any device as long as there is internet accessibility.',
                      const Color(0xffab5a4b),
                      'Start With Website',
                      context,
                      'WWW')
                ],
              ),
            ),
            optionButtons('Build Custom Order', Colors.grey)
          ],
        ));
  }

  Widget thirdContainer() {
    return Container(
      color: Colors.grey[100],
      height: 800, //MediaQuery.of(context).size.height*.5,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Flexible(
            child: Text(
              'You Decide How You Would Like to Meet!',
              style: GoogleFonts.poppins(
                  textStyle: const TextStyle(
                      color: Color(0xffab5a4b),
                      fontSize: 28,
                      fontWeight: FontWeight.bold)),
            ),
          ),
          Flexible(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.asset(
                        'lib/Images/meeting-room-1806702_1280.jpg',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: ClipRRect(
                      // borderRadius: BorderRadius.circular(20),
                      child: Image.asset(
                        'lib/Images/Zoom_(1).png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          Flexible(
            child: Padding(
              padding: const EdgeInsets.all(60.0),
              child: Text(
                'Choose to meet select members from our team and get the full design and connection experience, or sit from the comfort of your home and discuss your ideas. Regardless of the route chosen, you will still get the connection and attention you deserve. There will be several meeting addresses to chose from. Don\'t use Zoom? Our team will adapt to several other video call platforms. The choice is yours!',
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                  textStyle: const TextStyle(
                    color: Color(0xffab5a4b),
                    fontSize: 18,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget fourthContainer() {
    return Container(
      color: Colors.white,
      height: 700,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: Text('We don\'t want to tie up your funds',
                  style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                          color: Color(0xffab5a4b),
                          fontSize: 28,
                          fontWeight: FontWeight.bold))),
            ),
            Flexible(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    //
                    // Flexible(
                    //   child: Text('We don\'t want to tie up your funds',style: GoogleFonts.poppins(
                    //       textStyle: const TextStyle(
                    //         color: Color(0xffab5a4b),fontSize: 28,fontWeight: FontWeight.bold
                    //       )
                    //   )),
                    // ),
                    // const Flexible(
                    //   child: Row(
                    //      children: [
                    //         Flexible(
                    //          child:  Text(
                    //            'Opt for a payment plan that includes different options including paying a less amount on the front end of the plan. Rest assured, you will still be able to use your software during this plan! ',
                    //            style: TextStyle(
                    //              color: Color(0xffab5a4b),
                    //              fontSize: 18,
                    //            ),textAlign: TextAlign.center,
                    //          ),
                    //        ),
                    //
                    //        Spacer()
                    //      ],
                    //    ),
                    // ),
                    Expanded(
                      child: Column(
                        children: [
                          const Flexible(
                            child: Text(
                              'Opt for a payment plan that includes different options including paying a less amount on the front end of the plan. Rest assured, you will still be able to use your software during this plan! ',
                              style: TextStyle(
                                color: Color(0xffab5a4b),
                                fontSize: 18,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Flexible(
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Image.asset(
                                  'lib/Images/contract.jpg',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),

                          // const Flexible(
                          //   child:  Text(
                          //     'Opt for a payment plan that includes different options including paying a less amount on the front end of the plan. Rest assured, you will still be able to use your software during this plan! ',
                          //     style: TextStyle(
                          //       color: Color(0xffab5a4b),
                          //       fontSize: 18,
                          //     ),textAlign: TextAlign.center,
                          //   ),
                          // ),
                        ],
                      ),
                    ),

                    Expanded(
                      child: Column(
                        children: [
                          Flexible(
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Image.asset(
                                  'lib/Images/money-256315_1280.jpg',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          const Flexible(
                            child: Text(
                              'Customize your package that fits your business\'s financial plans. Regardless of your payment option, you will still receive the same experience. We strive to keep your business at interest.',
                              style: TextStyle(
                                color: Color(0xffab5a4b),
                                fontSize: 18,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    )

                    // const Flexible(
                    //   child: Row(
                    //     children: [
                    //       Spacer(),
                    //
                    //       Flexible(
                    //         child:  Text(
                    //           'Customize your package that fits your business\'s financial plans. Regardless of your payment option, you will still receive the same experience. We strive to keep your business at interest.',
                    //           style: TextStyle(
                    //             color: Color(0xffab5a4b),
                    //             fontSize: 18,
                    //           ),textAlign: TextAlign.center,
                    //         ),
                    //       ),
                    //
                    //     ],
                    //   ),
                    // ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  roundButton(String buttonText) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: ElevatedButton(
        onPressed: () => {},
        style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18),
            )),
            backgroundColor:
                MaterialStateProperty.all(const Color(0xffab5a4b))),
        child: Text(
          buttonText,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  optionButtons(String buttonText, Color buttonColor) {
    bool isHovering = false;

    return ElevatedButton(
      onPressed: () => {},
      style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(3)),
          ),
          backgroundColor: MaterialStateProperty.all(buttonColor)),
      child: Text(
        buttonText,
        style: const TextStyle(
            color: Color(0xffab5a4b), fontWeight: FontWeight.bold),
      ),
    );
  }

  customCard(
      String cardTitle,
      String picPath,
      String content,
      Color buttonColor,
      String buttonText,
      BuildContext context,
      String subTitle) {
    return SizedBox(
      width: 300, //MediaQuery.of(context).size.width/3-24,
      height: 425, //MediaQuery.of(context).size.height/2.5,
      child: GFCard(
        color: Colors.white,
        elevation: 10,
        boxFit: BoxFit.cover,
        titlePosition: GFPosition.start,
        //  showOverlayImage: true,
        image: Image.asset(
          picPath,
          height: MediaQuery.of(context).size.height * 0.1,
          width: MediaQuery.of(context).size.width * 0.2,
        ),
        showImage: true,
        title: GFListTile(
          //avatar: const GFAvatar(),
          titleText: cardTitle,
          subTitleText: subTitle,
        ),
        content: Text(content),
        buttonBar: GFButtonBar(
          runAlignment: WrapAlignment.end,
          crossAxisAlignment: WrapCrossAlignment.end,
          children: [
            GFButton(
              onPressed: () => {},
              color: buttonColor,
              child: Text(buttonText),
            )
            // InkWell(
            //   onTap: ()=>{},
            //   child: GFAvatar(
            //     backgroundColor: buttonColor,
            //     radius: 30,
            //     shape: GFAvatarShape.standard,
            //     size: GFSize.LARGE,
            //     child: Text(buttonText),
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}
