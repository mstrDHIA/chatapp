import 'package:flutter/material.dart';
import 'package:stream/controllers.dart/user_controller.dart';
import 'package:stream/network.dart/user_network.dart';
import 'package:stream/screens/login_screen.dart';
import 'package:stream/widgets/users/signup_widgets.dart';

class SignupScreen extends StatelessWidget{
  double? width;
  double? height;  
  final TextEditingController usernameController=TextEditingController();
  final TextEditingController psdController=TextEditingController();
  UserNetwork userNetwork=UserNetwork();

  SignupScreen({super.key});
  @override
  Widget build(BuildContext context) {
    width =MediaQuery.sizeOf(context).width;
    height =MediaQuery.sizeOf(context).height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor.withOpacity(0.2),
        title: const Text("Signup Screen"),

      ),
      body: Center(
        child: Container(
          child: Column(
            children: [
              SizedBox(
                height: height!*0.6,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    
                    
                   SignupForm()
                    
                  ],
                ),
              ),
              TextButton(onPressed: () async { 
                
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
               },
                  child: const Text("Login"))
            ],
          ),
        ),
      ),
    );
    // TODO: implement build
    throw UnimplementedError();
  }

}