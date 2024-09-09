import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stream/controllers.dart/user_controller.dart';
import 'package:stream/global_data.dart';
import 'package:stream/network.dart/user_network.dart';
import 'package:stream/screens/ChatScreen.dart';
import 'package:stream/screens/UsersScreen.dart';

class LoginForm extends StatelessWidget{

  

  final TextEditingController usernameController=TextEditingController();

  final TextEditingController psdController=TextEditingController();

  final UserNetwork userNetwork=UserNetwork();
  final _formKey = GlobalKey<FormState>();

  LoginForm({super.key});
  @override
  Widget build(BuildContext context) {
    
    return 
    
    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            TextFormField(
                            
                              validator: (value) {
                                if(value==''||value==null||value.isEmpty) {return 'This field is required';}
                                return null;
                              },
                              controller: usernameController,
                              decoration: InputDecoration(
                                // labelStyle: TextStyle(
                                //   color: Colors.red
                                // ),
                                hintText: "Username",
                                hintStyle: TextStyle(color: Colors.black.withOpacity(0.3)),
                                labelText: "Username",
                                  fillColor: Colors.white,
                                  border: const OutlineInputBorder(borderSide: BorderSide(color: Colors.black))
                              ),
                            ),
                            const SizedBox(height: 10,),
                            TextFormField(
                              obscureText: true,
                              
                               validator: (value) {
                                if(value==''||value==null||value.isEmpty) {return 'This field is required';}
                                return null;
                              },
                              controller: psdController,
                           decoration: InputDecoration(
                             hintText: "Password",
                                hintStyle: TextStyle(color: Colors.black.withOpacity(0.3)),
                                labelText: "Password",
                              fillColor: Colors.white,
                              border: const OutlineInputBorder(borderSide: BorderSide(color: Colors.black))
                          ),
                        ),
                        const SizedBox(height: 20,),
                         ElevatedButton(onPressed: () async {
                          if(_formKey.currentState!.validate()){
                              GlobalData.user=await userNetwork.login(username: usernameController.text,psd: psdController.text);
                              print(GlobalData.user.username);
                              Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>UsersScreen()), (Route<dynamic> route) => false);
                          }
                            
                        
                          }, child: const Text("Login"))
                          ],
                        ),
                      ),
                    );


    
    
    
     
    // TODO: implement build
    throw UnimplementedError();
  }
}