import 'package:flutter/material.dart';
import 'package:mvvm_movie_app/core/app_route_path.dart';
import 'package:mvvm_movie_app/presentation/home/now_playing/now_playing_screen.dart';
import 'package:mvvm_movie_app/presentation/home/popular/popular_screen.dart';
import 'package:mvvm_movie_app/presentation/home/top_rated/top_rated_screen.dart';
import 'package:mvvm_movie_app/presentation/home/up_coming/up_coming_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  static final List<Widget> _pages = [
    const NowPlayingScreen(),
    const PopularScreen(),
    const TopRatedScreen(),
    const UpComingScreen()
  ];

  int _selectedIndex = 0;

  void _updateState(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter Movie App"),
        actions: [
          IconButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: const Text('Coming soon... Insyaallah!'),
                  action: SnackBarAction(
                    label: 'Close',
                    onPressed: () {
                      // Code to execute.
                    },
                  ),
                ),
              );
            },
            icon: Icon(
              Icons.favorite,
            ),
          ),
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, AppRoutePath.about);
            },
            icon: Icon(
              Icons.info,
            ),
          )
        ],
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        iconSize: 24.0,
        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
        currentIndex: _selectedIndex,
        onTap: _updateState,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.ac_unit),
            label: "Now Playing",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.ac_unit),
            label: "Popular",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.ac_unit),
            label: "Top Rated",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.ac_unit),
            label: "Up Coming",
          ),
        ],
      ),
    );
  }
}
