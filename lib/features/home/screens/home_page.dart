import 'package:flutter/material.dart';
import 'package:zuba_karis/features/home/widget/menu_grid_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late TabController _tabController;
  List<String> tabItem = [
    "Makanan",
    "Coffe",
    "Squash",
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: tabItem.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 0,
        bottom: TabBar(
          controller: _tabController,
          tabs: List.generate(
            tabItem.length,
            (index) => Tab(
              text: tabItem[index],
            ),
          ),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          const MakananTab(),
          CoffeTab(),
          SquahTab()
        ],
      ),
    );
  }
}

class SquahTab extends StatelessWidget {
  const SquahTab({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MenuGridWidget();
  }
}

class CoffeTab extends StatelessWidget {
  const CoffeTab({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MenuGridWidget();
  }
}

class MakananTab extends StatelessWidget {
  const MakananTab({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MenuGridWidget();
  }
}
