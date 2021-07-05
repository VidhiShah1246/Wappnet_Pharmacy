import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pharmacy/ui/widgets/custom_appbar.dart';
import 'package:pharmacy/ui/widgets/custom_navigation_drawer.dart';
import 'login.dart';


class HomePage extends StatefulWidget {
  HomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<HomePage> {
  String dropdownValue = 'One';
  static OutlineInputBorder blueBorder = new OutlineInputBorder(
      borderSide: new BorderSide(color: Colors.blue,width: 1.5),borderRadius: BorderRadius.circular(8));
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
          title: "Home",
          con: context
      ),
      backgroundColor: Colors.white,
      drawer: CustomNavigationDrawer(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [

                Text(
                    'Select Pharmacy', textAlign: TextAlign.start,
                    style: TextStyle
                      (color: Colors.blue,
                        fontWeight: FontWeight.w700,
                        fontSize: 16),),
                SizedBox(height: 20),
                DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                    border: blueBorder,
                    focusedBorder: blueBorder,
                    enabledBorder:blueBorder,
                    filled: true,
                    fillColor: Colors.grey,

                    hintText: "Pharmacy name",
                    contentPadding: EdgeInsets.all(8),
                  ),
                  icon: Icon(Icons.arrow_drop_down),
                  value: dropdownValue,
                  onChanged: (value) {
                    setState(() {
                      dropdownValue = value??'';
                    });
                  },
                  items: [
                    DropdownMenuItem(child: Text('Mr.Ashok'),value: 'One',),
                    DropdownMenuItem(child: Text('Mr.Chimanlal'),value: 'Two',),
                    DropdownMenuItem(child: Text('Mr.Chimanlal'),value: 'Three',)
                  ],
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
