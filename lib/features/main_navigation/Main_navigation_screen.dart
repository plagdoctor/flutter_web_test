import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
// import 'package:line_icons/line_icons.dart';
import 'package:tiktok_challenge/constants/Sizes.dart';
import 'package:tiktok_challenge/features/activity/activity_screen.dart';
import 'package:tiktok_challenge/features/main_navigation/Stf_screen.dart';
import 'package:tiktok_challenge/features/main_navigation/Write_screen.dart';
import 'package:tiktok_challenge/features/main_navigation/widgets/nav_tab.dart';
import 'package:tiktok_challenge/features/profile/profile_screen.dart';
import 'package:tiktok_challenge/features/search/search_screen.dart';
import 'package:tiktok_challenge/home/home_screen.dart';
import 'package:tiktok_challenge/util/utils.dart';

class MainNavigationScreen extends StatefulWidget {
  static const String routeName = "mainNavigation";
  final String tab;

  const MainNavigationScreen({
    super.key,
    required this.tab,
  });

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  final List<String> _tabs = [
    "home",
    "discover",
    "xxxx",
    "inbox",
    "profile",
  ];

  late int _selectedIndex = _tabs.indexOf(widget.tab);

  void _onTap(int index) {
    context.push("/${_tabs[index]}");
    setState(() {
      _selectedIndex = index;
    });
  }

  void _onWriteTap(BuildContext context) async {
    await showModalBottomSheet(
        // showDragHandle: true,

        isScrollControlled: true,
        context: context,
        backgroundColor: isDarkMode(context) ? null : Colors.transparent,
        builder: (context) => const WriteScreen());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Offstage(
            offstage: _selectedIndex != 0,
            child: const HomeScreen(),
          ),
          Offstage(offstage: _selectedIndex != 1, child: const SearchScreen()),
          Offstage(
            offstage: _selectedIndex != 2,
            child: const StfScreen(
              nameTap: "write",
            ),
          ),
          Offstage(
              offstage: _selectedIndex != 3, child: const ActivityScreen()),
          Offstage(
            offstage: _selectedIndex != 4,
            child: const ProfileScreen(),
          )
        ],
      ),
      bottomNavigationBar: Container(
        // color: isDarkMode(context) ? null : Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(Sizes.size12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              NavTab(
                text: "Home",
                isSelected: _selectedIndex == 0,
                icon: FontAwesomeIcons.house,
                selectedIcon: FontAwesomeIcons.house,
                onTap: () => _onTap(0),
              ),
              NavTab(
                text: "Discover",
                isSelected: _selectedIndex == 1,
                icon: FontAwesomeIcons.magnifyingGlass,
                selectedIcon: FontAwesomeIcons.magnifyingGlass,
                onTap: () => _onTap(1),
              ),
              NavTab(
                text: "write",
                isSelected: _selectedIndex == 2,
                icon: FontAwesomeIcons.penToSquare,
                selectedIcon: FontAwesomeIcons.penToSquare,
                onTap: () => _onWriteTap(context),
              ),
              NavTab(
                text: "Inbox",
                isSelected: _selectedIndex == 3,
                icon: FontAwesomeIcons.heart,
                selectedIcon: FontAwesomeIcons.heart,
                onTap: () => _onTap(3),
              ),
              NavTab(
                text: "Profile",
                isSelected: _selectedIndex == 4,
                icon: FontAwesomeIcons.user,
                selectedIcon: FontAwesomeIcons.solidUser,
                onTap: () => _onTap(4),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
