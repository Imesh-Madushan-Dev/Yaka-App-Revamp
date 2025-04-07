import 'package:flutter/material.dart';
import 'package:yaka_app/constants/app_colors.dart';
import 'package:yaka_app/screens/postAd_sub_pages/YearPage.dart';

class MileagePage extends StatefulWidget {
  @override
  _MileagePageState createState() => _MileagePageState();
}

class _MileagePageState extends State<MileagePage> {
  TextEditingController mileageController = TextEditingController();
  String selectedUnit = 'km';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[400],
        title: RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: "Mil",
                style: TextStyle(
                    color: AppColors.primaryColor,
                    fontSize: 35,
                    fontWeight: FontWeight.bold),
              ),
              TextSpan(
                text: "eage",
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
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => YearOfManufacturePage()));
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
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 20),
              Center(
                child: Icon(Icons.speed, size: 200, color: Colors.green),
              ),
              SizedBox(height: 20),
              Text(
                "What is the mileage of your car?",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              SizedBox(height: 20),
              Stack(
                children: [
                  TextField(
                    controller: mileageController,
                    decoration: InputDecoration(
                      labelText: 'Mileage',
                      labelStyle: TextStyle(
                          color: AppColors.nextColor,
                          fontWeight: FontWeight.bold),
                      filled: true,
                      fillColor: AppColors.secondaryTextColor,
                      suffixText: selectedUnit,
                      suffixStyle: TextStyle(color: Colors.black),
                      border: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: AppColors.nextColor, width: 2.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.white70, width: 1.0),
                      ),
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                    ),
                    keyboardType: TextInputType.number,
                    style: TextStyle(color: Colors.black),
                  ),
                  Positioned(
                    right: 10,
                    bottom: 10,
                    top: 10,
                    child: DropdownButton<String>(
                      value: selectedUnit,
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedUnit = newValue!;
                        });
                      },
                      items: <String>['km', 'miles']
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value,
                              style: TextStyle(color: Colors.black)),
                        );
                      }).toList(),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 80),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    print("Mileage: ${mileageController.text} $selectedUnit");
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryColor,
                    minimumSize: Size(200, 50),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    elevation: 5,
                    shadowColor: Colors.black26,
                  ),
                  child: Text(
                    "Next",
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
