import 'package:court_app/views/widgets/addCase.dart';
import 'package:court_app/views/widgets/caseDetails.dart';
import 'package:court_app/views/widgets/showCase.dart';
import 'package:flutter/material.dart';
import 'profile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int tabIndex = 0;
  List<Widget> _WidgetOptions = <Widget>[
    CaseDetails(),
    AddCase(),
    Profile(),
    Showcase(),
    CaseDetails(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: APP,
      body: Center(
        child: _WidgetOptions.elementAt(tabIndex)
      ),
      // bottomNavigationBar: BottomNavigationBar(
      //   selectedItemColor: Colors.white,
      //   unselectedItemColor: Colors.grey[400],
      //   backgroundColor: Colors.black,
      //   currentIndex: tabIndex,
      //   onTap: (int index) {
      //     setState(() {
      //       tabIndex = index;
      //     });
      //   },
      //   items: [
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.show_chart),
      //       label: "Cases",
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.notes),
      //       label: "Add cases",
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.verified_user),
      //       label: "Profile",
      //     )
      //   ],
      // ),
      backgroundColor: Colors.blue[100],
    );
  }
}