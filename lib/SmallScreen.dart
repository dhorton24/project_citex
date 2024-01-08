//import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_timer_countdown/flutter_timer_countdown.dart';
import 'package:getwidget/components/button/gf_button.dart';
import 'package:getwidget/components/button/gf_button_bar.dart';
import 'package:getwidget/components/card/gf_card.dart';
import 'package:getwidget/components/list_tile/gf_list_tile.dart';
import 'package:getwidget/position/gf_position.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_citex/Constants/Colors.dart';
import 'package:project_citex/CustomObjects/Website%20Stats.dart';
import 'package:project_citex/route/pageNotifier.dart';
import 'package:provider/provider.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:awesome_dialog/awesome_dialog.dart';

import 'enums.dart';

class SmallScreen extends StatefulWidget {
 WebsiteStats websiteStats;

  SmallScreen({super.key,
    required  this.websiteStats
});

  @override
  State<SmallScreen> createState() => _SmallScreenState();
}

class _SmallScreenState extends State<SmallScreen> {
  ConstantColors colors = ConstantColors();

  bool showOptions = false;
  WebsiteStats websiteStats = WebsiteStats(isLive: false, status: 'off');

  // bool webLive = true;

  bool showAndroidCard = true;
  bool showAppleCard = false;
  bool showWebCard = false;

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
            desc: "Go Live?",
            btnOkText: "Go to website.",
            btnCancelText: 'Cancel',
            btnCancelOnPress: () => {Navigator.pop(context)},
            btnOkOnPress: () => {toggleLive()},
            showCloseIcon: true)
        .show();
  }

  Future<void> getLiveStatus() async {
    final docRef = FirebaseFirestore.instance
        .collection('websiteStats')
        .doc('123456')
        .withConverter(
            fromFirestore: WebsiteStats.fromFireStore,
            toFirestore: (WebsiteStats websiteState, _) =>
                websiteState.toFireStore());

    final docSnap = await docRef.get();

    widget.websiteStats = docSnap.data()!;

  }

  toggleLive() {
    final ref =
        FirebaseFirestore.instance.collection('websiteStats').doc('123456');


    ref.update({'isLive': true}).then((value) => {
    setState(() {
    widget.websiteStats.isLive = true;

    })
    });


  }

  Widget notLiveScreen() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onLongPress: () => {dialog()},
          child: Image.asset(
            'lib/Images/CITex_noBack.png',
            fit: BoxFit.fitHeight,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            'Come back at a later date and check out the place. Otherwise, meet us at the launch event when this timer hits zero!',
            style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: colors.constantOffWhite),
            textAlign: TextAlign.center,
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 30),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: colors.constantBlue,
            border: Border.all(width: 6, color: colors.constantOrange),
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
            descriptionTextStyle: const TextStyle(color: Colors.white),
            colonsTextStyle: TextStyle(color: colors.constantOffWhite),
          ),
        ),
      ],
    );
  }

  @override
  void initState() {
    super.initState();

    getLiveStatus();

    // DocumentReference reference =
    //     FirebaseFirestore.instance.collection('websiteStats').doc('123456');
    //
    // if(mounted) {
    //   reference.snapshots().listen((event) {
    //   setState(() {
    //     widget.websiteStats.status = event.get('status');
    //   });
    // });
    // }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getLiveStatus(),
        initialData: const Text("Loading"),
        builder: (BuildContext context, AsyncSnapshot text) {
          if (text.connectionState == ConnectionState.done) {
            return
                //backgroundColor: !webLive ? colors.constantBlue : null,

                // websiteStats.status != "live" ? const Scaffold(body: Center(child: Text("Loading"),)) :
                Scaffold(
              body: widget.websiteStats.isLive == true
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
                            header(),
                            firstContainer(),
                            osContainer(),
                            secondContainer(),
                            thirdContainer(),
                            fourthContainer()
                          ],
                        ),
                      ),
                    )
                  : notLiveScreen(),
            );
          }
          else if(text.connectionState == ConnectionState.waiting){
            return const Scaffold(
              body: Center(child: CircularProgressIndicator(),),
            );
          }

          return const CircularProgressIndicator();
        });
  }

  Widget header() {
    final notifier = Provider.of<PageNotifier>(context);

    return Container(
      height: 120,
      color: colors.constantBlue,
      // decoration: BoxDecoration(
      //     gradient: LinearGradient(
      //         begin: Alignment.topLeft,
      //         end: Alignment.topRight,
      //         colors: [colors.constantLighterBlue, colors.constantBlue])
      //     //color: Color(0xffE3CB9A)
      //     ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: SizedBox(
                    height: 80,
                    child: Image.asset(
                      'lib/Images/CITex_noBack.png',
                      fit: BoxFit.fitWidth,
                    )),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Row(
                  children: [
                    IconButton(
                        onPressed: () => {},
                        icon: const Icon(
                          Icons.login,
                          color: Color(0xffe4cb9c),
                        )),
                    IconButton(
                        onPressed: () => {},
                        icon: const Icon(
                          Icons.person_add_alt_outlined,
                          color: Color(0xffe4cb9c),
                        )),
                  ],
                ),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                onPressed: () => {
                  if (notifier.pageName != PageName.home)
                    {
                      notifier.changePage(page: PageName.home, unknown: false),
                    }
                },
                child: const Text(
                  'Home',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Color(0xffe4cb9c)),
                ),
              ),
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
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Color(0xffe4cb9c)),
                ),
              ),
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
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Color(0xffe4cb9c)),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  // Widget option(BuildContext context) {
  //   return Stack(alignment: AlignmentDirectional.topCenter, children: [
  //     Container(
  //       decoration: BoxDecoration(
  //           gradient: LinearGradient(
  //               begin: Alignment.topLeft,
  //               end: Alignment.topRight,
  //               colors: [colors.constantLighterBlue, colors.constantBlue])
  //           //color: Color(0xffE3CB9A)
  //           ),
  //       height: 200,
  //     ),
  //     Container(
  //       decoration: BoxDecoration(
  //         borderRadius: BorderRadius.circular(20),
  //         color: const Color(0xffe4cb9c),
  //       ),
  //       height: 200,
  //       width: MediaQuery.of(context).size.width / 2,
  //       child: Row(
  //         mainAxisAlignment: MainAxisAlignment.center,
  //         children: [
  //           Column(
  //             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //             children: [
  //               TextButton(
  //                   onPressed: () => {},
  //                   child: const Text(
  //                     'Home',
  //                     style:
  //                         TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
  //                   )),
  //               TextButton(
  //                   onPressed: () => {},
  //                   child: const Text('Services',
  //                       style: TextStyle(
  //                           fontWeight: FontWeight.bold, fontSize: 18))),
  //               TextButton(
  //                   onPressed: () => {},
  //                   child: const Text('Contact Us',
  //                       style: TextStyle(
  //                           fontWeight: FontWeight.bold, fontSize: 18))),
  //             ],
  //           ),
  //         ],
  //       ),
  //     ),
  //   ]);
  // }

  Widget firstContainer() {
    return Container(
      height: 610,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: [colors.constantLighterBlue, colors.constantBlue])
          //color: Color(0xffE3CB9A)
          ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  height: 175,
                  child: Image.asset('lib/Images/CITex_noBack.png'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'We Chase Your Innovations So That You Don\'t Have To!',
                  style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                          color: Color(0xffab5a4b),
                          fontSize: 22,
                          fontWeight: FontWeight.bold)),
                  softWrap: true,
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'CITex looks out for the smaller players, bringing more affordable software so that small & upcoming businesses can still have funds to allocate elsewhere. We also focus on ensuring each business is apart of the development process and bring that \'family\' feeling to the table.',
                  style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  )),
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: GestureDetector(
                  onLongPress: () => {
                    FirebaseFirestore.instance
                        .collection('websiteStats')
                        .doc('123456')
                        .update({'isLive': false}).then((value) => {
                              setState(() {
                                websiteStats.isLive = false;
                              })
                            })
                  },
                  child: SizedBox(
                    height: 100,
                    child: Image.asset(
                      'lib/Images/CITex_Static.png',
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget osContainer() {
    return Container(
      height: 100,
      color: Colors.white,
      child: Column(
        children: [
          Flexible(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Explore Operating Systems',
                style: GoogleFonts.poppins(
                    textStyle: const TextStyle(
                  fontWeight: FontWeight.bold,
                )),
              ),
            ),
          ),
          Flexible(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap: () => {
                    setState(() {
                      showAppleCard = false;
                      showWebCard = false;
                      showAndroidCard = true;
                    })
                  },
                  child: showAndroidCard
                      ? Image.asset('lib/Images/androidLogo.png')
                          .animate(onPlay: (controller) => controller.repeat())
                          .blur(delay: 900.ms)
                      : Image.asset('lib/Images/androidLogo.png'),
                ),
                InkWell(
                  onTap: () => {
                    setState(() {
                      showWebCard = false;
                      showAndroidCard = false;
                      showAppleCard = true;
                    })
                  },
                  child: showAppleCard
                      ? Image.asset('lib/Images/appleLogo.png')
                          .animate(onPlay: (controller) => controller.repeat())
                          .blur(delay: 900.ms)
                      : Image.asset('lib/Images/appleLogo.png'),
                ),
                InkWell(
                  onTap: () => {
                    setState(() {
                      showAppleCard = false;
                      showAndroidCard = false;
                      showWebCard = true;
                    })
                  },
                  child: showWebCard
                      ? Image.asset('lib/Images/internetLog.png')
                          .animate(onPlay: (controller) => controller.repeat())
                          .blur(delay: 900.ms)
                      : Image.asset('lib/Images/internetLog.png'),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget secondContainer() {
    return Container(
      height: 440,
      color: Colors.grey[100],
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              customCard(
                  'Android',
                  "lib/Images/androidLogo.png",
                  'Developed by Google, Microsoft and more, the Android operating system is currently on a variety of devices including Samsung, LG, and many more!',
                  const Color(0xffab5a4b),
                  'Start With Android',
                  context,
                  "Google",
                  showAndroidCard),
              customCard(
                  'Iphone',
                  "lib/Images/appleLogo.png",
                  'Popular due to its simple, yet elegant style, iOS can be found on any Apple device such as iPhone, IPad, iMac and more!',
                  const Color(0xffab5a4b),
                  'Start With Apple',
                  context,
                  'Apple',
                  showAppleCard),
              customCard(
                  'Web',
                  "lib/Images/internetLog.png",
                  'World Wide Web! It can be accessed from just about any device as long as there is internet accessibility.',
                  const Color(0xffab5a4b),
                  'Start With Website',
                  context,
                  'WWW',
                  showWebCard)
            ],
          ),
        ],
      ),
    );
  }

  Widget thirdContainer() {
    return Container(
      height: 915,
      color: Colors.grey[100],
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Flexible(
            child: Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: Text(
                'You Decide How You Would Like to Meet!',
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                    textStyle: const TextStyle(
                        color: Color(0xffab5a4b),
                        fontSize: 28,
                        fontWeight: FontWeight.bold)),
              ),
            ),
          ),
          Flexible(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
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
                    padding: const EdgeInsets.all(8.0),
                    child: ClipRRect(
                      // borderRadius: BorderRadius.circular(20),
                      child: Image.asset(
                        'lib/Images/Zoom_(1).png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Flexible(
            fit: FlexFit.loose,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
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
      height: 750,
      color: Colors.white,
      child: Row(
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8.0, right: 8),
                  child: Text('We don\'t want to tie up your funds',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                              color: Color(0xffab5a4b),
                              fontSize: 28,
                              fontWeight: FontWeight.bold))),
                ),
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
          ),
        ],
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
      String subTitle,
      bool showCard) {
    return showCard
        ? SizedBox(
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
          ).animate().fadeIn(duration: 1800.ms)
        : const SizedBox();
  }
}
