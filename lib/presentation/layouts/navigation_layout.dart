import 'package:flutter/material.dart';
import 'package:flutter_developers_atl/presentation/components/logo.dart';
import 'package:responsive_builder/responsive_builder.dart';

class NavigationLayout extends StatefulWidget {
  final Widget? child;

  NavigationLayout({Key? key, this.child}) : super(key: key);

  @override
  _NavigationLayoutState createState() => _NavigationLayoutState();
}

class _NavigationLayoutState extends State<NavigationLayout> {
  final List<_NavigationItem> navItems = [
    _NavigationItem(title: 'Events', route: '/events'),
    _NavigationItem(title: 'Resources', route: '/resources'),
    _NavigationItem(title: 'Source Code', route: '/source-code'),
    _NavigationItem(title: 'Jobs', route: '/jobs'),
  ];

  @override
  Widget build(BuildContext context) {
    var deviceType = getDeviceType(
      MediaQuery.of(context).size,
    );

    return Scaffold(
      appBar: _buildAppBar(),
      body: widget.child,
      drawer: deviceType != DeviceScreenType.desktop ? _buildDrawer() : null,
    );
  }

  PreferredSize _buildAppBar() {
    return PreferredSize(
      preferredSize: Size(MediaQuery.of(context).size.width, kToolbarHeight),
      child: ScreenTypeLayout(
        mobile: _buildMobileAppBar(),
        tablet: _buildMobileAppBar(),
        desktop: _buildDesktopAppBar(),
      ),
    );
  }

  Widget _buildMobileAppBar() {
    return AppBar(
      title: Logo(),
      centerTitle: true,
    );
  }

  Widget _buildDesktopAppBar() {
    return AppBar(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Logo(),
          _buildRowNav(),
        ],
      ),
      automaticallyImplyLeading: false,
    );
  }

  Widget _buildRowNav() {
    return Container(
      height: 24,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: navItems.length,
        itemBuilder: (context, index) {
          return Container(
            child: TextButton(
              onPressed: () {
                Navigator.of(context).pushNamed(navItems[index].route);
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(navItems[index].title),
              ),
            ),
          );
        },
      ),
    );
  }

  Drawer _buildDrawer() {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(child: Text('Menu')),
          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: navItems.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(navItems[index].title),
                onTap: () {
                  Navigator.of(context).pushNamed(navItems[index].route);
                },
              );
            },
          )
        ],
      ),
    );
  }
}

class _NavigationItem {
  final String title;
  final String route;

  _NavigationItem({required this.title, required this.route});
}
