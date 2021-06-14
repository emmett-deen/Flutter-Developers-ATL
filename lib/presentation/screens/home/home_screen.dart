import 'package:flutter/material.dart';
import 'package:flutter_developers_atl/presentation/layouts/navigation_layout.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return NavigationLayout(
      child: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Center(
      child: Text('Home'),
    );
  }
}
