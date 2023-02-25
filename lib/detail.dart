import 'package:flutter/material.dart';

class Detail extends StatelessWidget {
  final title;
  final subtitle;
  final isbn13;
  final price;
  final image;
  final url;

  Detail({this.title, this.subtitle, this.isbn13, this.price, this.image, this.url});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          image != null ? Image.network(image): Container(
            height: 250,
            color: Colors.grey[200],
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              children: <Widget>[
                Text(
                  '$title',
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                Text(
                  '$subtitle',
                  style: const TextStyle(fontStyle: FontStyle.italic),
                ),
                const SizedBox(height: 5),
                Text('$isbn13'),
                Divider(),
                Text('$price'),
                Text('$url')
              ],
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.close),
        onPressed: () => Navigator.pop(context),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
