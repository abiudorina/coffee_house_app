import 'package:coffee_house_app/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:google_fonts/google_fonts.dart';

class DashboardPage extends StatefulWidget {
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              height: screenHeight,
              width: screenWidth,
              color: Colors.transparent,
            ),
            Container(
              height: screenHeight,
              width: screenWidth / 5,
              color: AppColors.leftBarColor,
            ),
            Positioned(
              left: screenWidth / 5,
              child: Container(
                width: screenWidth - (screenWidth / 5),
              ),
            ),
            Positioned(left: 35, top: 20, child: Icon(Feather.menu)),
            Positioned(right: 35, top: 20, child: Icon(Feather.shopping_bag)),
            Positioned(
              top: screenHeight - (screenHeight - 100),
              left: (screenWidth / 5) + 25,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'CoffeeHouse',
                    style: GoogleFonts.bigShouldersText(
                        color: Color(0xff23163D), fontSize: 40),
                  ),
                  Text(
                    'A lot can happen over coffee',
                    style: GoogleFonts.bigShouldersText(
                        color: Color(0xffA59FB0), fontSize: 15),
                  ),
                  SizedBox(height: 20),
                  Container(
                    height: 40,
                    width: 225,
                    child: TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: BorderSide(
                            color: Colors.grey[400],
                          ),
                        ),
                        contentPadding: EdgeInsets.only(top: 10, left: 10),
                        hintText: 'Search...',
                        hintStyle: GoogleFonts.bigShouldersText(
                            color: Color(0xffA59FB0), fontSize: 15),
                        suffixIcon: Icon(
                          Feather.search,
                          color: Colors.grey[400],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
