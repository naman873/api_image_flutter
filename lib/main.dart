import 'package:flutter/material.dart';
import 'package:image_appi_samplee/second_page.dart';

void main() {
  runApp(
    MaterialApp(
      home: MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TextEditingController txtCont = TextEditingController();
  String errorTxt = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Test Api App',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.fingerprint_sharp,
              size: 80,
              color: Colors.pink,
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                textAlign: TextAlign.center,
                focusNode: FocusNode(canRequestFocus: false),
                controller: txtCont,
                decoration: new InputDecoration(
                    border: new OutlineInputBorder(
                      borderRadius: const BorderRadius.all(
                        const Radius.circular(30.0),
                      ),
                    ),
                    filled: true,
                    hintStyle: new TextStyle(color: Colors.grey[800]),
                    hintText: "Enter Image Name",
                    fillColor: Colors.white70,
                    errorText: errorTxt),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return SecondPage(
                        word: txtCont.value.text,
                      );
                    },
                  ),
                );
              },
              child: Text('Search'),
            ),
          ],
        ),
      ),
    );
  }
}
