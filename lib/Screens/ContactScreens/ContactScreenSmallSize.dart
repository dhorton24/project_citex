import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../Constants/Colors.dart';
import '../../enums.dart';
import '../../route/pageNotifier.dart';

class ContactScreenSmallSize extends StatefulWidget {
  const ContactScreenSmallSize({Key? key}) : super(key: key);

  @override
  State<ContactScreenSmallSize> createState() => _ContactScreenSmallSizeState();
}

class _ContactScreenSmallSizeState extends State<ContactScreenSmallSize> {
  ConstantColors colors = ConstantColors();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child:
        Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [colors.constantLighterBlue, colors.constantBlue])
            //color: Color(0xffE3CB9A)
          ),
          child: Column(
            children: [
              header(),
              firstContainer(),
              secondContainer(),
              thirdContainer(),
            ],
          ),
        ),
      )
    );
  }


  Widget header(){
    final notifier = Provider.of<PageNotifier>(context);
    return Container(
      height: 100,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.topRight,
              colors: [colors.constantLighterBlue, colors.constantBlue])
        //color: Color(0xffE3CB9A)
      ),

      child: Column(
        children: [
          Row(
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

        ],
      ),
    );
  }

  Widget firstContainer(){
    return Container(
      height: 300,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.topRight,
              colors: [colors.constantLighterBlue, colors.constantBlue])
        //color: Color(0xffE3CB9A)
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text('Contact Us',style: GoogleFonts.poppins(
                textStyle:  TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 26,
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
          )
        ],
      ),
    );
  }

  Widget secondContainer(){
    return Container(
      height: 500,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [colors.constantLighterBlue, colors.constantBlue])
          //color: Color(0xffE3CB9A)
        ),

        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
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
                        ),)
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
                        ),)
                      ],
                    ),
                  )

                ],
              ),
              
            Column(
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
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        maxLines: null,
                        maxLength: 400,
                        decoration: InputDecoration(
                            filled: true,
                            border: const OutlineInputBorder(),
                            labelText: 'Text',
                            labelStyle: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: colors.constantOffWhite))),
                      ),
                    ),
                    roundButton('Submit')
                  ],
                ),
              ],
            )

          ],
          ),
        ),
    );
  }

  Widget thirdContainer(){
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset('lib/Images/CITex_noBack.png'),
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
