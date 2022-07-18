import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:test_pro/core/model/persons.dart';

class PersonsServices {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<Persons> addPerson(String name, String gender, int age, int lenght, int weight) async {
    var ref = _firestore.collection("persons");

    var documentRef = await ref
        .add({"name": name, "gender": gender, "lenght": lenght, "weight": weight});
    return Persons(
        id: documentRef.id,
        name: name,
        age: age,
        gender: gender,
        lenght: lenght,
        weight: weight);
  }
}
