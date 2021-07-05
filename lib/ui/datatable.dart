import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:pharmacy/models/community_bloc.dart';

class DataTablePage extends StatefulWidget {
  DataTablePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _DataTableState createState() => _DataTableState();
}

class _DataTableState extends State<DataTablePage> {
  late Community lstCommunity ;

  Future<Community> getData() async {
    // ignore: always_specify_types
    final Map data = {
      'user_id': '149',
    };
    print(jsonEncode(data));
    final Response response = await post(
      Uri.parse('https://staging.kynzagroup.ca/api/get_users_list'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(data),
    ).timeout(const Duration(seconds: 60));
    //print(response.statusCode);
    Community _community;
    print(response);
    if (response.statusCode == 200)
    {
      var data = json.decode(response.body);
      lstCommunity =  _community = Community.fromJson(data);
    }
    else {
      // If the server did not return a 201 CREATED response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
    // isLoading = false;
    // setState(() {});
    return _community;
  }
  void initState() {
    Future.delayed(Duration.zero, () async {
      getData();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12),
            child:  landData(),
          ),
        ),
      ),
    );
  }
  TextStyle formLabelStyle =
  TextStyle(fontSize: 12, color: Colors.black);

  TextStyle blueLabelStyle = TextStyle
    (color: Colors.blue,
      fontWeight: FontWeight.w700,
      fontSize: 16);

  Widget landData() => DataTable(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          // 10% of the width, so there are ten blinds.
          colors: <Color>[
           Colors.blue,
            Colors.white,
            Colors.blue
          ],
          // red to yellow
          tileMode: TileMode.repeated, // repeats the gradient over the canvas
        ),
        //border: Border.all(color:Colors.green,width:2),
        borderRadius: BorderRadius.circular(8),
      ),
      showBottomBorder : true,

      onSelectAll: (b) {},
      //sortColumnIndex: 1,
      sortAscending: true,
      columnSpacing: 12,
      horizontalMargin: 8,
      //headingRowColor: MaterialStateColor.resolveWith((states) {return ColorUtils.greenlabelColor;},),
      dataRowColor: MaterialStateColor.resolveWith((states) {return Colors.white;},),
      headingRowHeight: 36,
      dataRowHeight: 60,
      columns: <DataColumn>[
        DataColumn(
          label: Text("Id", textAlign: TextAlign.center,style: formLabelStyle,),
          numeric: false,

        ),
        DataColumn(
          label: Text("Full Name.", textAlign: TextAlign.center,style: formLabelStyle,),
          numeric: false,
          onSort: (i, b) {
            //print("$i $b");
            setState(() {
              //name.sort((a, b) => a.lastName.compareTo(b.lastName));
            });
          },
        ),
        DataColumn(
          label: Text("Status.", textAlign: TextAlign.center,style: formLabelStyle,),
          numeric: false,


        ),
        DataColumn(
          label: Text("Member Type", textAlign: TextAlign.center,style: formLabelStyle,),
          numeric: false,

        ),
      ],
      rows: lstCommunity.data[0].communityMembers
          .map(
            (name) => DataRow(
          cells: [
            DataCell(
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(name.id.toString()),
                ],
              ),
              showEditIcon: false,
              placeholder: false,
            ),
            DataCell(
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(name.fullName),
                ],
              ),
              showEditIcon: false,
              placeholder: false,
            ),
            DataCell(
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(name.approvalStatus),
                ],
              ),
              showEditIcon: false,
              placeholder: false,
            ),
            DataCell(
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(name.memberType),
                ],
              ),
              showEditIcon: false,
              placeholder: false,
            ),
          ],
        ),
      ).toList());
}
