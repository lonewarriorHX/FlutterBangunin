import 'package:magang1_new/shared/loading.dart';
import 'package:magang1_new/screens/authenticate/authenticate.dart';
import 'package:magang1_new/services/database.dart';
import 'package:magang1_new/shared/decorations.dart';
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
      child: Container(
        decoration: BoxDecoration(
          color: AppColors().primary,
        ),
        child: Scaffold(
          body: Stack(
            alignment: Alignment.center,
            fit: StackFit.expand,
            clipBehavior: Clip.none,
            children: <Widget>[
              coverPicture(),
              coverPictureGradient(),
              navigation(),
            ],
          ),
        ),
      ),
    );
  }

  Scaffold navigation() {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: PageStorage(
        bucket: bucket,
        child: TabBarView(
          children: <Widget>[
            Home(/*key: PageStorageKey('Beranda'),*/),
            Order(/*key: PageStorageKey('Beli'),*/),
            SettingsUI(/*key: PageStorageKey('Akun')*/),
            Portofolio(/*key: PageStorageKey('Pengaturan'),*/),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        color: AppColors().accent1,
        child: TabBar(
          tabs: <Widget>[
            Tab(icon: Icon(Icons.home)),
            Tab(icon: Icon(Icons.shopping_cart)),
            Tab(icon: Icon(Icons.person)),
            Tab(icon: Icon(Icons.settings)),
          ],
          labelColor: AppColors().primary,
          indicator: UnderlineTabIndicator(
            borderSide: BorderSide(color: AppColors().primary, width: 4.0),
            insets: EdgeInsets.only(bottom: 44),
          ),
          unselectedLabelColor: AppColors().accent3,
        ),
      ),
    );
  }

  Image coverPicture() {
    return Image.asset(
      'assets/img/home_bg_default3.jpg',
      fit: BoxFit.cover,
    );
  }

  Container coverPictureGradient() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: FractionalOffset.topCenter,
          end: FractionalOffset.bottomCenter,
          colors: [
            AppColors().primary,
            AppColors().accent1.withOpacity(0.0),
          ],
          stops: [0.0, 0.7],
        ),
      ),
    );
  }
}
