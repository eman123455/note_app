import 'package:flutter/material.dart';
import 'package:note_app/Widgets/customer_search_icon.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key, required this.title,required this.icon, this.onPressed});
  final String title;
  final IconData icon;
   final  void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 60, bottom: 16),
      child: Row(
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 25),
          ),
         const Spacer(),
          CustomerSearchIcon(
            onPressed: onPressed,
            icon: icon,
            ),
        ],
      ),
    );
  }
}
