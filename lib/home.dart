import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'detail.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List _posts = [];

  @override
  void initState() {
    super.initState();
    _getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('Hendra Witono BookStore'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: _posts.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: SizedBox(
              height:70,
              width: 70,
              child: _posts[index]['image'] != null
                  ? Image.network(_posts[index]['image'],width:70,fit: BoxFit.cover,)
                  : const Center(),
            ),
            title: Text(
              '${_posts[index]['title']}',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            subtitle: Text(
              '${_posts[index]['subtitle']}',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (c) => Detail(
                title:_posts[index]['title'],
                subtitle:_posts[index]['subtitle'],
                isbn13:_posts[index]['isbn13'],
                price:_posts[index]['price'],
                image:_posts[index]['image'],
              )
              )
              );
            },
          );
        },
      ),

      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xFF1D212B),
        unselectedItemColor: Colors.white,
        selectedItemColor: Colors.red,
        items: const [
          BottomNavigationBarItem(
            backgroundColor: Color(0xFF1D212B),
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.library_books),
            label: 'My Library',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'My Favorite',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );

  }

  Future _getData() async {
    try {
      final response =
          await http.get(Uri.parse('https://api.itbook.store/1.0/new'));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        setState(() {
          _posts = data['books'];
        });
      }
    } catch (e) {
      print(e);
    }
  }
}


