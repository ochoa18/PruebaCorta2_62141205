import 'package:crud_firebase/services/firebase_service.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({
    super.key,
  });

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Material App Bar'),
      ),
      body: FutureBuilder(
          future: getData(),
          builder: ((context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data?.length,
                  itemBuilder: ((context, index) {
                    return ListTile(
                        title: Text(snapshot.data?[index]['prueba']),
                        onTap: (() async {
                          await Navigator.pushNamed(context, '/editData',
                              arguments: {
                                "prueba": snapshot.data?[index]['prueba'],
                                "uid": snapshot.data?[index]['uid'],
                              });
                          setState(() {});
                        }));
                  }));
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          })),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.pushNamed(context, '/aggData');

          setState(() {});
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
