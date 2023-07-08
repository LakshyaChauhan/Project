import 'dart:async';
import 'package:flutter/material.dart';
import 'package:project1/Functions/userdata.dart';
import 'package:project1/screens/history_Screen.dart';
import 'package:project1/screens/registration_onboarding_screen.dart';
import 'package:project1/widgets/browse.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:project1/widgets/capture.dart';
import 'package:project1/screens/upload_image.dart';
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
 

  File? selectedImage;

  void capture(ImageSource source) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: source);
    if (pickedFile == null) return;

    final tempImage = File(pickedFile.path);
    setState(() {
      selectedImage = tempImage;
      print('image got selected');
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
        leading: IconButton(
            onPressed: (){

              Navigator.push(context, MaterialPageRoute(builder: (context)=>const History_page()));
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

