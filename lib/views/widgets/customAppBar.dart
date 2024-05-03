import 'package:flutter/material.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: AppBar(
        backgroundColor: Colors.black,
        title: Text("Court App", style: TextStyle(color: Colors.white))
      )
    );;
  }

   @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}