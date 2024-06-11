import 'package:flutter_pruebacorta_2/firebase_service.dart';
import 'package:flutter/material.dart';

class AggData extends StatefulWidget {
  const AggData({super.key});

  @override
  State<AggData> createState() => _AggDataState();
}

class _AggDataState extends State<AggData> {
//controller
  TextEditingController nameController = TextEditingController(text: "");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Agregar Datos'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                hintText: 'Ingrese un dato',
              ),
            ),
            ElevatedButton(
                onPressed: () async {
                  await AddData(nameController.text).then((_) {
                    Navigator.pop(context);
                  });
                },
                child: const Text('Save'))
          ],
        ),
      ),
    );
  }
}
