import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:magang1_new/services/auth.dart';
import 'package:magang1_new/shared/category_card.dart';
import 'package:magang1_new/shared/search_bar.dart';
import 'package:magang1_new/screens/Main menu/portofolio/details_screen.dart';

class Portofolio extends StatefulWidget {
  //Portofolio({Key key}) : super(key: key);
  @override
  _PortofolioState createState() => _PortofolioState();
}

class _PortofolioState extends State<Portofolio> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context)
        .size; //this gonna give us total height and with of our device
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            // Here the height of the container is 45% of our total height
            height: size.height * .40,
            decoration: BoxDecoration(
              color: Color(0xFFF5CEB8),
              image: DecorationImage(
                alignment: Alignment.centerRight,
                image: AssetImage("assets/img/undraw_pilates_gpdb2.png"),
              ),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      alignment: Alignment.center,
                      height: 52,
                      width: 52,
                      decoration: BoxDecoration(
                        color: Color(0xFFF2BEA1),
                        shape: BoxShape.circle,
                      ),
                      child: SvgPicture.asset("assets/icons/menu.svg"),
                    ),
                  ),
                  Text(
                    "Bersama Bangunin.id,\nRumah Impian\nJadi Kenyataan!",
                    style: Theme.of(context).textTheme.headline6.copyWith(
                        color: Color(0xFF955554), fontWeight: FontWeight.w800),
                  ),
                  SearchBar(),
                  Expanded(
                    child: GridView.count(
                      crossAxisCount: 2,
                      childAspectRatio: .85,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20,
                      children: <Widget>[
                        CategoryCard(
                          title: "Diet Recommendation",
                          svgSrc: "assets/icons/Hamburger.svg",
                          press: () {},
                        ),
                        CategoryCard(
                          title: "Kegel Exercises",
                          svgSrc: "assets/icons/Excrecises.svg",
                          press: () {},
                        ),
                        CategoryCard(
                          title: "Meditation",
                          svgSrc: "assets/icons/Meditation.svg",
                          press: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) {
                                return DetailsScreen();
                              }),
                            );
                          },
                        ),
                        CategoryCard(
                          title: "Yoga",
                          svgSrc: "assets/icons/yoga.svg",
                          press: () {},
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      color: Colors.white,
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
                              buildActivityButton(
                                  Icons.card_membership,
                                  "My Card",
                                  Colors.blue.withOpacity(0.2),
                                  Color(0XFF01579B)),
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
