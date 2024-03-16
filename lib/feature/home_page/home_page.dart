import 'package:flutter/material.dart';

import '../../config/themes/app_colors.dart';
import '../settings_page/settings_tab.dart';
import '../todo_list_page/todo_list.dart';

class HomePage extends StatefulWidget {
  static const routeName = "Home_page";
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Widget> tabs = [
    const ToDoListTab(),
    const SettingTab(),
  ];
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.lightPrimaryColor,
        toolbarHeight: 160,
        title: Text(
          "To Do List",
          style: Theme.of(context).textTheme.labelLarge,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        shape: StadiumBorder(
          side: BorderSide(
            width: 4,
            color: AppColors.lightCardColor,
          ),
        ),
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: BottomAppBar(
        clipBehavior: Clip.none,
        padding: const EdgeInsets.all(1),
        height: 90,
        shape: const CircularNotchedRectangle(),
        notchMargin: 10,
        color: AppColors.lightCardColor,
        child: BottomNavigationBar(
          currentIndex: selectedIndex,
          onTap: (value) {
            selectedIndex = value;

            setState(() {});
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.list_outlined,
                color: Theme.of(context)
                    .bottomNavigationBarTheme
                    .selectedItemColor,
              ),
              label: "",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.settings,
                color: Theme.of(context)
                    .bottomNavigationBarTheme
                    .selectedItemColor,
              ),
              label: "",
            ),
          ],
        ),
      ),
      body: tabs[selectedIndex],
    );
  }
}
