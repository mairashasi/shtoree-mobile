// To parse this JSON data, do
//
//     final Product = ProductFromJson(jsonString);

import 'dart:convert';

Product productFromJson(String str) => Product.fromJson(json.decode(str));

String productToJson(Product data) => json.encode(data.toJson());

class Product {
    String model;
    String pk;
    Fields fields;

    Product({
        required this.model,
        required this.pk,
        required this.fields,
    });

    factory Product.fromJson(Map<String, dynamic> json) => Product(
        model: json["model"],
        pk: json["pk"],
        fields: Fields.fromJson(json["fields"]),
    );

    Map<String, dynamic> toJson() => {
        "model": model,
        "pk": pk,
        "fields": fields.toJson(),
    };
}

class Fields {
    String name;
    int price;
    String feedback;
    int rating;

    Fields({
        required this.name,
        required this.price,
        required this.feedback,
        required this.rating,
    });

    factory Fields.fromJson(Map<String, dynamic> json) => Fields(
        name: json["name"],
        price: json["price"],
        feedback: json["feedback"],
        rating: json["rating"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "price": price,
        "feedback": feedback,
        "rating": rating,
    };
}
