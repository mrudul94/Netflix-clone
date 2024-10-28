import 'package:flutter/material.dart';

class Download extends StatelessWidget {
  const Download({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        title: const Text(
          'Downloads',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(
              Icons.search,
              color: Colors.white,
              size: 30,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(
              Icons.menu,
              color: Colors.white,
              size: 30,
            ),
          )
        ],
      ),
      body: const Column(
        children: [
          SizedBox(
            height: 150,
          ),
          Center(
              child: Icon(
            Icons.download_for_offline,
            color: Color.fromARGB(255, 64, 64, 64),
            size: 200,
          )),
          Text(
            'Movies and TV shows that you\n     download appear here.',
            style: TextStyle(
                fontSize: 20, color: Color.fromARGB(255, 144, 142, 142)),
          ),
        ],
      ),
    );
  }
}
