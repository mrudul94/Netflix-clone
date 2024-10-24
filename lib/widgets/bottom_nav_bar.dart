import 'package:flutter/material.dart';
import 'package:netflix/screens/game_page.dart';
import 'package:netflix/screens/home_screen.dart';
import 'package:netflix/screens/new_and_hot.dart';
import 'package:netflix/widgets/categoreies.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 4,
      
        child: Scaffold(
          bottomNavigationBar: Container(
            color: Colors.black,
            height: 70,
            child: TabBar(
              
              tabs: [
                const Tab(icon: Icon(Icons.home), text: 'Home'),
                const Tab(
                  icon: Icon(Icons.games_sharp),
                  text: 'Games',
                ),
                const Tab(
                  icon: Icon(Icons.newspaper),
                  text: 'New & Hot',
                ),
                Tab(
                  child: Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(3),
                        child: Container(
                          color: Colors.amber,
                          width: 30,
                          height: 25,
                        ),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      const Text('My Netflix'),
                    ],
                  ),
                ),
              ],
              indicator: const BoxDecoration(),
              labelColor: Colors.white,
              labelStyle: const TextStyle(fontSize: 10),
              unselectedLabelColor: const Color(0xff999999),
            ),
          ),
          body: const TabBarView(children: [
            HomeScreen(),
            GamePage(),
            NewAndHot(),
            Categoreies()
          ]),
        ));
  }
}
