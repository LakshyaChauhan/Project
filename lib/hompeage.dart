import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Project'),
      ),
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Center(
          child: Container(
            height: 70,
            width: screenWidth - 80,
            padding: const EdgeInsets.all(7),
            child: ElevatedButton.icon(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    content: Container(
                      width: 100,
                      height: 230,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 120,
                            child: TextButton(
                              style: ButtonStyle(
                                  shape: MaterialStatePropertyAll(
                                      RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(90),
                              ))),
                              child: const Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.camera_alt_outlined,
                                    size: 50,
                                    color: Colors.white,
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    'Camera',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ],
                              ),
                              onPressed: () {},
                            ),
                          ),
                          const SizedBox(
                            width: 30,
                          ),
                          SizedBox(
                            height: 120,
                            child: TextButton(
                              style: ButtonStyle(
                                  shape: MaterialStatePropertyAll(
                                      RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(90),
                              ))),
                              child: const Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.search,
                                    size: 50,
                                    color: Colors.white,
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    'Browse',
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                              onPressed: () {},
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
              icon: const Icon(
                Icons.image,
                color: Colors.white,
                size: 32,
              ),
              style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 0, 96, 160)),
              label: Text(
                'Select Image',
                style: GoogleFonts.breeSerif(
                    color: const Color.fromARGB(255, 255, 255, 255),
                    fontSize: 20),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
