class CategoryWithProduct {
  final String idCategory = "";
  final String category = "";
  final String image = "";
  final String status = "";

  CategoryWithProduct({idCategory, category, image, status});

  factory CategoryWithProduct.fromJson(Map<String, dynamic> data) {
    return CategoryWithProduct(
        idCategory: data['id_category'],
        category: data['category'],
        image: data['image'],
        status: data['status']);
  }
}

class ProductModel {
  final String id_product = "";
  final String id_category = "";
  final String name = "";
  final String description = "";
  final String image = "";
  final String price = "";
  final String status = "";
  final String createdAt = "";

  ProductModel(
      {id_product,
      id_category,
      name,
      description,
      image,
      price,
      status,
      createdAt});

  factory ProductModel.fromJson(Map<String, dynamic> data) {
    return ProductModel(
      id_product: data['id_product'],
      id_category: data['id_category'],
      name: data['name'],
      description: data['description'],
      image: data['image'],
      price: data['price'],
      status: data['status'],
      createdAt: data['created_at'],
    );
  }
}
