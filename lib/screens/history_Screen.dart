// ignore_for_file: file_names, camel_case_types, non_constant_identifier_names
import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project1/Functions/userdata.dart';
import 'package:project1/screens/history_image_screen.dart';
import 'package:project1/screens/registration_onboarding_screen.dart';

/*_handleTileClick(int index) {
  print('Clicked on tile $index');
   int selected_index= index;
   print(titles_list[selected_index]);
   return selected_index;
  // Perform any additional operations with the index
}*/

class History_page extends StatefulWidget {
  const History_page({
    Key? key,
  }) : super(key: key);
  //List<dynamic> ImageTitles =[];
  @override
  State<History_page> createState() => _History_pageState();
}

class _History_pageState extends State<History_page> {
  bool is_loading = false;
  @override
  void initState() {
    fetch_title(folder_Id);
    Timer(const Duration(seconds: 4), () {
      setState(() {
        is_loading = true;
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
          backgroundColor: const Color.fromARGB(255, 0, 96, 160),
          title: const Text('History'),
          centerTitle: true,
        ),
        body: Center(
            child: Container(
          width: screenwidth - 24,
          alignment: Alignment.center,
          child: is_loading
              ? ListView.builder(
                  itemCount: titles_list.length,
                  itemBuilder: (context, index) {
                    return Column(children: [
                      const SizedBox(
                        height: 12,
                      ),
                      ListTile(
                          title: Text(
                            " " + titles_list[index],
                          ),
                          textColor: Colors.white,
                          titleTextStyle: const TextStyle(fontSize: 20),
                          leading: const Icon(
                            Icons.photo_size_select_actual,
                            color: Colors.white,
                          ),
                          shape: const OutlineInputBorder(
                            borderSide: BorderSide(
                                width: 1.5, color: CupertinoColors.systemGrey),
                          ),
                          onTap: () async {
                            bool change = await Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Fetched_Image(
                                          imageTitle: titles_list[index],
                                        )));

                            if (change) {
                              setState(() {
                                fetch_title(folder_Id);
                              });
                            }
                          })
                    ]);
                  },
                )
              : const CircularProgressIndicator(
                  color: Colors.white,
                ),
        )));
  }
}
