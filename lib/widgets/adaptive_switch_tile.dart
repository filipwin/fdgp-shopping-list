import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'adaptive_widget.dart';

class AdaptiveSwitchTile extends AdaptiveWidget<SwitchListTile, Widget> {
  final String switchLabel;
  final bool value;
  final ValueChanged<bool> onChanged;

  AdaptiveSwitchTile({this.switchLabel, this.value, this.onChanged});

  @override
  Widget buildCupertinoWidget() {
    return Row(
      children: <Widget>[
        Text(switchLabel),
        Padding(
          padding: EdgeInsets.fromLTRB(16, 8, 16, 8),
          child: CupertinoSwitch(
            value: value,
            onChanged: onChanged,
          ),
        ),
      ],
    );
  }

  @override
  SwitchListTile buildMaterialWidget() {
    return SwitchListTile(
      value: value,
      onChanged: onChanged,
      title: Text(switchLabel),
    );
  }
}
