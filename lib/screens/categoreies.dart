import 'package:flutter/material.dart';

class Categoreies extends StatelessWidget {
  const Categoreies({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.black
              .withOpacity(0.8), // Semi-transparent black background
          body: const Center(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 50),
                    child: Text(
                      "Home",
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                      padding: EdgeInsets.only(top: 10),
                      child: Text(
                        "My List",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                        ),
                      )),
                  Padding(
                      padding: EdgeInsets.only(top: 10),
                      child: Text(
                        "Available for Download",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                        ),
                      )),
                  Padding(
                      padding: EdgeInsets.only(top: 10),
                      child: Text(
                        "Hindi",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                        ),
                      )),
                  Padding(
                      padding: EdgeInsets.only(top: 10),
                      child: Text(
                        "Malayalam",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                        ),
                      )),
                  Padding(
                      padding: EdgeInsets.only(top: 10),
                      child: Text(
                        "Tamil",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                        ),
                      )),
                  Padding(
                      padding: EdgeInsets.only(top: 10),
                      child: Text(
                        "Telugu",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                        ),
                      )),
                  Padding(
                      padding: EdgeInsets.only(top: 10),
                      child: Text(
                        "English",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                        ),
                      )),
                  Padding(
                      padding: EdgeInsets.only(top: 10),
                      child: Text(
                        "Action",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                        ),
                      )),
                ],
              ),
            ),
          ),
          bottomNavigationBar: CircleAvatar(
            radius: 40,
            child: ClipRRect(
              child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.cancel_outlined,
                    color: Colors.black,
                    size: 50,
                  )),
            ),
          )),
    );
  }
}
