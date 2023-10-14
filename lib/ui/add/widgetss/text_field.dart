import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddTextField extends StatefulWidget {
  const AddTextField({super.key, required this.hintText, required this.onChanged,  this.isNum=true});
  final String hintText;
  final ValueChanged<String> onChanged;
  final bool isNum;

  @override
  State<AddTextField> createState() => _AddTextFieldState();
}

class _AddTextFieldState extends State<AddTextField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 12.h),
      child: TextField(
        keyboardType: widget.isNum?TextInputType.number:TextInputType.name,
        inputFormatters: [
          if(widget.isNum)FilteringTextInputFormatter.digitsOnly
        ],
        onChanged: widget.onChanged,
        decoration: InputDecoration(
          hintText: widget.hintText,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.r),
            borderSide: BorderSide(
              color: Colors.purple
            )
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.r),
            borderSide: BorderSide(
              color: Colors.green
            )
          ),
        ),
      ),
    );
  }
}
