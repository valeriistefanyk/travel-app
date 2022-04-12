import 'package:flutter/material.dart';
import 'navscreens/home_screen.dart';
import 'navscreens/bar_item_screen.dart';
import 'navscreens/search_screen.dart';
import 'navscreens/user_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List pages = [
    const HomeScreen(),
    const BarItemScreen(),
    const SearchScreen(),
    const UserScreen(),
  ];

  int currentIndex = 0;

  void onTap(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: onTap,
        selectedItemColor: Colors.black54,
        unselectedItemColor: Colors.grey.withOpacity(0.5),
        showUnselectedLabels: false,
        showSelectedLabels: false,
        elevation: 0,
        items: const [
          BottomNavigationBarItem(
            label: "Головна",
            icon: Icon(Icons.apps),
          ),
          BottomNavigationBarItem(
            label: "Статистика",
            icon: Icon(Icons.bar_chart_sharp),
          ),
          BottomNavigationBarItem(
            label: "Пошук",
            icon: Icon(Icons.search),
          ),
          BottomNavigationBarItem(
            label: "Акаунт",
            icon: Icon(Icons.person),
          ),
        ],
      ),
    );
  }
}
