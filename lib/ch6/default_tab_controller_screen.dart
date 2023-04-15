import 'package:flutter/material.dart';

class DefaultTabControllerScreen extends StatefulWidget {
  const DefaultTabControllerScreen({Key? key}) : super(key: key);

  @override
  State<DefaultTabControllerScreen> createState() =>
      _DefaultTabControllerScreenState();
}

class _DefaultTabControllerScreenState extends State<DefaultTabControllerScreen>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("DefaultTabControllerScreen"),
      ),
      body: DefaultTabController(
        length: 3,
        child: Column(
          children: [
            _tabBar(),
            SizedBox(
              height: 250,
              child: _tabBarView(),
            ),
            Row(
              children: [
                ElevatedButton(
                  onPressed: () {
                    tabController.index = 2;
                  },
                  child: Text("이동"),
                ),
                ElevatedButton(onPressed: () {
                  tabController.animateTo(2);
                }, child: Text("이동 애니메이션"))
              ],
            )
          ],
        ),
      ),
    );
  }

  TabBar _tabBar() {
    return TabBar(
      controller: tabController,
      labelColor: Colors.black,
      indicatorWeight: 10,
      indicatorColor: Colors.black,
      tabs: const [
        Tab(text: "탭 1"),
        Tab(text: "탭 2"),
        Tab(text: "탭 3"),
      ],
    );
  }

  TabBarView _tabBarView() {
    return TabBarView(
      viewportFraction: 0.9,
      controller: tabController,
      children: [
        Container(
          color: Colors.red,
          margin: const EdgeInsets.symmetric(horizontal: 5),
        ),
        Container(
          color: Colors.blue,
          margin: const EdgeInsets.symmetric(horizontal: 5),
        ),
        Container(
          color: Colors.green,
          margin: const EdgeInsets.symmetric(horizontal: 5),
        ),
      ],
    );
  }
}
