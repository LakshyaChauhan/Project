import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project1/hompeage.dart';
import 'package:project1/widgets/Splash_Screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
int ?onboarding_status;
Future <void> Onboarding_details() async{
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences preferences= await SharedPreferences.getInstance();
  onboarding_status =await preferences.getInt('onboarding_status');
  await preferences.setInt('onboarding_status', 1);

}



class Onboarding_Screen extends StatefulWidget {
  const Onboarding_Screen({Key? key}) : super(key: key);

  @override
  State<Onboarding_Screen> createState() => _Onboarding_ScreenState();
}

class _Onboarding_ScreenState extends State<Onboarding_Screen> {
  final formKey =GlobalKey<FormState>();
  var email_controller= TextEditingController();
  var phone_no_controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Onboarding'),
      ),
      body: Container(
        child: Form(
          autovalidateMode: AutovalidateMode.disabled,
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height:20 ,),
              TextFormField(
                controller: email_controller,
                validator: (value)=> EmailValidator.validate(value!) ?null :"Enter correct email address",
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                    errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(
                            color: CupertinoColors.destructiveRed,
                            width: 2.5)
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(35),
                        borderSide: BorderSide(
                            color: CupertinoColors.destructiveRed,
                            width: 2.5
                        )
                    ),
                    errorStyle: TextStyle(fontSize: 15,fontWeight: FontWeight.w500,fontStyle: FontStyle.italic,color: Colors.red.shade600),
                    prefixIcon: Icon(Icons.email_outlined,size: 30,color: CupertinoColors.systemGrey,),
                    suffixIcon: email_controller.text.isEmpty
                        ?Container(width: 0,)
                        :IconButton(
                      icon: Icon(Icons.cancel_outlined,size: 23,color: CupertinoColors.systemGrey,),
                      onPressed: (){
                        email_controller.clear();
                      },
                    ),
                    label: Text('Enter your Email'),
                    labelStyle: TextStyle(fontSize: 16,fontWeight:FontWeight.w600,fontStyle: FontStyle.italic,color: CupertinoColors.systemGrey),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(
                            color: CupertinoColors.systemGrey,
                            width: 2.5
                        )
                    ),

                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(35),
                      borderSide: BorderSide(
                          color: Colors.blue.shade500,
                          width: 2.5


                      ),

                    )
                ),

              ),
              SizedBox(height: 15,),
              TextFormField(
                controller: phone_no_controller,
                validator: (value){
                  if (value!.isEmpty || !RegExp(r'^[0-9]').hasMatch(value!)){
                    return "Enter correct mobile number ";
                  }else{
                    return null;
                  }
                },
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(
                            color: CupertinoColors.destructiveRed,
                            width: 2.5)
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(35),
                        borderSide: BorderSide(
                            color: CupertinoColors.destructiveRed,
                            width: 2.5
                        )
                    ),
                    errorStyle: TextStyle(fontSize: 15,fontWeight: FontWeight.w500,fontStyle: FontStyle.italic,color: Colors.red.shade600),
                    prefixIcon: Icon(Icons.phone,size: 30,color: CupertinoColors.systemGrey,),
                    suffixIcon: phone_no_controller.text.isEmpty
                        ?Container(width: 0,)
                        :IconButton(
                        onPressed: (){
                          phone_no_controller.clear();
                        },
                        icon: Icon(Icons.cancel_outlined,size: 23,color: CupertinoColors.systemGrey,)
                    ),
                    label: Text('Enter your mobile no'),
                    labelStyle: TextStyle(fontSize: 16,fontWeight: FontWeight.w600,fontStyle: FontStyle.italic,color: CupertinoColors.systemGrey),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(
                            color: CupertinoColors.systemGrey,
                            width: 2.5
                        )
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(35),
                        borderSide: BorderSide(
                            color: Colors.blue.shade500,
                            width: 2.5
                        )
                    )
                ),
              ),
              SizedBox(height: 15,),
              ElevatedButton(
                  onPressed:(){
                    if(formKey.currentState!.validate()){
                      Onboarding_details();
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> HomePage()));
                    }
                  } ,
                child: Text('Submit',style: TextStyle(fontSize: 19,fontWeight: FontWeight.w700),),

                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueAccent.shade200,
                    elevation: 10,
                    shadowColor: Colors.green ,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)
                    )
                ),)

            ],
          ),
        )
      ),
    );
  }
}
