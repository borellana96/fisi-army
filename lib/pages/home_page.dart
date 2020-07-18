import 'package:fisi_army/pages/detailPayment_page.dart';
import 'package:fisi_army/pages/tabs/ajustes.dart';
import 'package:fisi_army/pages/tabs/perfil.dart';
import 'package:fisi_army/states/login_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  TabController _controller;
  ScrollController _scrollViewController;

  @override
  void initState() {
    super.initState();
    DetailPage();
    _controller = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    _scrollViewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Flutter',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Image.asset(
            'assets/logounmsm.png',
            height: 45.0,
          ),
          actions: <Widget>[
            InkWell(
                onTap: () {
                  Provider.of<LoginState>(context).logout();
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Icon(Icons.exit_to_app),
                ))
          ],
          backgroundColor: Colors.indigo[900],
        ),
        body: Column(
          children: <Widget>[
            welcome()

            /*NestedScrollView(
              controller: _scrollViewController,
              headerSliverBuilder: (BuildContext context, bool boxIsScrolled) {
                return <Widget>[
                  SliverAppBar(
                    expandedHeight: 2.0, 
                    pinned: true, 
                    bottom: getTabBar()
                  )
                ];
              },
              body: getTabBarView(),
            )*/

            /*Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(120.0),
                child: Image.asset(
                  'assets/logounmsm.png',
                  height: 100,
                ),
              ),
            ),
            Container(
              child: Text("Hola Jorge, soy tu usuario"),
              height: 40,
            )*/
            ,
            Container(
              padding: EdgeInsets.all(15),
              child: getTabBar(),
            ),
            Expanded(
              child: getTabBarView(),
            ),
          ],
        ),
      ),
    );
  }

  Widget welcome() {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(120.0),
            child: Image.asset(
              'assets/logounmsm.png',
              height: 100,
            ),
          ),
        ),
        Container(
          child: Text("Hola Jorge, soy tu usuario"),
          height: 40,
        )
      ],
    );
  }

  TabBar getTabBar() {
    return TabBar(
      tabs: <Tab>[
        Tab(icon: Icon(Icons.person_pin)),
        Tab(icon: Icon(Icons.payment)),
        Tab(icon: Icon(Icons.settings)),
      ],
      controller: _controller,
      labelColor: Colors.black,
      unselectedLabelColor: Colors.black54,
    );
  }

  TabBarView getTabBarView() {
    return TabBarView(
      controller: _controller,
      children: <Widget>[PerfilWidget(), DetailPage(), AjustesWidget()],
    );
  }
}
