
class Restaurant {
  int? id;
  String? name;
  String? arName;
  String? address;
  bool? isOpen;
  String? description;
  String? arDescription;

  Restaurant(
      {this.id,
        this.name,
        this.arName,
        this.address,
        this.isOpen,
        this.description,
        this.arDescription});

  factory Restaurant.fromJson(Map<String, dynamic> json) {
    return Restaurant(
      id: json['id'] as int,
      name: json['name'] as String,
      arName: json['ar_name'] as String,
      address: json['address'] as String,
      isOpen: json['is_open'] as bool,
      description: json['description'] as String,
      arDescription: json['ar_description'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['ar_name'] = this.arName;
    data['address'] = this.address;
    data['is_open'] = this.isOpen;
    data['description'] = this.description;
    data['ar_description'] = this.arDescription;
    return data;
  }
}