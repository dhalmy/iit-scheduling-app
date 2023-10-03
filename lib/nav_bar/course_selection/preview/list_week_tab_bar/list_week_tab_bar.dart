import 'package:flutter/material.dart';

class ListWeekTabBar extends StatefulWidget {
  const ListWeekTabBar({Key? key}) : super(key: key);

  @override
  State<ListWeekTabBar> createState() => _ListWeekTabBarState();
}

class _ListWeekTabBarState extends State<ListWeekTabBar>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.85,
      child: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).size.height * 0.025,),
          Container(
            width: MediaQuery.of(context).size.width * 0.25,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(
                12.0,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TabBar(
                controller: _tabController,
                // give the indicator a decoration (color and border radius)
                indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    12.0,
                  ),
                  color: const Color(0xFF00BD90),
                ),
                labelColor: Colors.white,
                unselectedLabelColor: Colors.black,
                tabs: const [
                  // first tab [you can add an icon using the icon property]
                  Tab(
                    text: 'List',
                  ),

                  // second tab [you can add an icon using the icon property]
                  Tab(
                    text: 'Week',
                  ),
                ],
              ),
            ),
          ),
          // tab bar view here
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: const [
                // first tab bar view widget
                Center(
                  child: Text(
                    'List',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),

                // second tab bar view widget
                Center(
                  child: Text(
                    'Week',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}