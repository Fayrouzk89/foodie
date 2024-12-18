import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
class SearchTextField extends StatefulWidget {
  final TextEditingController controller;
  SearchTextField({Key? key, required this.controller}) : super(key: key);

  @override
  _SearchTextFieldState createState() {
    return _SearchTextFieldState();
  }
}

class _SearchTextFieldState extends State<SearchTextField> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return TextField(
      controller: widget.controller,
      decoration: InputDecoration(
        isDense: true,
        hintText: "search".tr(), // Placeholder text
        prefixIcon: const Icon(Icons.search), // Search icon
        filled: true,
        fillColor: Colors.grey[200], // Background color
        contentPadding: const EdgeInsets.symmetric(vertical: 15),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
          borderSide: const BorderSide(
            color: Colors.transparent, // Border color when not focused
            width: 2.0, // Border width
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
          borderSide: const BorderSide(
            color: Colors.transparent, // Border color when focused
            width: 2.5, // Border width
          ),
        ),
      ),
    );
  }
}