import 'package:flutter/material.dart';
import 'package:stream/models/user.dart';

class UserDataInheritedWidget extends InheritedWidget {
   UserDataInheritedWidget({
    super.key,
    required super.child,
    required this.user,
  });

   User user;

  static UserDataInheritedWidget? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<UserDataInheritedWidget>();
  }

  @override
  bool updateShouldNotify(UserDataInheritedWidget oldWidget) {
    return oldWidget.user != user;
  }
}