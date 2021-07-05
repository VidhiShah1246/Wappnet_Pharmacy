import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget{
  final String title;
  final BuildContext con;

  CustomAppBar({
    required this.title,
    required this.con
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: new IconButton(
          icon: new Icon(Icons.menu),
          onPressed: () => Scaffold.of(context).openDrawer(),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(title, style: TextStyle(
                color: Colors.blue, fontWeight: FontWeight.w900, fontSize: 24),)
          ],
        ),
        centerTitle: true,

        foregroundColor: Colors.white,
        backgroundColor: Colors.transparent,
        actions: [
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(56);

}