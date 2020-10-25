import 'package:coffee_house_app/constants/app_colors.dart';
import 'package:coffee_house_app/pages/black_gold.dart';
import 'package:coffee_house_app/pages/cold_brew.dart';
import 'package:coffee_house_app/pages/gold_brew.dart';
import 'package:coffee_house_app/pages/mccafe.dart';
import 'package:coffee_house_app/pages/nescafe.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:google_fonts/google_fonts.dart';

class DashboardPage extends StatefulWidget {
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  int _selectedOption = 0;

  List<Widget> allOptions = [
    BlackGold(),
    ColdBrew(),
    Nescafe(),
    McCafe(),
    GoldBrew()
  ];

  List<bool> isSelected = [true, false, false, false, false];
  Color activeColor = Color(0xff23163D);
  Color inactiveColor = Color(0xffA59FB0);

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

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
                        color: activeColor, fontSize: 40),
                  ),
                  Text(
                    'A lot can happen over coffee',
                    style: GoogleFonts.bigShouldersText(
                        color: inactiveColor, fontSize: 15),
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
            _buildSideNavigator(),
            Positioned(
              top: (screenHeight / 3) + 5,
              left: (screenWidth / 5) + 25,
              child: Container(
                height: screenHeight - ((screenHeight / 3) + 50),
                width: screenWidth - ((screenWidth / 5) + 40),
                child: allOptions[_selectedOption],
              ),
            )
          ],
        ),
      ),
    );
  }

  Positioned _buildSideNavigator() {
    return Positioned(
      top: 75,
      child: RotatedBox(
        quarterTurns: 3,
        child: Container(
            height: MediaQuery.of(context).size.width / 5,
            width: MediaQuery.of(context).size.height - 100,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildOption('Black Gold', 0),
                _buildOption('Cold Brew', 1),
                _buildOption('Nescafe', 2),
                _buildOption('McCafe', 3),
                _buildOption('Gold Brew', 4),
              ],
            )),
      ),
    );
  }

  Column _buildOption(String title, int index) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        isSelected[index]
            ? Container(
                height: 8,
                width: 8,
                decoration: BoxDecoration(
                    color: Color(0xff23161D), shape: BoxShape.circle),
              )
            : Container(
                height: 8,
                width: 8,
                decoration: BoxDecoration(
                    color: Colors.transparent, shape: BoxShape.circle),
              ),
        SizedBox(height: 5),
        GestureDetector(
          onTap: () {
            setState(() {
              _selectedOption = index;
              isOptionSelected(index);
            });
          },
          child: Text(
            title,
            style: isSelected[index]
                ? GoogleFonts.bigShouldersText(color: activeColor, fontSize: 18)
                : GoogleFonts.bigShouldersText(
                    color: inactiveColor, fontSize: 18),
          ),
        ),
      ],
    );
  }

  void isOptionSelected(int index) {
    int previousIndex = isSelected.indexOf(true);
    isSelected[index] = true;
    isSelected[previousIndex] = false;
  }
}
