import 'dart:async';
import 'package:flutter/material.dart';
import 'package:project1/Functions/userdata.dart';
import 'package:project1/screens/history_Screen.dart';
import 'package:project1/screens/registration_onboarding_screen.dart';
import 'package:project1/widgets/browse.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:project1/widgets/capture.dart';
import 'package:project1/screens/upload_image_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> getFolderId() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences preferences = await SharedPreferences.getInstance();
  folder_Id = preferences.getString('folder_id');
  print(folder_Id);
}



class HomePage extends StatefulWidget {
  const HomePage({super.key});


  @override

  State<HomePage> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {

  @override
  void initState() {

    // TODO: implement initState
    if(check==1){
      print('hello');
      Timer(Duration(seconds: 4), () {

    if(check==1){
      print('hello');
      Timer(const Duration(seconds: 4), () {

        getFolderId();
        setState(() {
          check=2;

        });
      });
    }else{
      print(folder_id);

      getFolderId();
      setState(() {

      });

    }



    super.initState();
  }

 @override




  File? selectedImage;

  void capture(ImageSource source) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: source);
    if (pickedFile == null) return;

    final tempImage = File(pickedFile.path);
    setState(() {
      selectedImage = tempImage;
      print('image got selected');

      Navigator.pushReplacement(

      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => UploadImage(image: selectedImage)));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text('Project'),

          actions: [
            PopupMenuButton<String>(
              elevation: 10,
              iconSize: 30,
              itemBuilder: (BuildContext context) {
                return [
                  PopupMenuItem<String>(
                    value: 'option1',
                    child: TextButton.icon(
                      label: Text("History",style: TextStyle(fontSize: 16,color: Colors.white),),
                      icon: Icon(Icons.history_outlined,color: Colors.white,),
                      onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> History_page()));

                      },
                    ),
                  ),
                  PopupMenuItem<String>(
                    value: 'option2',
                    child: Text('Option 2'),
                  ),
                  PopupMenuItem<String>(
                    value: 'option3',
                    child: Text('Option 3'),
                  ),
                ];
              },
              onSelected: (String value) {
                // Handle dropdown menu item selection
                print('Selected option: $value');
              },
            ),
          ],
        // leading: IconButton(
        //     onPressed: (){
        //
        //       Navigator.push(context, MaterialPageRoute(builder: (context)=> History_page()));
        //     },
        //     icon: Icon(Icons.history_sharp))

        leading: IconButton(
            onPressed: (){

              Navigator.push(context, MaterialPageRoute(builder: (context)=>const  History_page()));
            },
            icon: const Icon(Icons.history_sharp))

      ),
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Capture(camera: capture),
              const SizedBox(
                height: 50,
              ),
              Browse(gallery: capture)
            ],
          ),
        ),
      ),
    );
  }
}

