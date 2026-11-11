class ConnectionString{
  static const  String baseUrl='https://dummyjson.com/';
  static const String Products = '$baseUrl/products';
  //  لجلب المنتجات حسب القسم المختار
  static String productsByCategory(String categoryName) => '$baseUrl/products/category/$categoryName';
}