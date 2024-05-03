import 'dart:convert';

import 'package:court_app/services/caseService.dart';
import 'package:court_app/utils/snackbarHelper.dart';
import 'package:court_app/views/widgets/caseDetails.dart';
import 'package:court_app/views/widgets/customAppBar.dart';
import 'package:court_app/views/widgets/customBottomNavigationBar.dart';
import 'package:court_app/views/widgets/profile.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class AddCase extends StatefulWidget {

  final Map? caseData;
  const AddCase({
    super.key,
    this.caseData
  });

  @override
  State<AddCase> createState() => _AddCaseState();
}

class _AddCaseState extends State<AddCase> {

  TextEditingController judgeNameController = TextEditingController();
  TextEditingController plantiffNameController = TextEditingController();
  TextEditingController defendantNameController = TextEditingController();
  TextEditingController caseNumberController = TextEditingController();
  TextEditingController advanceDateController = TextEditingController();
  TextEditingController partyContactNumberController = TextEditingController();
  TextEditingController notesController = TextEditingController();

  bool _validate = false;
  bool isEdit = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    final caseItem = widget.caseData;
    if(caseItem != null) {
      isEdit = true;
      final judgeName = caseItem['courtJudgeName'];
      final plaintiffPartyName = caseItem['plaintiffPartyName'];
      final defedentPartyName = caseItem['defendantPartyName'];
      final caseNumber = caseItem['caseNumber'];
      final advanceDate = caseItem['advanceDate'];
      final partyContactNumber = caseItem['partyContactNumber'];
      final noteDetails = caseItem['noteDetails'];

      judgeNameController.text = judgeName;
      plantiffNameController.text = plaintiffPartyName;
      defendantNameController.text = defedentPartyName;
      caseNumberController.text = caseNumber;
      advanceDateController.text = advanceDate;
      partyContactNumberController.text = partyContactNumber;
      notesController.text = noteDetails;
    }
  }

  int tabIndex = 0;
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
      // appBar: CustomAppbar(),
      body: ListView(
        padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
        children: [
          TextField(
            controller: judgeNameController,
            onChanged: (value) {
              setState(() {
                _validate = true; // Clear error message when user starts typing
              });
            },
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: "Judge Name",
              hintText: "Enter Judge Name",
              errorText: _validate && judgeNameController.text.isEmpty ? "Please Enter Judge Name" : null
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
            child: TextField(
              controller: plantiffNameController,
              onChanged: (value) {
                setState(() {
                  _validate = true; // Clear error message when user starts typing
                });
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Plaintiff Party Name",
                hintText: "Enter Plaintiff Party Name",
                errorText: _validate && plantiffNameController.text.isEmpty ? "Please Enter Plaintiff Party Name" : null
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
            child: TextField(
              controller: defendantNameController,
              onChanged: (value) {
                setState(() {
                  _validate = true; // Clear error message when user starts typing
                });
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Defendant Party Name",
                hintText: "Enter Defendant Party Name",
                errorText: _validate && defendantNameController.text.isEmpty ? "Please Enter Defendant Party Name" : null
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
            child: TextField(
              controller: caseNumberController,
              onChanged: (value) {
                setState(() {
                  _validate = true; // Clear error message when user starts typing
                });
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Case Number",
                hintText: "Enter Case Number",
                errorText: _validate && caseNumberController.text.isEmpty ? "Please Enter Case Number" : null
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
            child: TextField(
              controller: advanceDateController,
              onChanged: (value) {
                setState(() {
                  _validate = true; // Clear error message when user starts typing
                });
              },
              onTap: () async {
                DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(1950),
                    //DateTime.now() - not to allow to choose before today.
                    lastDate: DateTime(2100));
 
                if (pickedDate != null) {
                  print(
                      pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                  String formattedDate =
                      DateFormat('yyyy-MM-dd').format(pickedDate);
                  print(
                      formattedDate); //formatted date output using intl package =>  2021-03-16
                  setState(() {
                    advanceDateController.text =
                        formattedDate; //set output date to TextField value.
                  });
                } else {}
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Advance Date",
                hintText: "Enter Advance Date",
                errorText: _validate && advanceDateController.text.isEmpty ? "Please Enter Advance Date" : null
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
            child: TextField(
              controller: partyContactNumberController,
              onChanged: (value) {
                setState(() {
                  _validate = true; // Clear error message when user starts typing
                });
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Party Contact Number",
                hintText: "Enter Party Contact Number",
                errorText: _validate && partyContactNumberController.text.isEmpty ? "Please Enter Party Contact Number" : null
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
            child: TextField(
              controller: notesController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Notes",
                hintText: "Enter Notes"),
              keyboardType: TextInputType.multiline,
              minLines: 5,
              maxLines: 8,
            ),
          ),
          SizedBox(height: 10),
          ElevatedButton(
            onPressed: isEdit ? updateData : submitData,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(isEdit ? "Edit Case" : "Add Case"),
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

  

  Future<void> submitData() async {
    final judgeName = judgeNameController.text;
    final plantiffName = plantiffNameController.text;
    final defendantName = defendantNameController.text;
    final caseNumber = caseNumberController.text;
    final advanceDate = advanceDateController.text;
    final partyContactNumber = partyContactNumberController.text;
    final notes = notesController.text;

    if (judgeNameController.text.isEmpty || plantiffNameController.text.isEmpty || defendantNameController.text.isEmpty || caseNumberController.text.isEmpty || advanceDateController.text.isEmpty || partyContactNumberController.text.isEmpty) {
      setState(() {
        _validate = true;
      });
    } else {
      setState(() {
        _validate = false;
      });
    }

    final body = {
      "courtJudgeName": judgeName,
      "plaintiffPartyName": plantiffName,
      "defendantPartyName": defendantName,
      "caseNumber": caseNumber,
      "advanceDate": advanceDate,
      "partyContactNumber": partyContactNumber,
      "noteDetails": notes
    };

    final url = "http://localhost:5000/v1/create/case";

    final uri = Uri.parse(url);

    if (_validate == false) {
      final response = await http.post(
        uri,
        body: jsonEncode(body),
        headers: {
          'Content-Type': "application/json"
        }
      );

      if(response.statusCode == 201) {
        judgeNameController.text = "";
        plantiffNameController.text = "";
        defendantNameController.text = "";
        caseNumberController.text = "";
        advanceDateController.text = "";
        partyContactNumberController.text = "";
        notesController.text = "";
        showSuccessMessage(context, message: "Case created !!");
      } else {
        showSuccessMessage(context, message: "Something went wrong !!");
      }
    } else {
      showSuccessMessage(context, message: "Please provide complete details !!");
    }
  }

  Future<void> updateData() async {
    final caseDetail = widget.caseData;
    // print(caseDetail);
    if(caseDetail == null) {
      print("You cannot call updated without caseData data!!");
      return;
    }

    final id = caseDetail['_id'];
    final judgeName = judgeNameController.text;
    final plantiffName = plantiffNameController.text;
    final defendantName = defendantNameController.text;
    final caseNumber = caseNumberController.text;
    final advanceDate = advanceDateController.text;
    final partyContactNumber = partyContactNumberController.text;
    final notes = notesController.text;

    final body = {
      "courtJudgeName": judgeName,
      "plaintiffPartyName": plantiffName,
      "defendantPartyName": defendantName,
      "caseNumber": caseNumber,
      "advanceDate": advanceDate,
      "partyContactNumber": partyContactNumber,
      "noteDetails": notes
    };

    print(body);

    final isSuccess = await CaseService.updateCaseData(id, body);

    // show success or fail message based on status
    if(isSuccess) {
      showSuccessMessage(context, message: "Case updated Successfully");
    } else {
      showErrorMessage(context, message: "Please add a valid data");
    }

  }
}