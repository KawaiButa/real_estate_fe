import 'dart:math';
import 'package:dartx/dartx.dart';
import 'package:real_estate_fe/constants/app_strings.dart';
import 'package:currency_formatter/currency_formatter.dart';

extension DynamicParsing on dynamic {
  //
  String fill(List values) {
    //
    String data = toString();
    for (var value in values) {
      data = data.replaceFirst("%s", value.toString());
    }
    return data;
  }

  //randomAlphaNumeric(length)
  String randomAlphaNumeric(int length) {
    const String chars =
        "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
    final Random rnd = Random(DateTime.now().millisecondsSinceEpoch);
    final String result = String.fromCharCodes(
      Iterable.generate(
        length,
        (_) => chars.codeUnitAt(rnd.nextInt(chars.length)),
      ),
    );
    return result;
  }

  String currencyFormat() {
    final currencyConfig = AppStrings.currencyConfig;
    //
    final thousandSeparator = currencyConfig["format"] ?? ",";
    final decimalSeparator = currencyConfig["decimal_format"] ?? ".";
    final decimals = currencyConfig["decimals"];
    final currencyLocation = currencyConfig["location"] ?? 'left';
    final decimalsValue =
        "".padLeft(decimals.toString().toIntOrNull() ?? 0, "0");

    //
    //
    final values =
        toString().split(" ").join("").split(AppStrings.currencySymbol);

    //
    CurrencyFormat currencySettings = CurrencyFormat(
      symbol: AppStrings.currencySymbol,
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

  String currencyValueFormat() {
    final currencyConfig = AppStrings.currencyConfig;
    final thousandSeparator = currencyConfig["format"] ?? ",";
    final decimalSeparator = currencyConfig["decimal_format"] ?? ".";
    final decimals = currencyConfig["decimals"];
    final decimalsValue =
        "".padLeft(decimals.toString().toIntOrNull() ?? 0, "0");
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
}
