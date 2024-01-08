import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../Constants/Colors.dart';
import '../../enums.dart';
import '../../route/pageNotifier.dart';

class ServicesScreenFullSize extends StatefulWidget {
  const ServicesScreenFullSize({Key? key}) : super(key: key);

  @override
  State<ServicesScreenFullSize> createState() => _ServicesScreenFullSizeState();
}

class _ServicesScreenFullSizeState extends State<ServicesScreenFullSize> {
  ConstantColors colors = ConstantColors();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.topRight,
                  colors: [colors.constantLighterBlue, colors.constantBlue])
            //color: Color(0xffE3CB9A)
          ),
          child: Column(
            children: [
              header(),
              firstContainer(),
              secondContainer(),
              thirdContainer(),
              fourthContainer(),
              fifthContainer()
            ],
          ),
        ),
      ),
    );
  }


  Widget header(){
    final notifier = Provider.of<PageNotifier>(context);

    return Container(
      decoration:  BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.topRight,
              colors: [colors.constantLighterBlue, colors.constantBlue]
          )
        //color: Color(0xffE3CB9A)
      ),
      height: 60,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
              onTap: ()=>{
                if(notifier.pageName != PageName.home){
                  notifier.changePage(page: PageName.home, unknown: false)
                }
              },
              child: Image.asset('lib/Images/CITex_noBack.png',fit: BoxFit.fitWidth,)),

          Row(
            children: [
              TextButton(
                  onPressed: () => {
                    if(notifier.pageName != PageName.home){
                      notifier.changePage(page: PageName.home, unknown: false)
                    }
                  },
                  child: const Text(
                    'Home',
                    style: TextStyle(color: Colors.white),
                  )),
              TextButton(
                  onPressed: () => {},
                  child: const Text(
                    'Services',
                    style: TextStyle(color: Colors.white),
                  )),
              TextButton(
                  onPressed: () => {
                    if(notifier.pageName != PageName.contact){
                      notifier.changePage(page: PageName.contact, unknown: false)
                    }
                  },
                  child: const Text(
                    'Contact Us',
                    style: TextStyle(color: Colors.white),
                  )),
            ],
          ),
          Row(
            children: [
              roundButton('Sign Up'),
              roundButton('Log In')
            ],
          )
        ],
      ),
    );
  }

  Widget firstContainer(){
    return Container(
      height: 200,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.topRight,
              colors: [colors.constantLighterBlue, colors.constantBlue])
        //color: Color(0xffE3CB9A)
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [


              Text('Services',style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: colors.constantOffWhite,
                  fontSize: 48)),),


              //Removed image
              // SizedBox(
              //   height: 100,
              //   child: Image.asset('lib/Images/CITex_noBack.png',fit: BoxFit.fill,),
              // ),
            ],
          ),
        ],
      ),
    );
  }

  Widget secondContainer(){
    return Container(
      height: 300,
      color: Colors.grey[200],
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Image.asset("lib/Images/man-4365597_1280.png"),
          ),
          
          Expanded(
            child: Column(
              mainAxisAlignment:MainAxisAlignment.spaceEvenly,
              children: [
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Your Own Dedicated Liaison',style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: colors.constantOffWhite,
                            fontSize: 42))),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Your own personal connection to our dev team! Use your assigned liaison to assist with tasks such as updates on a project, making an adjustment to your software, payment questions, and any other concerns!',style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: colors.constantOffWhite,
                          fontSize: 22),),textAlign: TextAlign.center,),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget thirdContainer(){
    return Container(
      height: 400,
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [

          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Create a Mobile Application from Scratch',style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: colors.constantOffWhite,
                          fontSize: 42)),textAlign: TextAlign.center,),
                ),

                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Assign a team to create a mobile application on Android and or IPhone operating systems.',style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: colors.constantOffWhite,
                            fontSize: 22)),textAlign: TextAlign.center,),
                  ),
                ),

                //OS images
                Flexible(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.asset('lib/Images/appleLogo.png'),
                      Image.asset('lib/Images/androidLogo.png'),
                    ],
                  ),
                )
              ],
            ),
          ),

          Flexible(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Image.asset('lib/Images/smartphone-1833950_1280.png'),
            ),
          )
        ],
      ),
    );
  }

  Widget fourthContainer(){
    return Container(
      height: 400,
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text('Establish Your Presence with a Website',style: GoogleFonts.poppins(
              textStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: colors.constantOffWhite,
                  fontSize: 42)),textAlign: TextAlign.center,),
          Flexible(
            child: Padding(
              padding: const EdgeInsets.only(top: 8.0,left: 16,right: 16),
              child: Text('No more headaches using online tools to build your brand. Let us handle all the work for you and go further than an online tools ever could. Using a website you can create an online shopping center, provide an admin panel for another software and so much more... the list goes on.',style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: colors.constantOffWhite,
                      fontSize: 22)),textAlign: TextAlign.center,),
            ),
          ),

          Flexible(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(height: 100, child: Image.asset('lib/Images/google-chrome-1326908_1280.png')),
                Image.asset("lib/Images/internet-1881760_1280.png"),
                SizedBox(height: 150, child: Image.asset('lib/Images/safari-icon-01.png'))
              ],
            ),
          ),

        ],
      ),
    );
  }


  Widget fifthContainer(){
    return Container(
      height: 550,
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
                        fontSize: 42))),
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
                            fontSize: 22)),textAlign: TextAlign.center,),
                  ),
                )

              ],
            ),
          ),
        ],
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
            backgroundColor: MaterialStateProperty.all(const Color(0xffab5a4b))),
        child: Text(buttonText,style: const TextStyle(color: Colors.white),),
      ),
    );
  }
}
