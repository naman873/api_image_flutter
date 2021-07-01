import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SecondPage extends StatefulWidget {
  final word;
  SecondPage({this.word});
  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  //late Future<JsonDecode> getDataa;

  Future<dynamic> getData() async {
    var url = Uri.parse(
        'https://pixabay.com/api/?key=22317704-9478df6f2545c31dc1ed1d6c0&q=${widget.word}&image_type=photo');
    var response = await http.get(url);
    // if (response.statusCode == 200) {
    //   print(JsonDecode.fromJson(jsonDecode(response.body)));
    //   return JsonDecode.fromJson(jsonDecode(response.body));
    // } else {
    //   throw Exception('Failed to load album');
    // }
    return jsonDecode(response.body);
  }

  @override
  void initState() {
    super.initState();
    //getDataa = getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Sample Images',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: FutureBuilder(
        future: getData(),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(8),
                        child: Container(
                          child: InkWell(
                            child: Image.network(
                              '${snapshot.data['hits'][index]['largeImageURL']}',
                            ),
                          ),
                        ),
                      )
                    ],
                  );
                });
          }
          if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}

// class JsonDecode {
//   final hits;
//
//   JsonDecode({
//     required this.hits,
//   });
//
//   factory JsonDecode.fromJson(Map<String, dynamic> json) {
//     return JsonDecode(
//       hits: JsonDecode2.fromJson(json['hits'][0]),
//     );
//   }
// }
//
// class JsonDecode2 {
//   final imageUrl;
//
//   JsonDecode2({
//     required this.imageUrl,
//   });
//   factory JsonDecode2.fromJson(Map<String, dynamic> json) {
//     print(json['userImageURL']);
//     return JsonDecode2(imageUrl: json['userImageURL']);
//   }
// }
