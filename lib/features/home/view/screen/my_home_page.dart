import 'package:animoo_app/core/style/app_colors.dart';
import 'package:animoo_app/features/animal/view/screen/animal_screen.dart';
import 'package:animoo_app/features/category/view/screen/category_screen.dart';
import 'package:animoo_app/features/home/view/screen/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
  static const String routeName = '/main';

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;
  final List<Widget> _pages = [
    HomeScreen(),
    Center(child: Text('Search Page')),
    CategoryScreen(),
    AnimalScreen(),
    Center(child: Text('Me Page')),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: _pages,
      ),
      bottomNavigationBar: bottomNavigatorBar(),
    );
  }


  BottomNavigationBar bottomNavigatorBar() {
    return BottomNavigationBar(
      currentIndex: _selectedIndex,
      onTap: (index) {
        setState(() {
          _selectedIndex = index;
        });
      },
      type: BottomNavigationBarType.shifting,
      selectedItemColor: AppColors.kprimaryColor,
      unselectedItemColor: AppColors.kunselectedItemColor,
      elevation: 0,

      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home_outlined),
          label: "Home",
          

        ),
        BottomNavigationBarItem(
          icon: Icon(CupertinoIcons.search),
          label: "Search",
        ),
        BottomNavigationBarItem(
          icon: Icon(CupertinoIcons.number),
          label: "Category",

        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite_border),
          label: "animals",
          
        ),

        BottomNavigationBarItem(
          icon: Icon(CupertinoIcons.profile_circled),
          label: "Me",
        ),
      ],
    );
  
}
}