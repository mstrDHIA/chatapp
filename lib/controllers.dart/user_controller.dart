import 'package:flutter/material.dart';
import 'package:stream/models/user.dart';
import 'package:stream/network.dart/user_network.dart';
import 'package:stream/user_data_inherited_widget.dart';

class UserProvider extends ChangeNotifier{
  UserNetwork userNetwork=UserNetwork();
  User currentUser=User();
  login({username,psd,context}){
    User res=userNetwork.login(username: username,psd: psd);
    //  UserDataInheritedWidget.of(context)!.user=res;
     currentUser=res;
     notifyListeners();
    print(UserDataInheritedWidget.of(context)!.user.username);
  }
}