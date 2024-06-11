import 'package:flutter_pruebacorta_2/firebase_service.dart';
import 'package:flutter/material.dart';

class EditData extends StatefulWidget {
  const EditData({super.key});

  @override
  State<EditData> createState() => _EditDataState();
}

class _EditDataState extends State<EditData> {
//controller
  TextEditingController nameController = TextEditingController(text: "");

  @override
  Widget build(BuildContext context) {
    final Map arguments = ModalRoute.of(context)!.settings.arguments as Map;
    nameController.text = arguments['prueba'];
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Data'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                hintText: 'Modifique el dato',
              ),
            ),
            ElevatedButton(
                onPressed: () async {
                  await UpdateData(arguments['uid'], nameController.text)
                      .then((value) {
                    Navigator.pop(context);
                  });
                },
                child: const Text('Actualizar'))
          ],
        ),
      ),
    );
  }
}
