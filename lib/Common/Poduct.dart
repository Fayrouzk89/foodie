class Product {
  int? id;
  String? name;
  String? arName;
  String? description;
  String? arDescription;
  String? price;
  bool? isOffer;
  int? restaurant;

  Product(
      {this.id,
        this.name,
        this.arName,
        this.description,
        this.arDescription,
        this.price,
        this.isOffer,
        this.restaurant});

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    arName = json['ar_name'];
    description = json['description'];
    arDescription = json['ar_description'];
    price = json['price'];
    isOffer = json['is_offer'];
    restaurant = json['restaurant'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['ar_name'] = this.arName;
    data['description'] = this.description;
    data['ar_description'] = this.arDescription;
    data['price'] = this.price;
    data['is_offer'] = this.isOffer;
    data['restaurant'] = this.restaurant;
    return data;
  }
}