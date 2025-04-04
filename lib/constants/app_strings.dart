class AppStrings {
  static String userAuthToken = "auth_token";

  static String user = "user";

  static String get defaultCountryCode => "vn";

  static List<String> get forbiddenWords => [];

  static String get currencySymbol => "đ";
  static Map<String, dynamic> get currencyConfig => {
        "location": "Right",
        "format": ".",
        "decimal_format": ",",
        "decimals": "0"
      };
}
