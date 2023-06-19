import 'dart:async';


import 'package:flutter/material.dart';
import 'package:project1/screens/hompeage.dart';
import 'package:project1/screens/registration_onboarding_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
 int ?status;
Future<void> Get_status() async{
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences preferences= await SharedPreferences.getInstance();
  status =await preferences.getInt('onboarding_status');
}







class Splashpage extends StatefulWidget {
  const Splashpage({Key? key, }) : super(key: key);

  @override
  _SplashpageState createState() => _SplashpageState();
}

class _SplashpageState extends State<Splashpage> {



  @override

    void initState() {
    Get_status();
      Timer(const Duration(seconds: 4), () {
        if (status == 0 || status == null) {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const OnboardingScreen()));
        }
        else {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => const HomePage()));
        }
      });
      super.initState();
    }
    @override
    Widget build(BuildContext context) {
      final screenWidth = MediaQuery
          .of(context)
          .size
          .width;
      return Container(
        width: screenWidth,
        alignment: Alignment.center,

        child: Padding(
          padding: const EdgeInsets.all(20),
          child: ClipRRect(
              borderRadius: BorderRadius.circular(150),
              child: Image.asset(
                'assets/dic_logo.png', width: screenWidth - 100,)),

        ),
      );
    }

}
//

//if(Is_onboarding_done==0 || Is_onboarding_done==null){
//         Navigator.push(context as BuildContext, MaterialPageRoute(builder: (context) => Onboarding_Screen()));
//       }
//       else{
//         Navigator.pushReplacement(context as BuildContext, MaterialPageRoute(builder: (context)=> HomePage()) );
//       }