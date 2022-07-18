import 'package:cloud_firestore/cloud_firestore.dart';

class Persons {
  String id;
  String name;
  String gender;
  int age;
  int lenght;
  int weight;
  Persons({
    required this.id,
    required this.name,
    required this.gender,
    required this.age,
    required this.lenght,
    required this.weight,
  });

  factory Persons.fromSnapshot(DocumentSnapshot snapshot) {
    return Persons(
        id: snapshot.id,
        name: snapshot["name"],
        gender: snapshot["gender"],
        age: snapshot["age"],
        lenght: snapshot["lenght"],
        weight: snapshot["weight"]);
  }
}
