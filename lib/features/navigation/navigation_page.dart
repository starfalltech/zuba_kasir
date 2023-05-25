import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

import '../../core/constants/color_value.dart';
import '../add_menu/presentation/pages/add_menu_page.dart';
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
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: changeTabPage == 0 ? const TitleNavWidget() : const SizedBox(),
      ),
      body: _selectPage(changeTabPage),
      drawer: Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text('Drawer Header'),
            ),
            ListTile(
              title: Row(
                children: const [
                  Text('Home'),
                  SizedBox(
                    width: 10,
                  ),
                  Icon(Icons.home, size: 16),
                ],
              ),
              onTap: () {
                setState(() {
                  changeTabPage = 0;
                });
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Row(
                children: const [
                  Text('History'),
                  SizedBox(
                    width: 10,
                  ),
                  Icon(Icons.menu_book, size: 16),
                ],
              ),
              onTap: () {
                setState(() {
                  changeTabPage = 1;
                });
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Row(
                children: const [
                  Text('Logout'),
                  SizedBox(
                    width: 10,
                  ),
                  Icon(Icons.logout, size: 16),
                ],
              ),
              onTap: () {
                setState(() {
                  changeTabPage = 1;
                });
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _selectPage(int index) {
    switch (index) {
      case 0:
        return Row(
          children: const [
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(right: 10.0),
                child: HomePage(),
              ),
            ),
            SelectedItemWidget(),
          ],
        );
      case 1:
        return const Historypage();
      default:
        return const HomePage();
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
        ),
        const Spacer(),
        InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AddMenupage(),
                ),
              );
            },
            child: Row(
              children: [
                Text(
                  "Add Menu",
                  style: GoogleFonts.quicksand(fontSize: 7.sp),
                ),
                Icon(
                  Icons.add,
                  size: 13.sp,
                )
              ],
            )),
      ],
    );
  }
}
