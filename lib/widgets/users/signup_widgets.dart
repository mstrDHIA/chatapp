import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stream/controllers.dart/user_controller.dart';
import 'package:stream/global_data.dart';
import 'package:stream/models/user.dart';
import 'package:stream/network.dart/user_network.dart';
import 'package:stream/screens/ChatScreen.dart';
import 'package:stream/screens/UsersScreen.dart';

class SignupForm extends StatelessWidget{

  

  final TextEditingController usernameController=TextEditingController();

  final TextEditingController psdController=TextEditingController();
  final TextEditingController psdConfirmController=TextEditingController();

  final UserNetwork userNetwork=UserNetwork();
  final _formKey = GlobalKey<FormState>();

  SignupForm({super.key});
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
                                final  validCharacters = RegExp(r'^[a-zA-Z0-9]+$');
                                if(value==''||value==null||value.isEmpty) {return 'This field is required';}
                                // else if(value.contains(' ')) return 'Space character is not allowed';
                                else if(validCharacters.hasMatch(value)==false) return 'Special characters are not allowed use only letters and numbers';
                                else if(value.length<4) return 'Username length can\'t be less than 4 characters';
                                else if(value.length>15) return 'Username length can\'t be more than 15 characters';
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
                                else if(value.length<8) return 'Password length can\'t be less than 8 characters';
                                else if(value.contains(RegExp(r'[a-z]'))==false) return 'Password must contain a lower case letter';
                                else if(value.contains(RegExp(r'[A-Z]'))==false) return 'Password must contain an upper case letter';
                                else if(value.contains(RegExp(r'[0-9]'))==false) return 'Password must contain a number';
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
                        const SizedBox(height: 10,),
                            TextFormField(
                              obscureText: true,
                              
                               validator: (value) {
                                if(value==''||value==null||value.isEmpty) {return 'This field is required';}
                                if(value!=psdController.text) return 'Passwords don\'t match';
                                return null;
                              },
                              controller: psdConfirmController,
                           decoration: InputDecoration(
                             hintText: "Confirm Password",
                                hintStyle: TextStyle(color: Colors.black.withOpacity(0.3)),
                                labelText: "Confirm Password",
                              fillColor: Colors.white,
                              border: const OutlineInputBorder(borderSide: BorderSide(color: Colors.black))
                          ),
                        ),
                        const SizedBox(height: 20,),
                         ElevatedButton(onPressed: () async {
                          if(_formKey.currentState!.validate()){
                            if(await userNetwork.checkUniqueUsername(usernameController.text)){
                              userNetwork.signup(username: usernameController.text,psd: psdController.text);
                              GlobalData.user=User(username: usernameController.text,psd: psdController.text);
                              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>UsersScreen()));
                              print('unique');
                            }
                              // GlobalData.user=await userNetwork.Signup(username: usernameController.text,psd: psdController.text);
                              // print(GlobalData.user.username);
                              // Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>UsersScreen()), (Route<dynamic> route) => false);
                          }
                            
                        
                          }, child: const Text("Signup"))
                          ],
                        ),
                      ),
                    );


    
    
    
     
    // TODO: implement build
    throw UnimplementedError();
  }
}