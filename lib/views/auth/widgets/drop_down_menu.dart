import 'package:flutter/material.dart';

import '../../../utill/constants/color_manager.dart';

class DropDownMenu extends StatefulWidget {
  final List<String> items;
  final String initialSelectedType;
  final void Function(String) onChanged;

  const DropDownMenu({super.key,
    required this.items,
    required this.initialSelectedType,
    required this.onChanged,
  });

  @override
  State<DropDownMenu> createState() => _DropDownMenuState();
}

class _DropDownMenuState extends State<DropDownMenu> {
  late String selectedType;

  @override
  void initState() {
    super.initState();
    selectedType = widget.initialSelectedType;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 0, right: 0),
      child: DropdownButtonFormField(

        decoration:  InputDecoration(
          contentPadding: const EdgeInsets.symmetric(vertical: 1,horizontal: 10),
          enabledBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide(color:   ColorsManager.higherBlue),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide(color:   ColorsManager.higherBlue),
          ),
          errorBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          focusedErrorBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),

          ),
          disabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          filled: true,
          fillColor:  ColorsManager.white,
        ),
        validator: (value) =>
        value == null ? "Select Participant Type" : null,
        dropdownColor:  ColorsManager.white,
        hint: const Text("Select Participant Type"),
        value: selectedType,
        onChanged: (String? newValue) {
          setState(() {
            selectedType = newValue!;
            widget.onChanged(selectedType); // Pass the selected value to the callback
          });
        },
        items: widget.items.map((String value) {
          return DropdownMenuItem<String>(
            enabled: true,
            value: value,
            child: Text(
              value,
              style: const TextStyle(color: Colors.black, fontSize: 15),
            ),
          );
        }).toList(),
      ),
    );
  }
}
