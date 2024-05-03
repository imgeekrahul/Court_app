import 'package:court_app/views/widgets/addCase.dart';
import 'package:court_app/views/widgets/caseDetails.dart';
import 'package:court_app/views/widgets/customAppBar.dart';
import 'package:court_app/views/widgets/customBottomNavigationBar.dart';
import 'package:court_app/views/widgets/profile.dart';
import 'package:flutter/material.dart';

class Showcase extends StatefulWidget {
  const Showcase({
    super.key,
    this.caseItem  
  });

  final Map? caseItem;

  @override
  State<Showcase> createState() => _ShowcaseState();
}

class _ShowcaseState extends State<Showcase> {

  late String judgeName;
  late String plaintiffPartyName;
  late String defendantPartyName;
  late String caseNumber;
  late String advanceDate;
  late String partyContactNumber;
  late String noteDetails;

  Map<String, dynamic>? caseDetail;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    caseDetail = widget.caseItem?.map((key, value) => MapEntry<String, dynamic>(key.toString(), value));
    if(caseDetail != null) {
      judgeName = caseDetail!["courtJudgeName"];
      plaintiffPartyName = caseDetail!["plaintiffPartyName"];
      defendantPartyName = caseDetail!["defendantPartyName"];
      caseNumber = caseDetail!["caseNumber"];
      advanceDate = caseDetail!["advanceDate"];
      partyContactNumber = caseDetail!["partyContactNumber"];
      noteDetails = caseDetail!["noteDetails"];
    }
  }

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
        Navigator.push(context, MaterialPageRoute(builder: (context) => CaseDetails()));
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
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              DataTable(
                columns: [
                  DataColumn(label: Text("Content")),
                  DataColumn(label: Text("Value"))
                ],
                rows: [
                  DataRow(cells: [
                    DataCell(Text('Judge Name')),
                    DataCell(Text(judgeName))
                  ]),
                  DataRow(cells: [
                    DataCell(Text("Plaintiff Party Name")),
                    DataCell(Text(plaintiffPartyName))
                  ]),
                  DataRow(cells: [
                    DataCell(Text("Defedent Party Name")),
                    DataCell(Text(defendantPartyName))
                  ]),
                  DataRow(cells: [
                    DataCell(Text("Case Number")),
                    DataCell(Text(caseNumber))
                  ]),
                  DataRow(cells: [
                    DataCell(Text("Advance Date")),
                    DataCell(Text(advanceDate))
                  ]),
                  DataRow(cells: [
                    DataCell(Text("Party Contact Number")),
                    DataCell(Text(partyContactNumber))
                  ]),
                  DataRow(cells: [
                    DataCell(Text("Notes")),
                    DataCell(Text(noteDetails))
                  ]),
                ],  
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: ElevatedButton(
                        onPressed: () {
                          if (caseDetail != null) {
                            NavigateToEditPage(caseDetail!);
                          } else {
                            // Handle the case when caseDetail is null, perhaps by showing a message or taking another action
                          }
                        }, 
                        child: Row(
                          children: [
                            Icon(Icons.edit),
                            SizedBox(width: 8),
                            Text("Edit")
                          ],
                        )
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: ElevatedButton(
                        onPressed: () {
                                      
                        },
                        child: Row(
                          children: [
                            Icon(Icons.delete),
                            SizedBox(width: 8),
                            Text("Delete")
                          ],
                        )
                      ),
                    )
                  ],
                ),
              )
            ]
          ),
        )
      ),
      // bottomNavigationBar: CustomBottomNavigationWidget(
      //   currentIndex: tabIndex,
      //   onTap: _onItemTapped,
      // ),
    );
  }

  Future<void> NavigateToEditPage(Map caseItem) async {
    final route = MaterialPageRoute(
      builder: (context) => AddCase(caseData: caseItem),
    );

    await Navigator.push(context, route);
  }
}