import 'package:cloud_firestore/cloud_firestore.dart';

FirebaseFirestore fbdb = FirebaseFirestore.instance;

//Read
Future<List> getData() async {
  List datos = [];
  CollectionReference collectionReferenceData = fbdb.collection('entes');

  QuerySnapshot queryData = await collectionReferenceData.get();

  for (var documento in queryData.docs) {
    final Map<String, dynamic> data = documento.data() as Map<String, dynamic>;
    final dato = {
      "prueba": data['prueba'],
      "uid": documento.id,
    };
    datos.add(dato);
  }
  return datos;
}

//Create
Future<void> AddData(String name) async {
  await fbdb.collection('entes').add({"prueba": name});
}

//Update
Future<void> UpdateData(String uid, String newData) async {
  await fbdb.collection('entes').doc(uid).set({"prueba": newData});
}

//Delete
Future<void> DeleteData(String uid) async {
  await fbdb.collection('entes').doc(uid).delete();
}
