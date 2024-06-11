import 'package:flutter_pruebacorta_2/firebase_service.dart';
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
                    return Dismissible(
                      onDismissed: (direction) async {
                        await DeleteData(snapshot.data?[index]['uid']);
                        snapshot.data?.removeAt(index);
                      },
                      confirmDismiss: (direction) async {
                        bool result = false;

                        result = await showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: Text(
                                    "¿Borrar datos de ${snapshot.data?[index]['prueba']}?"),
                                actions: [
                                  TextButton(
                                      onPressed: () {
                                        return Navigator.pop(
                                          context,
                                          false,
                                        );
                                      },
                                      child: const Text("Cancelar")),
                                  TextButton(
                                      onPressed: () {
                                        return Navigator.pop(
                                          context,
                                          true,
                                        );
                                      },
                                      child: const Text("Si, estoy seguro"))
                                ],
                              );
                            });
                        return result;
                      },
                      background: Container(
                        color: Colors.blue,
                        child: const Icon(Icons.delete),
                      ),
                      direction: DismissDirection.endToStart,
                      key: Key(snapshot.data?[index]['uid']),
                      child: ListTile(
                          title: Text(snapshot.data?[index]['prueba']),
                          onTap: (() async {
                            await Navigator.pushNamed(context, '/editData',
                                arguments: {
                                  "prueba": snapshot.data?[index]['prueba'],
                                  "uid": snapshot.data?[index]['uid'],
                                });
                            setState(() {});
                          })),
                    );
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
