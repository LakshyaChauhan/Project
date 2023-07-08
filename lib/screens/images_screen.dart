import 'dart:typed_data';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project1/Functions/image_text_write.dart';
import 'package:project1/screens/hompeage.dart';
import 'package:project1/screens/registration_onboarding_screen.dart';
import 'package:project1/screens/zoom_image.dart';

import '../Functions/userdata.dart';


class ImageScreen extends StatefulWidget {
  ImageScreen({super.key, required this.image});
  final Uint8List image ;

  Uint8List? image2 ;


  @override


 @override

  State<ImageScreen> createState() => _ImageScreenState();
}

class _ImageScreenState extends State<ImageScreen> {

  TextEditingController imagetitle = TextEditingController();
  double currentValue = 0.0;
  bool count_changed= false;

  void change()async{
    widget.image2 = (await ImageText((currentValue.toInt()).toString()))!;
    setState(() {
      count_changed=true;

    });

  }


  @override
  void dispose() {
    imagetitle.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenwidth = MediaQuery.of(context).size.width;


    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: SingleChildScrollView(

          child: Column(
              children: [
             SizedBox(height: screenHeight/10),
            SizedBox(
              height: screenHeight/3,
              width: screenwidth - 20,
              child:
                  GestureDetector(
                    onTap: (){
                      count_changed?Navigator.push(context, MaterialPageRoute(builder: (context) => ZoomImage(image: widget.image2!,)))
                                   :Navigator.push(context, MaterialPageRoute(builder: (context) => ZoomImage(image: widget.image!,)));
                    },
                      child:count_changed?Image(image: MemoryImage(widget.image2!), fit: BoxFit.contain,)
                          :Image(image: MemoryImage(widget.image), fit: BoxFit.contain,)

                  ),

              ),

             SizedBox(
              height: screenHeight/7,
            ),
            SizedBox(
              width: screenwidth - 40,
              height: 50,
              child: Slider(
                divisions: 20,
                label: currentValue.round().toString(),
                value: currentValue,
                min: 0,
                max: 20,
                onChanged: (double newValue){

                  setState(() {
                    currentValue = newValue;


                  });
                  change();
                  // widget.image2 = (await ImageText(currentValue as String))!;
                },
              )
//TextField(
              //   controller: imagetitle,
              //   keyboardType: TextInputType.text,
              //   decoration: InputDecoration(
              //       label: const Text('Enter the title for image'),
              //       labelStyle: const TextStyle(
              //           fontSize: 16,
              //           fontWeight: FontWeight.w600,
              //           fontStyle: FontStyle.italic,
              //           color: CupertinoColors.systemGrey),
              //       disabledBorder: const OutlineInputBorder(
              //         borderSide:  BorderSide(
              //             color: CupertinoColors.systemGrey, width: 2.5),
              //       ),
              //       border: const OutlineInputBorder(
              //         borderSide:  BorderSide(
              //             color: CupertinoColors.systemGrey, width: 5),
              //       ),
              //       enabledBorder:const  OutlineInputBorder(
              //           borderSide:  BorderSide(
              //               color: CupertinoColors.systemGrey)),
              //       focusedBorder: OutlineInputBorder(
              //           borderRadius: BorderRadius.circular(21),
              //           borderSide: const BorderSide(
              //               color: CupertinoColors.activeBlue, width: 2.5))),
              // ),
            ),
            SizedBox(
              height: screenHeight/6,
            ),


            SizedBox(
              width: double.infinity,
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 25),
                child: ElevatedButton.icon(
                  onPressed: () {
                    count_changed=false;
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const HomePage()),
                    );
                    uploadImage(folder_Id!, widget.image, imagetitle.text);

                  },
                  icon: const Icon(
                    Icons.home,
                    color: Colors.white,
                    size: 32,
                  ),
                  style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 7),
                      backgroundColor: const Color.fromARGB(255, 0, 96, 160)),
                  label: Text(
                    'Home Page',
                    style: GoogleFonts.breeSerif(
                        color: const Color.fromARGB(255, 255, 255, 255),
                        fontSize: 20),
                  ),
                ),
              ),
            ),
          ],
          ),
        ),
      ),
    );
  }
}