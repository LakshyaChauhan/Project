// ignore_for_file: must_be_immutable, non_constant_identifier_names

import 'dart:typed_data';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project1/Functions/fetch_image_fromServer.dart';
import 'package:project1/screens/hompeage_screen.dart';
import 'package:project1/screens/registration_onboarding_screen.dart';
import 'package:project1/screens/zoom_image_screen.dart';

import '../Functions/server_data_delete.dart';
import '../Functions/userdata.dart';

class ImageScreen extends StatefulWidget {
  ImageScreen({super.key, required this.image, required this.slider_divisions});
  final Uint8List image;
  Uint8List? image2;
  final int slider_divisions;

  @override
  State<ImageScreen> createState() => _ImageScreenState();
}

class _ImageScreenState extends State<ImageScreen> {
  TextEditingController imagetitle = TextEditingController();
  double currentValue = 0.0;
  bool count_changed = false;

  void change() async {
    widget.image2 =
        (await Fetch_Drawed_Image(folder_Id!, (currentValue.toInt())))!;
    setState(() {
      count_changed = true;
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
              SizedBox(height: screenHeight / 10),
              SizedBox(
                height: screenHeight / 3,
                width: screenwidth - 20,
                child: GestureDetector(
                    onTap: () {
                      count_changed
                          ? Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ZoomImage(
                                        image: widget.image2!,
                                      )))
                          : Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ZoomImage(
                                        image: widget.image,
                                      )));
                    },
                    child: count_changed
                        ? Image(
                            image: MemoryImage(widget.image2!),
                            fit: BoxFit.contain,
                          )
                        : Image(
                            image: MemoryImage(widget.image),
                            fit: BoxFit.contain,
                          )),
              ),
              SizedBox(
                height: screenHeight / 10,
              ),
              SizedBox(
                  width: screenwidth - 20,
                  height: 50,
                  child: Slider(
                    divisions: widget.slider_divisions,
                    label: currentValue.round().toString(),
                    value: currentValue,
                    min: 0,
                    max: widget.slider_divisions.toDouble(),
                    onChanged: (double newValue) {
                      setState(() {
                        currentValue = newValue;
                      });
                      change();
                      // widget.image2 = (await ImageText(currentValue as String))!;
                    },
                  )),
              SizedBox(
                height: screenHeight / 10,
              ),
              SizedBox(
                height: screenHeight / 19,
              ),
              SizedBox(
                height: screenHeight / 16,
                width: double.infinity,
                child: Padding(
                    padding: const EdgeInsets.only(left: 23, right: 23),
                    child: count_changed
                        ? ElevatedButton.icon(
                            onPressed: () {
                              showDialog(
                                  context: context,
                                  builder: (context) => SimpleDialog(
                                        contentPadding:
                                            const EdgeInsets.all(20),
                                        children: [
                                          SizedBox(
                                            height: 55,
                                            child: TextField(
                                              controller: imagetitle,
                                              keyboardType: TextInputType.text,
                                              decoration: InputDecoration(
                                                  label: const Text(
                                                      'Enter the title for image'),
                                                  labelStyle: const TextStyle(
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontStyle:
                                                          FontStyle.italic,
                                                      color: CupertinoColors
                                                          .systemGrey),
                                                  disabledBorder:
                                                      const OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color: CupertinoColors
                                                            .systemGrey,
                                                        width: 2.5),
                                                  ),
                                                  border:
                                                      const OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color: CupertinoColors
                                                            .systemGrey,
                                                        width: 5),
                                                  ),
                                                  enabledBorder:
                                                      const OutlineInputBorder(
                                                          borderSide: BorderSide(
                                                              color: CupertinoColors
                                                                  .systemGrey)),
                                                  focusedBorder: OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              21),
                                                      borderSide: const BorderSide(
                                                          color: CupertinoColors
                                                              .activeBlue,
                                                          width: 2.5))),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                35, 33, 35, 0),
                                            child: ElevatedButton.icon(
                                              onPressed: () {
                                                uploadImage(
                                                    folder_Id!,
                                                    widget.image2!,
                                                    imagetitle.text);
                                                imagetitle.clear();

                                                Navigator.of(context).pop();
                                              },
                                              icon: const Icon(
                                                Icons.save_outlined,
                                                color: Colors.white,
                                                size: 30,
                                              ),
                                              style: ElevatedButton.styleFrom(
                                                  padding: const EdgeInsets
                                                      .symmetric(vertical: 5),
                                                  backgroundColor:
                                                      const Color.fromARGB(
                                                          255, 0, 96, 160)),
                                              label: Text(
                                                'Save ',
                                                style: GoogleFonts.breeSerif(
                                                    color: const Color.fromARGB(
                                                        255, 255, 255, 255),
                                                    fontSize: 20),
                                              ),
                                            ),
                                          )
                                        ],
                                      ));

                              // uploadImage(folder_Id!, widget.image, imagetitle.text);
                            },
                            icon: const Icon(
                              Icons.save_outlined,
                              color: Colors.white,
                              size: 31,
                            ),
                            style: ElevatedButton.styleFrom(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 7),
                                backgroundColor:
                                    const Color.fromARGB(255, 0, 96, 160)),
                            label: Text(
                              'Save Image',
                              style: GoogleFonts.breeSerif(
                                  color:
                                      const Color.fromARGB(255, 255, 255, 255),
                                  fontSize: 20),
                            ),
                          )
                        : const SizedBox()),
              ),
              SizedBox(
                height: screenHeight / 18,
              ),
              SizedBox(
                width: double.infinity,
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 23),
                  child: ElevatedButton.icon(
                    onPressed: () {
                      DeleteServerData(folder_Id!);
                      count_changed = false;
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const HomePage()),
                      );
                      // uploadImage(folder_Id!, widget.image, imagetitle.text);
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
