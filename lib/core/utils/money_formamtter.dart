import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/services.dart';

class CurrencyInputFormatter extends TextInputFormatter {
  static const separator = ',';
  static const separatorLimit = 3;

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    final newValueString = newValue.text.replaceAll(separator, '');

    if (newValueString.isEmpty) {
      return newValue;
    }

    final parsedValue = double.tryParse(newValueString) ?? 0.0;

    String newFormattedValue = _formatNumber(parsedValue);
    if (newValueString.endsWith('.')) {
      newFormattedValue += '.';
    }
    return TextEditingValue(
        text: newFormattedValue,
        selection: TextSelection.collapsed(offset: newFormattedValue.length));
  }

  String _formatNumber(double value) {
    final formatter = NumberFormat('#,###.##');
    return formatter.format(value);
  }
}

extension Money on String {
  String toMoney() {
    final formatter = NumberFormat('#,###.##');
    return formatter.format(double.tryParse(this) ?? 0);
  }
}
