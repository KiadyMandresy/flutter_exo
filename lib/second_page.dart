import 'package:flutter/material.dart';

class skypekely extends StatefulWidget {
  const skypekely({super.key});


  @override
  State<skypekely> createState() => _SkypeKelyState();
}
class _SkypeKelyState extends State<skypekely> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("2 eme"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                print('button PAGE 2 pressed!');
              },
              child: Text('Button PAGE 2'),
            )
          ],
        ),
      ),
    );
  }
}

