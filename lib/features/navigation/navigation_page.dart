import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

import '../../constants/color_value.dart';
import '../history/history_page.dart';
import '../home/screens/home_page.dart';
import '../home/widget/selected_item_widget.dart';

class NavigationPage extends StatefulWidget {
  const NavigationPage({Key? key}) : super(key: key);

  @override
  State<NavigationPage> createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  int changeTabPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawerEnableOpenDragGesture: false,
      backgroundColor: Colors.white70,
      appBar: AppBar(
        title: const TitleNavWidget(),
        leading: Builder(builder: (context) {
          return IconButton(
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
            icon: const Icon(Icons.menu),
          );
        }),
      ),
      drawer: SafeArea(
        child: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              const DrawerHeader(
                decoration: BoxDecoration(
                  color: ColorValue.primary,
                ),
                child: Text(
                  'Zuba Kasir',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              ),
              ListTile(
                leading: const Icon(Icons.home),
                title: const Text('Home'),
                onTap: () {
                  setState(() {
                    changeTabPage = 0;
                  });
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.history),
                title: const Text('History'),
                onTap: () {
                  setState(() {
                    changeTabPage = 1;
                  });
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.account_circle),
                title: const Text('Profile'),
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(Icons.settings),
                title: const Text('Settings'),
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
      body: _selectPage(changeTabPage),
    );
  }

  Widget _selectPage(int index) {
    switch (index) {
      case 0:
        return Padding(
          padding: const EdgeInsets.only(top: 10.0, left: 10),
          child: Row(
            children: const [
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(right: 10.0),
                  child: HomePage(),
                ),
              ),
              SelectedItemWidget(),
            ],
          ),
        );
      case 1:
        return const Historypage();
      default:
        {
          return const HomePage();
        }
    }
  }
}

class TitleNavWidget extends StatelessWidget {
  const TitleNavWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Row(
          children: [
            const Icon(
              Icons.account_circle,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'user name',
                    style: GoogleFonts.poppins(
                      fontSize: 5.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    'user Role',
                    style: GoogleFonts.poppins(
                      fontSize: 5.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            )
          ],
        )
      ],
    );
  }
}
