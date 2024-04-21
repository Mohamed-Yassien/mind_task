class HomeDataModel {
  bool? status;
  String? msg;
  HomeData? data;

  HomeDataModel({this.status, this.msg, this.data});

  HomeDataModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    msg = json['msg'];
    data = json['data'] != null ? HomeData.fromJson(json['data']) : null;
  }
}

class HomeData {
  List<Slider>? slider;
  List<Categories>? categories;
  List<Product>? products;
  List<Product>? selectedProducts;
  List<Product>? newProducts;

  HomeData(
      {this.slider,
      this.categories,
      this.products,
      this.selectedProducts,
      this.newProducts});

  HomeData.fromJson(Map<String, dynamic> json) {
    if (json['slider'] != null) {
      slider = <Slider>[];
      json['slider'].forEach((v) {
        slider!.add(Slider.fromJson(v));
      });
    }
    if (json['categories'] != null) {
      categories = <Categories>[];
      json['categories'].forEach((v) {
        categories!.add(Categories.fromJson(v));
      });
    }
    if (json['products'] != null) {
      products = <Product>[];
      json['products'].forEach((v) {
        products!.add(Product.fromJson(v));
      });
    }
    if (json['selected_products'] != null) {
      selectedProducts = <Product>[];
      json['selected_products'].forEach((v) {
        selectedProducts!.add(Product.fromJson(v));
      });
    }
    if (json['new_products'] != null) {
      newProducts = <Product>[];
      json['new_products'].forEach((v) {
        newProducts!.add(Product.fromJson(v));
      });
    }
  }
}

class Slider {
  String? id;
  String? productId;
  String? image;

  Slider({this.id, this.productId, this.image});

  Slider.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productId = json['product_id'];
    image = json['image'];
  }
}

class Categories {
  String? id;
  String? catName;
  String? icon;

  Categories({this.id, this.catName, this.icon});

  Categories.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    catName = json['cat_name'];
    icon = json['icon'];
  }
}

class Product {
  String? id;
  String? name;
  String? shortDesc;
  String? mainImage;
  String? listPrice;
  String? salePrice;
  String? discount;
  dynamic rating;

  Product(
      {this.id,
      this.name,
      this.shortDesc,
      this.mainImage,
      this.listPrice,
      this.salePrice,
      this.discount,
      this.rating});

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    shortDesc = json['short_desc'];
    mainImage = json['main_image'];
    listPrice = json['list_price'];
    salePrice = json['sale_price'];
    discount = json['discount'];
    rating = json['rating'];
  }
}
