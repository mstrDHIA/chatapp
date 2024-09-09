import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stream/controllers.dart/user_controller.dart';
import 'package:stream/screens/SignupScreen.dart';
import 'package:stream/widgets/users/login_widgets.dart';

class LoginScreen extends StatelessWidget{
  UserProvider? userProvider;
  double? width;
  double? height;  
  TextEditingController usernameController=TextEditingController();
  TextEditingController psdController=TextEditingController();

  LoginScreen({super.key});
  @override
  Widget build(BuildContext context) {
    width =MediaQuery.sizeOf(context).width;
    height =MediaQuery.sizeOf(context).height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor.withOpacity(0.2),
        title: const Text("Login Screen"),

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
                    
                    
                   LoginForm()
                    
                  ],
                ),
              ),
              TextButton(onPressed: () { 
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>SignupScreen()));
               },
                  child: const Text("SignUp"))
            ],
          ),
        ),
      ),
    );
    // TODO: implement build
    throw UnimplementedError();
  }

}