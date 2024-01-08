import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../Constants/Colors.dart';
import '../../enums.dart';
import '../../route/pageNotifier.dart';


class ServicesScreenSmallSize extends StatefulWidget {
  const ServicesScreenSmallSize({Key? key}) : super(key: key);

  @override
  State<ServicesScreenSmallSize> createState() => _ServicesScreenSmallSizeState();
}

class _ServicesScreenSmallSizeState extends State<ServicesScreenSmallSize> {

  ConstantColors colors = ConstantColors();

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SingleChildScrollView(
        child: Column(
          children: [
            header(),
            Column(
              children: [
                firstContainer(),
                secondContainer(),
                thirdContainer(),
                fourthContainer()
              ],
            ),


          ],
        ),
      ),
    );
  }

  Widget header(){
    final notifier = Provider.of<PageNotifier>(context);

    return Container(
      height: 120,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: [colors.constantLighterBlue, colors.constantBlue])
        //color: Color(0xffE3CB9A)
      ),
      child: Column(
       crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,

              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: GestureDetector(
                    onTap: ()=>{
                      if(notifier.pageName != PageName.home){
                        notifier.changePage(page: PageName.home, unknown: false)
                      }
                    },
                    child: SizedBox(
                        height: 80,
                        child: Image.asset(
                          'lib/Images/CITex_noBack.png',
                          fit: BoxFit.fitWidth,
                        )),
                  ),
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
          ),

          Flexible(
            child: Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Text('Services',style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: colors.constantOffWhite,
                      fontSize: 48)),),
            ),
          )

        ],
      ),
    );
  }


  Widget firstContainer(){
    return Container(
      height: 750,
      color: Colors.grey[200],
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Flexible(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Your Own Dedicated Liaison',style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: colors.constantOffWhite,
                      fontSize: 42)),textAlign: TextAlign.center,),
            ),
          ),
          Flexible(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Image.asset("lib/Images/man-4365597_1280.png"),
            ),
          ),

          Flexible(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Your own personal connection to our dev team! Use your assigned liaison to assist with tasks such as updates on a project, making an adjustment to your software, payment questions, and any other concerns!',style: GoogleFonts.poppins(
                textStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: colors.constantOffWhite,
                    fontSize: 18),),textAlign: TextAlign.center,),
            ),
          ),
        ],
      ),
    );
  }


  Widget secondContainer(){
    return Container(
      color: Colors.white,
      height: 600,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Flexible(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Create a Mobile Application from Scratch',style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: colors.constantOffWhite,
                      fontSize: 28)),textAlign: TextAlign.center,),
            ),
          ),

          Flexible(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset('lib/Images/appleLogo.png'),
                Image.asset('lib/Images/androidLogo.png'),
              ],
            ),
          ),

          Flexible(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Assign a team to create a mobile application on Android and or IPhone operating systems.',style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: colors.constantOffWhite,
                      fontSize: 18)),textAlign: TextAlign.center,),
            ),
          ),


        ],
      ),
    );
  }

  Widget thirdContainer(){
    return Container(
      height: 700,
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text('Establish Your Presence with a Website',style: GoogleFonts.poppins(
              textStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: colors.constantOffWhite,
                  fontSize: 28)),textAlign: TextAlign.center,),


          Flexible(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Flexible(child: SizedBox(height: 100, child: Image.asset('lib/Images/google-chrome-1326908_1280.png'))),
                Flexible(child: SizedBox(height: 150, child: Image.asset('lib/Images/safari-icon-01.png')))
              ],
            ),

          ),

          Flexible(
            child: Padding(
              padding: const EdgeInsets.only(top: 8.0,left: 16,right: 16),
              child: Text('No more headaches using online tools to build your brand. Let us handle all the work for you and go further than an online tools ever could. Using a website you can create an online shopping center, provide an admin panel for another software and so much more... the list goes on.',style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: colors.constantOffWhite,
                      fontSize: 18)),textAlign: TextAlign.center,),
            ),
          ),

        ],
      ),
    );
  }

  Widget fourthContainer(){
    return Container(
      height: 750,
      color: Colors.grey[200],
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text('... or Start a Packaged Deal',style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: colors.constantOffWhite,
                        fontSize: 42)),textAlign: TextAlign.center,),
                Flexible(child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset('lib/Images/postal-32383_1280.png'),
                )),

                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 16.0, right: 16),
                    child: Text('Get with our team to build a custom package. Customize your mobile application(s) and the target operating system(s). You may choose to add a website to go along with this package. All of this at a rate cheaper than purchasing it separately.',style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: colors.constantOffWhite,
                            fontSize: 18)),textAlign: TextAlign.center,),
                  ),
                )

              ],
            ),
          ),
        ],
      ),
    );
  }
}
