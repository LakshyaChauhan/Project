import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project1/Functions/userdata.dart';
import 'package:project1/screens/history_image_screen.dart';
import 'package:project1/screens/hompeage.dart';
import 'package:project1/screens/registration_onboarding_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';




class History_page extends StatefulWidget {
   History_page({Key? key, }) : super(key: key);
   //List<dynamic> ImageTitles =[];




   @override
  State<History_page> createState() => _History_pageState();
}

class _History_pageState extends State<History_page> {

  @override
  void initState() {
    // TODO: implement initState




    fetch_title(folder_Id);

    Timer(const Duration(seconds: 2), () {

      setState(() {


      });


    });
    super.initState();
  }


  @override



  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: titles_list.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(" "+titles_list[index],),
            textColor: Colors.white,
            titleTextStyle: TextStyle(fontSize: 20),

            leading: Icon(Icons.photo_size_select_actual),
            shape: OutlineInputBorder(
              borderSide: BorderSide(
                width: 1,
                color: CupertinoColors.systemGrey
              ),
            ),
            onTap: (){
              setState(() {
                int selectedIndex=index;

              });
              Navigator.push(context, MaterialPageRoute(builder: (context)=> Fetched_Image(imageTitle: titles_list[index],)));
            },
          );
        },
      ),
    );
  }
}
