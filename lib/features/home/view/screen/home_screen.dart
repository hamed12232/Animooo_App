import 'package:animoo_app/core/spacing/vertical_space.dart';
import 'package:animoo_app/core/style/app_colors.dart';
import 'package:animoo_app/core/style/app_height.dart';
import 'package:animoo_app/features/home/view/widget/category_section_header.dart';
import 'package:animoo_app/features/home/view/widget/custom_app_bar_home_screen.dart';
import 'package:animoo_app/features/home/view/widget/custom_list_view_seperator_categories.dart';
import 'package:animoo_app/features/home/view/widget/petCard_list_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static const String routeName = '/home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kbackGroungColor,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                CustomAppBarHomeScreen(),
                VerticalSpace(height: AppHeight.h20),
                CategorySectionHeader(headerName: "Categories ( 10 )"),
                VerticalSpace(height: AppHeight.h20),
                CustomListViewSeperatorCategories(),
                VerticalSpace(height: AppHeight.h20),
                CategorySectionHeader(headerName: "All Animal ( 10 )"),
                VerticalSpace(height: AppHeight.h11),
                PetCardListView(),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
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
      ),
    );
  }
}
