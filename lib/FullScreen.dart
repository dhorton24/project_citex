import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:spring/spring.dart';
import 'package:getwidget/getwidget.dart';



class FullScreen extends StatefulWidget {
  const FullScreen({Key? key}) : super(key: key);

  @override
  State<FullScreen> createState() => _FullScreenState();
}

class _FullScreenState extends State<FullScreen> {


  final SpringController springController = SpringController(initialAnim: Motion.mirror);



  @override
  void initState() {
    super.initState();


  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(

        body: SingleChildScrollView(
            child: Column(
              children: [
                header(),
                firstContainer(),
                 bottomContainer(),
                 secondContainer(),
                 thirdContainer()
              ],
            )
        ));
  }


  Widget header(){
    return Container(

      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.topRight,
              colors: [Colors.white, Color(0xffab5a4b)]
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
                  onPressed: () => {},
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
                  onPressed: () => {},
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
        height: 700,//MediaQuery.of(context).size.height/1.5,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.topRight,
                colors: [Colors.white, Color(0xffab5a4b)]
            )
          //color: Color(0xffE3CB9A)
        ),
      child: Padding(
        padding: const EdgeInsets.only(left: 48, right: 48),
        child: Row(children: [
         Expanded(
           child: Column(
             mainAxisAlignment: MainAxisAlignment.spaceEvenly,

             children: [

               SizedBox(
                   height: 250,
                   child: Image.asset('lib/Images/CITex_noBack.png')),

               Text(
                 'We Chase Your Innovations So That You Don\'t Have To!',
                 style: GoogleFonts.poppins(
                     textStyle: const TextStyle(
                       color: Color(0xffab5a4b),fontSize: 30,
                       fontWeight: FontWeight.bold
                     )
                 ),softWrap: true,
                 textAlign: TextAlign.center,),
               const Spacer(),
               // Spring.shake(
               //        child: Flexible(
               //          child: Padding(
               //            padding: const EdgeInsets.only(bottom: 16.0),
               //            child: SizedBox(
               //                    height: 260,
               //                    child: Image.asset('lib/Images/phone1.png'))
               //                .animate()
               //                .fade(duration: 2500.ms),
               //          ),
               //        )),
                ],
           ),
         ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Spring.rotate(
                    child: SizedBox(
                    height: 250,
                    child: Image.asset('lib/Images/CITex_Static.png'),
                  ).animate().scale(duration: 1000.ms),springController: springController,
                  //alignment: Alignment.topRight,
                  curve: Curves.easeInCubic),


                  Text(
                    'CITex looks out for the smaller players, bringing more affordable software so that small & upcoming businesses can still have funds to allocate elsewhere. We also focus on ensuring each business is apart of the development process and bring that \'family\' feeling to the table.',
                    style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                          color: Colors.white,fontSize: 18,
                        )
                    ),
                    textAlign: TextAlign.center,),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      optionButtons('Contact Us', Colors.white),
                      optionButtons('Meet Exec Team', Colors.white)
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget bottomContainer(){
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

  Widget secondContainer(){
    return Container(
      color: Colors.grey[100],
      height: 700,//MediaQuery.of(context).size.height*.5,
      child:  Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

         Flexible(
           child: Row(
             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
             children: [
               customCard('Android', "lib/Images/androidLogo.png", 'Developed by google, microsoft and more, the Android operating system is currently on a variety of devices including Samsung, LG, and many more!',const Color(0xffab5a4b), 'Start With Android',context, "Google"),
               customCard('Iphone', "lib/Images/appleLogo.png", 'Popular due to its simple, yet elegant style, iOS can be found on any Apple device such as iPhone, IPad, iMac and more!',const Color(0xffab5a4b), 'Start With Apple',context, 'Apple'),
               customCard('Web', "lib/Images/internetLog.png", 'World Wide Web! Can be accessed from just about any device as long as there is internet around.',const Color(0xffab5a4b), 'Start With Website',context,'WWW')
             ],
           ),
         ),

          optionButtons('Build Custom Order', Colors.grey)

        ],
      )
    );
  }

  Widget thirdContainer(){
    return Container(
      color: Colors.grey[100],
      height: 700,//MediaQuery.of(context).size.height*.5,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [

          Flexible(
            child: Text('You Decide How You Would Like to Meet!',style: GoogleFonts.poppins(
                textStyle: const TextStyle(
                  color: Color(0xffab5a4b),fontSize: 28,
                )
            ),),
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
                      child: Image.asset('lib/Images/meeting-room-1806702_1280.jpg',
                      fit: BoxFit.cover,),
                    ),
                  ),
                ),

                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: ClipRRect(
                     // borderRadius: BorderRadius.circular(20),
                      child: Image.asset('lib/Images/Zoom_(1).png',
                        fit: BoxFit.cover,),
                    ),
                  ),
                )
              ],
            ),
          ),

          Flexible(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Choose to meet select members from our team and get the full design and connection experience, or sit from the comfort of your home and discuss your ideas. Regardless of the route chosen, you will still get the connection and attention you deserve. There will be several meeting addresses to chose from. Don\'t use zoom? Our team will adapt to several other video call platforms. The choice is yours!' ,textAlign: TextAlign.center, style: GoogleFonts.poppins(
                  textStyle: const TextStyle(
                    color: Color(0xffab5a4b),fontSize: 18,
                  )
              ),),
            ),
          )
        ],
      ),

    );
  }


  roundButton(String buttonText) {
    return Padding(
      padding: EdgeInsets.all(8),
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

customCard(String cardTitle, String picPath, String content, Color buttonColor, String buttonText, BuildContext context, String subTitle){
  return  SizedBox(
    width: 300,//MediaQuery.of(context).size.width/3-24,
    height: 425,//MediaQuery.of(context).size.height/2.5,
    child: GFCard(
      color: Colors.white,
elevation: 10 ,
      boxFit: BoxFit.cover,
      titlePosition: GFPosition.start,
    //  showOverlayImage: true,
    image: Image.asset(picPath,
    height: MediaQuery.of(context).size.height*0.1,
    width:  MediaQuery.of(context).size.width*0.2,),
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

          GFButton(onPressed: ()=>{},
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
