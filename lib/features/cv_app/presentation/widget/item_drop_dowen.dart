import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ItemDropDowen extends StatefulWidget {
  ItemDropDowen(
   {
    super.key,
    required this.items,
    required this.selectedItem,
    required this.controller
  });
  final List items;
  String selectedItem = '';
  TextEditingController controller;

  @override
  State<ItemDropDowen> createState() => _ItemDropDowenState();
}

class _ItemDropDowenState extends State<ItemDropDowen> {
  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: widget.selectedItem,
      onChanged: (value) {
        setState(() {
          widget.selectedItem = value!;
        });
        widget.controller.text =  widget.selectedItem;
      },
      items: widget.items.map<DropdownMenuItem<String>>((value) {
        return DropdownMenuItem<String>(
          value: value.toString(),
          child: Text(value.toString()),
        );
      }).toList(),
    );
  }
}
