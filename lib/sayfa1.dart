import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Sayfa1 extends StatefulWidget {
  const Sayfa1({super.key});

  @override
  State<Sayfa1> createState() => _Sayfa1State();
}

class _Sayfa1State extends State<Sayfa1> {
  List ogrenciler = [];

  Future<void> readJson() async {
    final String response =
        await rootBundle.loadString('assets/ogrenciler/data.json');
    final data = await json.decode(response);
    setState(() {
      ogrenciler = data;
    });
  }

  @override
  void initState() {
    super.initState();
    readJson();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Text("Öğrenciler"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15.0),
        child: ListView.builder(
          itemCount: ogrenciler.length,
          itemBuilder: (context, index) {
            return Card(
              color: ogrenciler[index]["cins"] == "e"
                  ? Colors.blue.shade300
                  : Colors.pink.shade300,
              child: ListTile(
                  leading: Image.asset(
                      "assets/ogrenciler/images/${ogrenciler[index]["resim"]}.jpg"),
                  title: Text(ogrenciler[index]["isim"]),
                  subtitle: Text(ogrenciler[index]["numara"]),
                  trailing: IconButton(
                    icon: Icon(Icons.zoom_in),
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) => Dialog(
                          child: Container(
                            width: 300,
                            height: 300,
                            child: Image.asset(
                                fit: BoxFit.cover,
                                "assets/ogrenciler/images/${ogrenciler[index]["resim"]}.jpg"),
                          ),
                        ),
                      );
                    },
                  )),
            );
          },
        ),
      ),
    );
  }
}
