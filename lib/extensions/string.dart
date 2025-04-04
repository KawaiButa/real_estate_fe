import 'package:currency_formatter/currency_formatter.dart';
import 'package:dartx/dartx.dart';
import 'package:real_estate_fe/constants/app_strings.dart';
import 'package:intl/intl.dart';

extension NumberParsing on dynamic {
  //
  String currencyFormat([String? currencySymbol]) {
    final currencyConfig = AppStrings.currencyConfig;
    //
    final thousandSeparator = currencyConfig["format"] ?? ",";
    final decimalSeparator = currencyConfig["decimal_format"] ?? ".";
    final decimals = currencyConfig["decimals"];
    final currencyLocation = currencyConfig["location"] ?? 'left';
    final decimalsValue = "".padLeft(decimals.toString().toIntOrNull()!, "0");

    //
    //
    final values = toString()
        .split(" ")
        .join("")
        .split(currencySymbol ?? AppStrings.currencySymbol);

    //
    CurrencyFormat currencySettings = CurrencyFormat(
      symbol: currencySymbol ?? AppStrings.currencySymbol,
      symbolSide: currencyLocation.toLowerCase() == "left"
          ? SymbolSide.left
          : SymbolSide.right,
      thousandSeparator: thousandSeparator,
      decimalSeparator: decimalSeparator,
    );

    return CurrencyFormatter.format(
      values[1],
      currencySettings,
      decimal: decimalsValue.length,
      enforceDecimals: true,
    );
  }

  //
  String currencyValueFormat() {
    final currencyConfig = AppStrings.currencyConfig;
    final thousandSeparator = currencyConfig["format"] ?? ",";
    final decimalSeparator = currencyConfig["decimal_format"] ?? ".";
    final decimals = currencyConfig["decimals"];
    final decimalsValue = "".padLeft(decimals.toString().toIntOrNull()!, "0");
    final values = toString().split(" ").join("");

    //
    CurrencyFormat currencySettings = CurrencyFormat(
      symbol: "",
      symbolSide: SymbolSide.right,
      thousandSeparator: thousandSeparator,
      decimalSeparator: decimalSeparator,
    );
    return CurrencyFormatter.format(
      values,
      currencySettings,
      decimal: decimalsValue.length,
      enforceDecimals: true,
    );
  }

  bool get isNotDefaultImage {
    return !toString().contains("default");
  }

  String maskString({int start = 3, int? end, String mask = "*"}) {
    final String value = toString();
    // make sure start and end are within the string length
    if (start < 0) {
      start = 0;
    }

    int endPoint = end ?? value.length;
    if (endPoint > value.length) {
      endPoint = value.length;
    }

    // get the front and end of the string
    final String frontString = start == 0 ? "" : value.substring(0, start);
    final String endString = value.substring(endPoint);
    final String maskedString = mask.padLeft(
      value.substring(start, endPoint).length,
      mask,
    );
    return "$frontString$maskedString$endString";
  }

  String formatTextFieldInputNumber(String s) =>
      NumberFormat.decimalPattern(Intl.defaultLocale).format(int.parse(s));

  String cleanTextFieldInputNumber(String s) => s.replaceAll(RegExp(r'\D'), '');
}

extension StringParsing on dynamic {
  //

  String telFormat() {
    return this.replaceAll(new RegExp(r'^0+(?=.)'), '');
  }

  String fill(List values) {
    //
    String data = toString();
    for (var value in values) {
      data = data.replaceFirst("%s", value.toString());
    }
    return data;
  }
}
