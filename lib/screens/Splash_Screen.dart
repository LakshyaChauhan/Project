import 'package:flutter/material.dart';
import 'dart:async';
import 'package:project1/screens/hompeage.dart';
import 'package:project1/screens/registration_onboarding_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

int? status;
Future<void> getStatus() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences preferences = await SharedPreferences.getInstance();
  status = preferences.getInt('onboarding_status');
}

class Splashpage extends StatefulWidget {
  const Splashpage({
    Key? key,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _SplashpageState();
  }
}

class _SplashpageState extends State<Splashpage> {
  @override
  void initState() {
    getStatus();

    Timer(const Duration(seconds: 4), () {
      print(status);
      if (status == 0 || status == null) {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const OnboardingScreen()),
          (route) => false,
          );
      } else {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => const HomePage()));
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Container(
      width: screenWidth,
      alignment: Alignment.center,
      child: const CircleAvatar(
        backgroundColor: Colors.white,
        radius: 150,
        child:  SizedBox( 
          width: 208,
          height: 208,
          child: Image(image: AssetImage('assets/dic_logo.png'),),
        ),
        ));
  }
}
//

//if(Is_onboarding_done==0 || Is_onboarding_done==null){
//         Navigator.push(context as BuildContext, MaterialPageRoute(builder: (context) => Onboarding_Screen()));
//       }
//       else{
//         Navigator.pushReplacement(context as BuildContext, MaterialPageRoute(builder: (context)=> HomePage()) );
//       }