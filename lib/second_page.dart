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
      body: _corps(),
    );
  }

  Widget _corps() {
    return Center(child: _getDiscussion());
  }

  Widget _getDiscussion() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        _getTextDisplay(),
        const SizedBox(
          height: 100,
          width: 50,
        ),
        _getSendingArea(),
      ],
    );
  }

  Widget _getTextDisplay() {
    return Expanded(
      flex: 2,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.black,
            width: 2.0,
          ),
        ),
      ),
    );
  }

  Widget _getSendingArea() {
    return Container(
      height: 200,
      child: Row(
        children: <Widget>[
          _buildTextField(),
          _buildButtonForSending(),
        ],
      ),
    );
  }

  Widget _buildTextField() {
    return Container(
      width: 300,
      child: const TextField(
        keyboardType: TextInputType.multiline,
        //maxLines: null,
        decoration: InputDecoration(
          hintText: 'Tapez un message ...',
          //border: InputBorder.none,
          border: OutlineInputBorder(),
          //contentPadding: EdgeInsets.symmetric(vertical: 40),
        ),
        maxLines: 10,
        minLines: 1,
      ),
    );
  }

  Widget _buildButtonForSending() {
    return Expanded(
      child: InkWell(
        onTap: () {
          print("Card bleue est touchée.");
        },
        child: Container(
          height: 65,
          color: Colors.blue,
          child: const Icon(
            Icons.arrow_forward,
            size: 40.0,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
