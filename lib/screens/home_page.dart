import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:marvel_wallpapers/screens/set_wallpaper_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _firestore = FirebaseFirestore.instance;
  final List<String> _images = [];
  dynamic except;

  void getImages() async {
    try {
      await _firestore
          .collection('wallpapers')
          .get()
          .then((QuerySnapshot querySnapshot) {
        for (var doc in querySnapshot.docs) {
          _images.add(doc["url"]);
        }
      });
      //print(_images.length);
    } catch (e) {
      except = e;
    }
  }

  @override
  void initState() {
    super.initState();
    getImages();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Avengers Assemble',
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: _images.isEmpty
          ? Center(
              child: Container(
                color: Colors.white10,
                child: GestureDetector(
                  onTap: () {
                    setState(() {});
                  },
                  child: const Text(
                    'Load',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0,
                        color: Colors.white),
                  ),
                ),
              ),
            )
          : GridView.builder(
              itemCount: _images.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
                crossAxisCount: 2,
                childAspectRatio: 2 / 3,
              ),
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => FullScreen(
                          imageUrl: _images[index],
                        ),
                      ),
                    );
                  },
                  child: Container(
                    color: Colors.white10,
                    child: Image.network(
                      _images[index],
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              }),
    );
  }
}
