import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project1/screens/hompeage.dart';
import 'package:shared_preferences/shared_preferences.dart';

int? onboardingStatus;
Future<void> onboardingDetails() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences preferences = await SharedPreferences.getInstance();
  onboardingStatus = preferences.getInt('onboarding_status');
  await preferences.setInt('onboarding_status', 1);
}

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var phoneNoController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Onboarding'),
      ),
      body: Form(
        autovalidateMode: AutovalidateMode.disabled,
        key: formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: emailController,
              validator: (value) => EmailValidator.validate(value!)
                  ? null
                  : "Enter correct email address",
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                  errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: const BorderSide(
                          color: CupertinoColors.destructiveRed, width: 2.5)),
                  focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(35),
                      borderSide: const BorderSide(
                          color: CupertinoColors.destructiveRed, width: 2.5)),
                  errorStyle: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      fontStyle: FontStyle.italic,
                      color: Colors.red.shade600),
                  prefixIcon: const Icon(
                    Icons.email_outlined,
                    size: 30,
                    color: CupertinoColors.systemGrey,
                  ),
                  suffixIcon: emailController.text.isEmpty
                      ? Container(
                          width: 0,
                        )
                      : IconButton(
                          icon: const Icon(
                            Icons.cancel_outlined,
                            size: 23,
                            color: CupertinoColors.systemGrey,
                          ),
                          onPressed: () {
                            emailController.clear();
                          },
                        ),
                  label: const Text('Enter your Email'),
                  labelStyle: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      fontStyle: FontStyle.italic,
                      color: CupertinoColors.systemGrey),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: const BorderSide(
                          color: CupertinoColors.systemGrey, width: 2.5)),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(35),
                    borderSide:
                        BorderSide(color: Colors.blue.shade500, width: 2.5),
                  )),
            ),
            const SizedBox(
              height: 15,
            ),
            TextFormField(
              controller: phoneNoController,
              validator: (value) {
                if (value!.isEmpty || !RegExp(r'^[0-9]').hasMatch(value)) {
                  return "Enter correct mobile number ";
                } else {
                  return null;
                }
              },
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: const BorderSide(
                          color: CupertinoColors.destructiveRed, width: 2.5)),
                  focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(35),
                      borderSide: const BorderSide(
                          color: CupertinoColors.destructiveRed, width: 2.5)),
                  errorStyle: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      fontStyle: FontStyle.italic,
                      color: Colors.red.shade600),
                  prefixIcon: const Icon(
                    Icons.phone,
                    size: 30,
                    color: CupertinoColors.systemGrey,
                  ),
                  suffixIcon: phoneNoController.text.isEmpty
                      ? Container(
                          width: 0,
                        )
                      : IconButton(
                          onPressed: () {
                            phoneNoController.clear();
                          },
                          icon: const Icon(
                            Icons.cancel_outlined,
                            size: 23,
                            color: CupertinoColors.systemGrey,
                          )),
                  label: const Text('Enter your mobile no'),
                  labelStyle: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      fontStyle: FontStyle.italic,
                      color: CupertinoColors.systemGrey),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: const BorderSide(
                          color: CupertinoColors.systemGrey, width: 2.5)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(35),
                      borderSide:
                          BorderSide(color: Colors.blue.shade500, width: 2.5))),
            ),
            const SizedBox(
              height: 15,
            ),
            ElevatedButton(
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  onboardingDetails();
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const HomePage()));
                }
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent.shade200,
                  elevation: 10,
                  shadowColor: Colors.green,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15))),
              child: const Text(
                'Submit',
                style: TextStyle(fontSize: 19, fontWeight: FontWeight.w700),
              ),
            )
          ],
        ),
      ),
    );
  }
}
