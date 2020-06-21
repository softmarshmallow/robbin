import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        child: Column(
          children: [
            ListTile(
              title: Text("menu 1"),
              onTap: (){},
            )
          ],
        ),
      ),
    );
  }

}