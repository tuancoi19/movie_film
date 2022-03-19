import 'package:flutter/material.dart';
import 'popular.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "Comfortaa",
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {
  TabController? _controller;

  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 4, vsync: this);
  }

  _tabBar() {
    return TabBar(
      controller: _controller,
      labelStyle: const TextStyle(
        fontFamily: "Comfortaa",
        fontSize: 24,
        fontWeight: FontWeight.bold),
      tabs: const [
        Text("Popular"),
        Text("NowPlaying"),
        Text("Up Coming"),
        Text("Top Rate")
      ],
      padding: const EdgeInsets.only(top: 71, left: 25),
      indicatorColor: Colors.black,
      indicatorPadding: const EdgeInsets.symmetric(horizontal: 10),
      labelPadding: const EdgeInsets.symmetric(horizontal: 13, vertical: 2),
      labelColor: Colors.black,
      unselectedLabelColor: Colors.black.withOpacity(0.5),
      isScrollable: true
    );
  }

  _tabBarview() {
    return TabBarView(
      controller: _controller,
      children: [
        const PopularView(),
        Container(
          color: Colors.blue
        ),
        Container(
          color: Colors.red
        ),
        Container(
          color: Colors.orange
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        bottom: _tabBar()
      ),
      body: _tabBarview()
    );
  }
}



