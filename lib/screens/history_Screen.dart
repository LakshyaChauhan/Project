import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project1/Functions/userdata.dart';
import 'package:project1/screens/history_image_screen.dart';
import 'package:project1/screens/hompeage.dart';
import 'package:project1/screens/registration_onboarding_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
  /*_handleTileClick(int index) {
  print('Clicked on tile $index');
   int selected_index= index;
   print(titles_list[selected_index]);
   return selected_index;
  // Perform any additional operations with the index
}*/



class History_page extends StatefulWidget {
   History_page({Key? key, }) : super(key: key);
   //List<dynamic> ImageTitles =[];




   @override
  State<History_page> createState() => _History_pageState();
}

class _History_pageState extends State<History_page> {

  @override
  bool is_loading= false;
  void initState() {
    // TODO: implement initState




    fetch_title(folder_Id);

    Timer(const Duration(seconds: 4), () {

      setState(() {
        is_loading=true;


      });


    });
    super.initState();
  }


  @override



  Widget build(BuildContext context) {
    final screenwidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('History'),
        centerTitle:true,
        
      ),
      body: Center(
        child: Container(
          width: screenwidth-24,
          alignment: Alignment.center,
          child: is_loading?ListView.builder(
            itemCount: titles_list.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  SizedBox(
                    height: 12,
                  ),
                  ListTile(
                    title: Text(" "+titles_list[index],),
                    textColor: Colors.white,
                    titleTextStyle: TextStyle(fontSize: 20),

                    leading: Icon(Icons.photo_size_select_actual,color: Colors.white,),
                    shape: OutlineInputBorder(
                      borderSide: BorderSide(
                          width: 1.5,
                          color: CupertinoColors.systemGrey
                      ),
                    ),
                    onTap: (){

                      Navigator.push(context, MaterialPageRoute(builder: (context)=> Fetched_Image(imageTitle: titles_list[index],)));



                    },
                  ),
                ],
              );
            },
          )
              :CircularProgressIndicator(
            color: Colors.white,
          ),
        )
      )
    );
  }
}
