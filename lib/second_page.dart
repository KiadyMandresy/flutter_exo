import 'package:flutter/material.dart';
import 'package:flutter_chat_bubble/chat_bubble.dart';

class skypekely extends StatefulWidget {
  const skypekely({super.key});

  @override
  State<skypekely> createState() => _SkypeKelyState();
}

class _SkypeKelyState extends State<skypekely> {

  List<String> messages = [];
  final TextEditingController _controller = TextEditingController();


  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("2 eme"),
      ),
      body: _corps(context),
    );
  }

  Widget _corps(BuildContext context) {
    return Center(child: _getDiscussion(context));
  }

  Widget _getDiscussion(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        _getTextDisplay(context),
        const SizedBox(
          height: 100,
          width: 50,
        ),
        _getSendingArea(),
      ],
    );
  }

  Widget _getTextDisplay(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.black,
            width: 2.0,
          ),
        ),
        child: _build(context)
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
      child: TextField(
        controller: _controller,
        keyboardType: TextInputType.multiline,
        decoration: const InputDecoration(
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

  String getTextFromTextField() {
    return _controller.text;
  }

  void _handleInkWellTap() {
    String text = getTextFromTextField();

    setState(() {;
      messages.add(text);
      _controller.clear();
    });
  }

  Widget _buildButtonForSending() {
    return Expanded(
      child: InkWell(
        onTap: _handleInkWellTap,
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


  Widget _build(BuildContext context) {
    return ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: messages.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            child:ChatBubble(
                clipper: ChatBubbleClipper1(type: BubbleType.sendBubble),
                alignment: Alignment.topRight,
                margin: EdgeInsets.only(top: 20),
                backGroundColor: Colors.blue,
                child: Container(
                  constraints: BoxConstraints(
                    maxWidth: MediaQuery.of(context).size.width * 0.7,
                  ),
                  child: Text(
                    messages[index],
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              )
          );
        }
    );
  }
}
