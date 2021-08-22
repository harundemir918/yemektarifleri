import 'package:flutter/material.dart';

import '../account/account_view.dart';
import '../add_recipe/add_recipe_view.dart';
import '../recipes/recipes_list_view.dart';

class HomeView extends StatefulWidget {
  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int _currentIndex = 0;

  final List<Widget> _pageList = [
    RecipesListView(),
    AddRecipeView(),
    AccountView(),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: 3,
      vsync: this,
      initialIndex: _currentIndex,
    );
    _tabController.addListener(() {});
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: Container(
              child: _pageList.elementAt(_currentIndex),
            ),
          ),
        ),
      ),
      bottomNavigationBar: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(0),
        ),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        margin: EdgeInsets.all(0),
        color: Colors.white,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 4),
          child: TabBar(
            onTap: (val) {
              setState(() {
                _currentIndex = val;
              });
            },
            indicatorColor: Colors.transparent,
            indicatorSize: TabBarIndicatorSize.tab,
            indicatorWeight: 1,
            unselectedLabelColor: Colors.grey[600],
            labelColor: Colors.deepOrange[500],
            tabs: [
              Tab(icon: Icon(Icons.home)),
              Tab(icon: Icon(Icons.add_box)),
              Tab(icon: Icon(Icons.person)),
            ],
            controller: _tabController,
          ),
        ),
      ),
    );
  }
}
