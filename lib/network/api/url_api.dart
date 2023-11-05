class BASEURL {
  static String ipAddress = "192.168.0.9";
  static String apiRegister =
      "http://$ipAddress:9090/medhelath_db/register_api.php";
  static String apiLogin = "http://$ipAddress:9090/medhelath_db/login_api.php";
  static String categoryWithProduct =
      "http://$ipAddress:9090/medhelath_db/get_product_with_category.php";

  static String getProduct =
      "http://$ipAddress:9090/medhelath_db/get_product.php";
}
