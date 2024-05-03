import 'package:court_app/services/caseService.dart';
import 'package:court_app/utils/snackbarHelper.dart';
import 'package:court_app/views/widgets/showCase.dart';
import 'package:flutter/material.dart';

class CaseDetails extends StatefulWidget {
  const CaseDetails({super.key});

  @override
  State<CaseDetails> createState() => _CaseDetailsState();
}

class _CaseDetailsState extends State<CaseDetails> {

  bool isLoading = false;
  List cases = [];


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchCases();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: cases.length,
        itemBuilder: (context, index) {

          final caseD = cases[index];
          final id = caseD['_id'];
          

          return GestureDetector(
            onTap: () {
              navigateToDetails(caseD);
            },
            child: Card(
            child: ListTile(
              leading: CircleAvatar(child: Text("${index + 1}"),),
              title: Text(caseD["courtJudgeName"]),
              subtitle: Text(caseD["plaintiffPartyName"]),
            ),
            ),
          );
      })
    );
  }


  // Get the data from the URL
  Future<void> fetchCases() async {
    final response = await CaseService.fetchCases();

    if (response != null) {
      setState(() {
        cases = response;
      });
    } else {
      showErrorMessage(context, message: "Something went wrong!!");
    }

    setState(() {
      isLoading = false;
    });
  }

  Future<void> navigateToDetails(Map item) async {
    final route = MaterialPageRoute(
      builder: (context) => Showcase(caseItem: item)
    );
    await Navigator.push(context, route);
  }

  // Navigator.of(context).push(MaterialPageRoute(builder: (context) => Showcase()));
}