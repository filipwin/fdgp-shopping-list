import 'package:flutter/material.dart';
import 'package:platformfriendlyappv2/utils/util.dart';

class VatDropdown extends StatefulWidget {
  final TextEditingController controller;

  VatDropdown({this.controller});

  @override
  State<StatefulWidget> createState() => _VatDropdownState();
}

class _VatDropdownState extends State<VatDropdown> {
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<double>(
      child: Container(
          width: 150,
          child: TextField(
            enabled: false,
            controller: widget.controller,
            decoration: InputDecoration(labelText: 'VAT value'),
          )),
      onSelected: _onSelected,
      itemBuilder: (c) => <PopupMenuEntry<double>>[
            PopupMenuItem(
              value: 0.0,
              child: Text('0%'),
            ),
            PopupMenuItem(
              value: 0.08,
              child: Text('8%'),
            ),
            PopupMenuItem(
              value: 0.23,
              child: Text('23%'),
            ),
          ],
    );
  }

  void _onSelected(double selectedValue) {
    print('Selected $selectedValue');
    setState(() {
      widget.controller.text = Util.numToPercentage(selectedValue);
    });
  }
}
