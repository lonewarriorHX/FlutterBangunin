import 'package:flutter/material.dart';
import 'package:magang1_new/services/auth.dart';

class Home extends StatelessWidget {
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange[50],
      appBar: AppBar(
        title: Text('Bangunin.id'),
        backgroundColor: Colors.orange[400],
        elevation: 0.0,
        actions: <Widget>[
          FlatButton.icon(
            icon: Icon(Icons.person),
            label: Text('logout'),
            onPressed: () async {
              await _auth.signOut();
            },
          )
        ],
      ),
      body: Column(
        children: <Widget>[
          SizedBox(
            height: 100,
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              color: Colors.grey.shade100,
              child: ListView(
                padding: EdgeInsets.only(top: 75),
                children: [
                  Text(
                    "Servis Pembangunan Rumah",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      buildActivityButton(
                          Icons.umbrella,
                          "Bangun",
                          Colors.orangeAccent.withOpacity(0.2),
                          Colors.deepOrange),
                      buildActivityButton(
                          Icons.pie_chart,
                          "Statistics",
                          Color(0XFFD7CCC8).withOpacity(0.4),
                          Color(0XFF9499B7)),
                      buildActivityButton(
                          Icons.transfer_within_a_station,
                          "Transfer",
                          Colors.cyanAccent.withOpacity(0.2),
                          Color(0XFF0097A7)),
                      buildActivityButton(Icons.card_membership, "My Card",
                          Colors.blue.withOpacity(0.2), Color(0XFF01579B)),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    "Categories",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  buildCategoryCard(Icons.fastfood, "Semen", 120, 20),
                  buildCategoryCard(Icons.flash_on, "Pasir", 430, 17),
                  buildCategoryCard(Icons.fastfood, "Batu", 120, 20),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  GestureDetector buildActivityButton(
      IconData icon, String title, Color backgroundColor, Color iconColor) {
    return GestureDetector(
      onTap: (null),
      child: Container(
        margin: EdgeInsets.all(10),
        height: 65,
        width: 65,
        decoration: BoxDecoration(
            color: backgroundColor, borderRadius: BorderRadius.circular(10.0)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: iconColor,
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              title,
              style: TextStyle(
                color: Colors.black54,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
      ),
    );
  }

  Container buildCategoryCard(
      IconData icon, String title, int amount, int percentage) {
    return Container(
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      height: 85,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(
                    icon,
                    color: Color(0xFF00B686),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    "\$$amount",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "($percentage%)",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey),
                  )
                ],
              )
            ],
          ),
          SizedBox(
            height: 15,
          ),
          Stack(
            children: [
              Container(
                height: 5,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(2),
                    color: Colors.grey.shade300),
              ),
              Container(
                height: 5,
                width: 80,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(2),
                    color: Color(0XFF00B686)),
              ),
            ],
          )
        ],
      ),
    );
  }
}
