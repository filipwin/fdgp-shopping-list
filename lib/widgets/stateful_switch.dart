import 'package:flutter/material.dart';
import 'package:platformfriendlyappv2/controllers/switch_controller.dart';

class StatefulSwitch extends StatefulWidget {
  SwitchController controller;

  StatefulSwitch({@required this.controller});

  @override
  State<StatefulWidget> createState() => _State();
}

class _State extends State<StatefulSwitch> {
  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      value: widget.controller.value,
      onChanged: (newValue) {
        setState(() {
          widget.controller.value = newValue;
        });
      },
      title: Text('Is bought'),
    );
  }
}
