import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, this.onTap,this.isLoading=false});
  final void Function()? onTap;
 final  bool isLoading;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: const BoxDecoration(color: Color(0xff53EBD6)),
        width: MediaQuery.of(context).size.width,
        child:  Center(
          child:isLoading?const CircularProgressIndicator():const  Text(
            'Add',
            style: TextStyle(
                color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
