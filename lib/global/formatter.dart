import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class VietnameseCurrencyInputFormatter extends TextInputFormatter {
  // Set the locale and currency symbol as desired. Here we use Vietnamese locale and currency.
  static final NumberFormat currencyFormatter = NumberFormat.currency(
    locale: "vi_VN",
    symbol: "₫",
    decimalDigits: 0,
  );

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    // Remove any non-digit characters
    String digitsOnly = newValue.text.replaceAll(RegExp(r'[^\d]'), '');
    if (digitsOnly.isEmpty) {
      return newValue.copyWith(text: '');
    }
    // Parse digits to integer
    int value = int.parse(digitsOnly);
    // Format value to Vietnamese currency format
    String newText = currencyFormatter.format(value);
    return TextEditingValue(
      text: newText,
      selection: TextSelection.collapsed(offset: newText.length),
    );
  }
}
