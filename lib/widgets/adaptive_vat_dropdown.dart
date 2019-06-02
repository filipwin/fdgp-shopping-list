import 'package:flutter/cupertino.dart';

import 'adaptive_widget.dart';
import 'vat_dropdown.dart';

class AdaptiveVatDropdown extends AdaptiveWidget<Widget, Widget> {
  final TextEditingController materialValueController;
  final BuildContext cupertinoContext;
  final double cupertinoSpinnerHeight;
  final List<Widget> cupertinoSpinnerItems;
  final ValueChanged<int> onItemSelected;

  AdaptiveVatDropdown({
    this.cupertinoSpinnerHeight,
    this.cupertinoSpinnerItems,
    this.onItemSelected,
    this.materialValueController,
    this.cupertinoContext,
  });

  @override
  Widget buildCupertinoWidget() {
    return CupertinoButton(
      child: Text('VAT value: ${materialValueController.text}'),
      onPressed: _showCupertinoSpinner,
    );
  }

  @override
  Widget buildMaterialWidget() {
    return VatDropdown(
      controller: materialValueController,
    );
  }

  void _showCupertinoSpinner() {
    showCupertinoModalPopup(
      context: cupertinoContext,
      builder: (c) {
        return SizedBox(
          height: cupertinoSpinnerHeight,
          child: CupertinoPicker(
            itemExtent: 30,
            onSelectedItemChanged: onItemSelected,
            children: cupertinoSpinnerItems,
          ),
        );
      },
    );
  }
}
