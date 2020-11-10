import 'package:magang1_new/shared/loading.dart';
import 'package:magang1_new/screens/authenticate/authenticate.dart';
import 'package:magang1_new/services/database.dart';
import 'package:magang1_new/shared/decorations.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:magang1_new/screens/Main menu/Order/Order.dart';
import 'package:magang1_new/screens/Main menu/portofolio/portofolio.dart';
import 'package:magang1_new/screens/Main menu/settings/edit_profile.dart';
import 'package:magang1_new/screens/Main menu/home/home.dart';

class MainMenuTabNav extends StatefulWidget {
  @override
  _MainMenuTabNavState createState() => _MainMenuTabNavState();
}

class _MainMenuTabNavState extends State<MainMenuTabNav> {
  final PageStorageBucket bucket = PageStorageBucket();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor: AppColors().primary,
        body: PageStorage(
          bucket: bucket,
          child: TabBarView(
            children: <Widget>[
              Home(
                  //key: PageStorageKey('Beranda'),
                  ),
              Order(
                  //key: PageStorageKey('Akun'),
                  ),
              SettingsUI(
                  //key: PageStorageKey('Pengaturan'),
                  ),
              Portofolio(
                  //key: PageStorageKey('Portofolio'),
                  ),
            ],
          ),
        ),
        bottomNavigationBar: Container(
          color: AppColors().accent1,
          child: TabBar(
            tabs: <Widget>[
              Tab(icon: Icon(Icons.home)),
              Tab(icon: Icon(Icons.person)),
              Tab(icon: Icon(Icons.settings)),
              Tab(icon: Icon(Icons.clean_hands)),
            ],
            labelColor: AppColors().primary,
            indicator: UnderlineTabIndicator(
              borderSide: BorderSide(color: AppColors().primary, width: 4.0),
              insets: EdgeInsets.only(bottom: 44),
            ),
            unselectedLabelColor: AppColors().accent3,
          ),
        ),
      ),
    );
  }
}
