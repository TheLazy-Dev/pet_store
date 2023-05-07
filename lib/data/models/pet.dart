// To parse this JSON data, do
//
//     final pets = petsFromJson(jsonString);

import 'dart:convert';

Pets petsFromJson(String str) => Pets.fromJson(json.decode(str));

String petsToJson(Pets data) => json.encode(data.toJson());

class Pets {
  List<Pet>? pets;

  Pets({
    this.pets,
  });

  factory Pets.fromJson(Map<String, dynamic> json) => Pets(
        pets: json["pets"] == null
            ? []
            : List<Pet>.from(json["pets"]!.map((x) => Pet.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "pets": pets == null
            ? []
            : List<dynamic>.from(pets!.map((x) => x.toJson())),
      };
}

class Pet {
  int? id;
  String? name;
  int? age;
  String? details;
  String? breed;
  DateTime? adoptedDate;
  String? gender;
  int? price;
  String? imageUrl;

  Pet({
    this.id,
    this.name,
    this.age,
    this.details,
    this.breed,
    this.adoptedDate,
    this.gender,
    this.price,
    this.imageUrl,
  });

  factory Pet.fromJson(Map<String, dynamic> json) => Pet(
        id: json["id"],
        name: json["name"],
        age: json["age"],
        details: json["details"],
        breed: json["breed"],
        adoptedDate: json["adoptedDate"] == null
            ? null
            : DateTime.parse(json["adoptedDate"]!),
        gender: json["gender"],
        price: json["price"],
        imageUrl: json["imageUrl"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "age": age,
        "details": details,
        "breed": breed,
        "adoptedDate":
            "${adoptedDate?.year.toString().padLeft(4, '0')}-${adoptedDate?.month.toString().padLeft(2, '0')}-${adoptedDate?.day.toString().padLeft(2, '0')}",
        "gender": gender,
        "price": price,
        "imageUrl": imageUrl,
      };
}
