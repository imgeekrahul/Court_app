import 'package:court_app/views/widgets/addCase.dart';
import 'package:court_app/views/widgets/caseDetails.dart';
import 'package:court_app/views/widgets/customAppBar.dart';
import 'package:court_app/views/widgets/customBottomNavigationBar.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {

  int tabIndex = 0;
  // List<Widget> _WidgetOptions = <Widget>[
  //   CaseDetails(),
  //   AddCase(),
  //   Profile(),
  //   Showcase(),
  //   CaseDetails(),
  // ];

  void _onItemTapped(int index) {
    print(index);
    setState(() {
      tabIndex = index;
    });

    switch(index) {
      case 0:
        // Navigator.push(context, MaterialPageRoute(builder: (context) => CaseDetails()));
        break;
      case 1:
        Navigator.push(context, MaterialPageRoute(builder: (context) => AddCase()));
        break;
      case 2:
        Navigator.push(context, MaterialPageRoute(builder: (context) => Profile()));
        break;
      case 3:
        // Navigate to Showcase (current page)
        break;
      case 4:
        // Navigate to CaseDetails
        break;
      default:
        // Handle default case
        break;
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: CustomAppbar(),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                margin: EdgeInsets.all(20),
                height: 120,
                width: 120,
                child: CircleAvatar(
                  backgroundColor: Colors.blueAccent,
                  child: Text("Profile Image"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text("Rahul Ranjan",
                style: TextStyle(fontSize: 20)),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(left: 10.0, right: 20.0),
                  child: Divider(
                    color: Colors.black,
                    height: 36
                  ))
              ),
              Text("Profile Page"),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(left: 20.0, right: 10.0),
                  child: Divider(
                    color: Colors.black,
                    height: 36
                  ),
                ),
              )
            ],
          ),
          Expanded(
            child: ListView(
              children: [
                Container(
                  height: 50,
                  child: Text('Number of cases: '),
                ),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        child: Divider(),
                      )
                    ),
                  ],
                ),
                Container(
                  height: 50,
                  child: Text('Upcoming cases: '),
                ),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        child: Divider(),
                      )
                    )    
                  ],
                )
              ],
            )
          )
        ], 
      ),
      // bottomNavigationBar: CustomBottomNavigationWidget(
      //   currentIndex: tabIndex,
      //   onTap: _onItemTapped,
      // ),
    );
  }
}