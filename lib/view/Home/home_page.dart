import 'package:auto_route/auto_route.dart';
import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import 'package:fb_note/core/constant/app-colors.dart';
import 'package:fb_note/view/Home/help_screen.dart';
import 'package:fb_note/view/Home/note_screen.dart';
import 'package:fb_note/view/Home/ocr_screen.dart';
import 'package:fb_note/view/Home/user_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

@RoutePage()
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  int currentIndex = 0;
  late TabController controller;
  List<DotNavigationBarItem> items = [
    /// Home
    DotNavigationBarItem(
      icon: const Icon(FontAwesomeIcons.clipboard),
      selectedColor: AppColors.orange,
    ),

    /// Likes
    DotNavigationBarItem(
      icon: const Icon(FontAwesomeIcons.fileImage),
      selectedColor: AppColors.orange,
    ),

    /// Search
    DotNavigationBarItem(
      icon: const Icon(FontAwesomeIcons.user),
      selectedColor: AppColors.orange,
    ),

    /// Profile
    DotNavigationBarItem(
      icon: const Icon(FontAwesomeIcons.circleQuestion),
      selectedColor: AppColors.orange,
    ),
  ];
  final List<Widget> children = [
    const NoteScreen(),
    const OCRScreen(),
    const UserScreen(),
    const HelpScreen(),
  ];
  @override
  void initState() {
    controller = TabController(length: 4, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: TabBarView(
        physics: const NeverScrollableScrollPhysics(),
        controller: controller,
        children: children,
      ),
      bottomNavigationBar: DotNavigationBar(
        // backgroundColor: Colors.grey[800],
        backgroundColor: Theme.of(context).hintColor,
        currentIndex: currentIndex,
        onTap: (i) {
          setState(() {
            controller.animateTo(i);
            currentIndex = i;
          });
        },
        dotIndicatorColor: Colors.transparent,
        items: items,
      ),
    );
  }
}
