import 'package:flutter/material.dart';
import 'package:pos/components/appcolors.dart';
import 'package:pos/presentation/screens/history_screen.dart';
import 'package:pos/presentation/screens/home_screen.dart';
import 'package:pos/presentation/screens/settings_screen.dart';
import 'package:pos/presentation/screens/ticket_screen.dart';
import 'package:pos/components/assets_const.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int posisiSaatIni = 0;
  List screen = [
    const HomeScreen(),
    const TicketScreen(),
    const HistoryScreen(),
    const SettingsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Main Screen"),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart, color: Colors.blue),
            onPressed: () {
              Navigator.pushNamed(context, '/ticket');
            },
          ),
        ],
      ),
      body: screen[posisiSaatIni],
      bottomNavigationBar: BottomNavigationBar(
        mouseCursor: MouseCursor.defer,
        unselectedItemColor: AppColor.second,
        selectedItemColor: AppColor.first,
        currentIndex: posisiSaatIni,
        onTap: (index) {
          setState(() {
            posisiSaatIni = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Image.asset(AssetsConst.fromLogoHomeGrey),
            activeIcon: Image.asset(AssetsConst.fromLogoHomeBlue),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(AssetsConst.fromLogoTicketGrey),
            activeIcon: Image.asset(AssetsConst.fromLogoTicketBlue),
            label: 'Ticket',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(AssetsConst.fromLogoHistoryGrey),
            activeIcon: Image.asset(AssetsConst.fromLogoHistoryBlue),
            label: 'History',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(AssetsConst.fromLogoSettingsGrey),
            activeIcon: Image.asset(AssetsConst.fromLogoSettingsBlue),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}
