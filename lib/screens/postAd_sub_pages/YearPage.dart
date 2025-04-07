import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yaka_app/constants/app_colors.dart';
import 'package:yaka_app/screens/postAd_sub_pages/Mileage.dart';
import 'package:yaka_app/screens/postAd_sub_pages/edition_page.dart';

class YearOfManufacturePage extends StatefulWidget {
  @override
  _YearOfManufacturePageState createState() => _YearOfManufacturePageState();
}

class _YearOfManufacturePageState extends State<YearOfManufacturePage> {
  int selectedYear = DateTime.now().year;

  List<int> getYears() {
    int currentYear = DateTime.now().year;
    return List<int>.generate(50, (index) => currentYear - index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[400],
        title: RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: "Year of",
                style: TextStyle(
                    color: AppColors.primaryColor,
                    fontSize: 35,
                    fontWeight: FontWeight.bold),
              ),
              TextSpan(
                text: " Manufacture",
                style: TextStyle(
                    color: const Color.fromARGB(255, 0, 0, 0),
                    fontSize: 34,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => EditionPage()));
          },
          icon: Icon(Icons.arrow_back, color: Colors.black),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [AppColors.primaryColor, AppColors.nextColor],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          children: [
            SizedBox(height: 50),
            Center(
              child: Icon(
                Icons.calendar_month,
                size: 200,
                color: Colors.green,
              ),
            ),
            SizedBox(height: 60),
            Text(
              "When was your car manufactured?",
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                "Select the year your car was manufactured",
                style: TextStyle(fontSize: 16, color: Colors.white70),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 20),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.1),
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 10,
                    offset: Offset(0, 4),
                  )
                ],
              ),
              child: CupertinoPicker(
                backgroundColor: Colors.transparent,
                itemExtent: 50,
                scrollController: FixedExtentScrollController(
                  initialItem: getYears().indexOf(selectedYear),
                ),
                onSelectedItemChanged: (index) {
                  setState(() {
                    selectedYear = getYears()[index];
                  });
                },
                children: getYears()
                    .map((year) => Center(
                          child: Text(
                            year.toString(),
                            style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                color: year == selectedYear
                                    ? Colors.white
                                    : Colors.white70),
                          ),
                        ))
                    .toList(),
              ),
            ),
            SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MileagePage()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primaryColor,
                minimumSize: Size(200, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                shadowColor: Colors.black26,
                elevation: 5,
              ),
              child: Text("Next",
                  style: TextStyle(fontSize: 18, color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}
