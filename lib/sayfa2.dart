import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Sayfa2 extends StatefulWidget {
  const Sayfa2({super.key});

  @override
  State<Sayfa2> createState() => _Sayfa2State();
}

class _Sayfa2State extends State<Sayfa2> {
  List ulkeler = [];

  Future<void> readJson() async {
    final String response =
        await rootBundle.loadString('assets/ulkeler/data.json');
    final data = await json.decode(response);
    setState(() {
      ulkeler = data;
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
        backgroundColor: Colors.blueGrey,
        title: Text("Bayraklar"),
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, childAspectRatio: 3 / 1),
        itemCount: ulkeler.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            child: Card(
              child: Center(
                child: Text(
                  ulkeler[index]["name"],
                  style: TextStyle(fontSize: 15),
                ),
              ),
            ),
            onTap: () {
              showDialog(
                context: context,
                builder: (context) => Dialog(
                  child: Container(
                    width: 500,
                    height: 300,
                    child:
                        Image.asset(ulkeler[index]["image"], fit: BoxFit.cover),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
