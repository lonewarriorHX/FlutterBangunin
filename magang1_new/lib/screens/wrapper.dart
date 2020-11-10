import 'package:flutter/material.dart';
import 'package:magang1_new/models/user.dart';
import 'package:magang1_new/screens/Main%20menu/mainmenu_tab_nav.dart';
import 'package:magang1_new/screens/authenticate/authenticate.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    //return either Home or Authenticate widget
    if (user == null) {
      return Authenticate();
    } else {
      return MainMenuTabNav();
    }
  }
}
