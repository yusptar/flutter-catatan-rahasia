import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Catatan Rahasia",
        ),
      ),
      body: Center(
        child: ListView(
          children: [
            Container(
              margin: const EdgeInsets.all(10),
              child: const TextField(
                maxLines: 20,
                // controller: ,
                decoration: InputDecoration(
                  hintText: 'Catatan Rahasiaku',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5))),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
              child: ElevatedButton(
                onPressed: () {},
                child: const Text('Simpan'),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 10, right: 10),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).popUntil((route) => route.isFirst);
                },
                child: const Text('Tutup Catatan Rahasia'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
