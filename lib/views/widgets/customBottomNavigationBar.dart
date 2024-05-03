import 'package:court_app/views/widgets/addCase.dart';
import 'package:court_app/views/widgets/caseDetails.dart';
import 'package:court_app/views/widgets/profile.dart';
import 'package:court_app/views/widgets/showCase.dart';
import 'package:flutter/material.dart';

class CustomBottomNavigationWidget extends StatefulWidget {
  const CustomBottomNavigationWidget({super.key});

  @override
  State<CustomBottomNavigationWidget> createState() => _CustomBottomNavigationWidgetState();
}

class _CustomBottomNavigationWidgetState extends State<CustomBottomNavigationWidget> {

  int tabIndex = 0;

  @override
  Widget build(BuildContext context) {
    print(tabIndex);
    return Scaffold(
      body: getPage(tabIndex),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey[400],
        backgroundColor: Colors.black,
        currentIndex: tabIndex,
        onTap: (int index) {
          setState(() {
            tabIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.show_chart),
            label: "Cases",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notes),
            label: "Add cases",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.verified_user),
            label: "Profile",
          )
        ],
      ),
    );
  }

  Widget getPage(int index) {
    switch(index) {
      case 0:
        return CaseDetails();
      case 1:
        return AddCase();
      case 2:
        return Profile();
      default:
        return Container();
    }
  }

}