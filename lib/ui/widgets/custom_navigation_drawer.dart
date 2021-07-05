import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pharmacy/ui/home.dart';
import 'package:pharmacy/utils/shared_pref_utils.dart';

import '../login.dart';
import '../mytabs.dart';

class CustomNavigationDrawer extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return CustomNavigationDrawerState();
  }
}

class CustomNavigationDrawerState extends State<CustomNavigationDrawer>{
  void showLogOutDialog(BuildContext context){
    showDialog(
        builder: (context) => CupertinoAlertDialog(
          title: Container(margin: EdgeInsets.only(bottom: 8), child: Text('Pharmacy')),
          content: Text('Are you sure want to Logout?'),
          actions: <Widget>[
            FlatButton(
                onPressed: () async {
                  SharedPrefUtils.getPref().then((sp){
                    sp.clear();
                    Navigator.pushAndRemoveUntil(context,
                        PageRouteBuilder(pageBuilder: (context,animation1, animation2)=> LoginPage(title: 'Login',)),
                            (Route<dynamic> route) => false);
                  });
                },
                child: Text("Yes",)),
            FlatButton(
                onPressed: () {
                  Navigator.maybePop(context);
                },
                child: Text("No")),
          ],
        ), context: context,
        barrierDismissible: false
    );
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;

    return Drawer(
      child: Container(
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          SizedBox(width: 50,),
        Row(
          children: [
            Icon(Icons.local_pharmacy),
            SizedBox(width: 10,),
            Text('Pharmacy', style: TextStyle(color: Colors.red,fontWeight: FontWeight.w500, fontSize: 24,)),
      ]),
            GestureDetector(
              behavior: HitTestBehavior.translucent,
              onTap: (){
                Navigator.pop(context);
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => HomePage(title: 'Home')
                ));
              },
              child: Container(
                width: double.infinity,
                color: Colors.grey,
                padding: EdgeInsets.all(16),
                child: Row(
                  children: [
                    Icon(Icons.home),
                    SizedBox(width: 10,),
                    Text('Home', style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16,)),
                  ],
                ),
              ),
            ),

            GestureDetector(
              behavior: HitTestBehavior.translucent,
              onTap: (){
                Navigator.pop(context);
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => MyTabsPage(title: 'Home')
                ));
              },
              child: Container(
                width: double.infinity,
                color: Colors.grey,
                padding: EdgeInsets.all(16),
                child: Row(
                  children: [
                    Icon(Icons.home),
                    SizedBox(width: 10,),
                    Text('My Tabs', style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16,)),
                  ],
                ),
              ),
            ),
            GestureDetector(
              behavior: HitTestBehavior.translucent,
              onTap: (){
                Navigator.pop(context);
              },
              child: Container(
                width: double.infinity,
                color: Colors.white,
                padding: EdgeInsets.all(16),
                child:  Row(
                  children: [
                    Icon(Icons.logout),
                    SizedBox(width: 10,),
                    Text('Logout', style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16,)),
                  ],
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }

}