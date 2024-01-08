import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../Constants/Colors.dart';
import '../../enums.dart';
import '../../route/pageNotifier.dart';


class ContactScreenFullSize extends StatefulWidget {
  const ContactScreenFullSize({Key? key}) : super(key: key);

  @override
  State<ContactScreenFullSize> createState() => _ContactScreenFullSizeState();
}

class _ContactScreenFullSizeState extends State<ContactScreenFullSize> {

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
          secondContainer()],
        ),
      ),
    )
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
          Image.asset('lib/Images/CITex_noBack.png',fit: BoxFit.fitWidth,),

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
                  onPressed: () => {
                    if(notifier.pageName != PageName.services){
                      notifier.changePage(page: PageName.services, unknown: false)
                    }
                  },
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
      height: 600,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.topRight,
              colors: [colors.constantLighterBlue, colors.constantBlue])
        //color: Color(0xffE3CB9A)
      ),

      child: Row(
        children: [
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 40.0,left: 24),
                  child: Text('Contact Us',style: GoogleFonts.poppins(
                      textStyle:  TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 32,
                          color: colors.constantOffWhite
                      )),),
                ),

                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text('Connect with us! Feel free to reach out for a question, a comment or even a suggestion. Fill out the comment card below and we will get back with you. You can reach out directly via email or phone call!',
                      style: GoogleFonts.poppins(
                          textStyle:  TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: colors.constantOffWhite
                          )),textAlign: TextAlign.center,),
                  ),
                ),

                Column(
                  children: [
                    Padding(
                      padding:  const EdgeInsets.only(right: 16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Icon(Icons.phone,color: colors.constantOffWhite,),
                          Text('  479-264-1744',style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: colors.constantOffWhite
                          ),),

                          IconButton(onPressed: ()=>{}, icon: Icon(Icons.save_as_rounded, color: colors.constantOffWhite,))
                        ],
                      ),
                    ),
                    Padding(
                      padding:  const EdgeInsets.only(right: 16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Icon(Icons.email_outlined,color: colors.constantOffWhite,),
                          Text('  citex@citex.tech',style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: colors.constantOffWhite
                          ),),
                          IconButton(onPressed: ()=>{}, icon: Icon(Icons.save_as_rounded, color: colors.constantOffWhite,))
                        ],
                      ),
                    )
                  ],
                )


              ],
            ),
          ),
          SizedBox(
            height: 700,
            width: 700,
            child: Image.asset("lib/Images/CITex_noBack.png"),
          )
        ],
      ),
    );
  }

  Widget secondContainer(){
    return Container(
      height: 600,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.topRight,
              colors: [colors.constantLighterBlue, colors.constantBlue])
        //color: Color(0xffE3CB9A)
      ),

      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                decoration: InputDecoration(border: const OutlineInputBorder(),
                    labelText: 'Enter Your Name',
                    labelStyle: GoogleFonts.poppins(
                        textStyle: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: colors.constantOffWhite))),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    labelText: 'Email',
                    labelStyle: GoogleFonts.poppins(
                        textStyle: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: colors.constantOffWhite))),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  TextFormField(
                    maxLines: null,
                    maxLength: 700,
                    decoration: InputDecoration(
                        filled: true,
                        border: const OutlineInputBorder(),
                        labelText: 'Text',
                        labelStyle: GoogleFonts.poppins(
                            textStyle: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: colors.constantOffWhite))),
                  ),

                  roundButton('Submit')
                ],
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
            backgroundColor: MaterialStateProperty.all(const Color(0xffab5a4b))),
        child: Text(buttonText,style: const TextStyle(color: Colors.white),),
      ),
    );
  }
  optionButtons(String buttonText, Color buttonColor) {
    bool isHovering = false;

    return ElevatedButton(
      onPressed: () => {},
      style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(3)
            ),
          ),
          backgroundColor: MaterialStateProperty.all(buttonColor)
      ),
      child: Text(buttonText,style: const TextStyle(color:Color(0xffab5a4b),
          fontWeight: FontWeight.bold ),),
    );
  }

}
