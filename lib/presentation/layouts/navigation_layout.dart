import 'package:flutter/material.dart';
import 'package:flutter_developers_atl/constants.dart';
import 'package:flutter_developers_atl/presentation/components/footer.dart';
import 'package:flutter_developers_atl/presentation/components/logo.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:url_launcher/url_launcher.dart';

class NavigationLayout extends StatefulWidget {
  final Widget child;

  NavigationLayout({Key? key, required this.child}) : super(key: key);

  @override
  _NavigationLayoutState createState() => _NavigationLayoutState();
}

class _NavigationLayoutState extends State<NavigationLayout> {
  final List<_NavigationItem> navItems = [
    // _NavigationItem(title: 'Events', route: '/events'),
    // _NavigationItem(title: 'Resources', route: '/resources'),
    _NavigationItem(title: 'Source Code', route: '/source-code'),
    _NavigationItem(title: 'Feedback', route: '/feedback'),
    // _NavigationItem(title: 'Jobs', route: '/jobs'),
  ];

  @override
  Widget build(BuildContext context) {
    var deviceType = getDeviceType(
      MediaQuery.of(context).size,
    );

    return Scaffold(
      appBar: _buildAppBar(),
      body: ListView(
        children: [widget.child, Footer()],
      ),
      drawer: deviceType != DeviceScreenType.desktop ? _buildDrawer() : null,
    );
  }

  PreferredSize _buildAppBar() {
    return PreferredSize(
      preferredSize: Size(MediaQuery.of(context).size.width, kToolbarHeight),
      child: ScreenTypeLayout.builder(
        mobile: _buildMobileAppBar,
        tablet: _buildMobileAppBar,
        desktop: _buildDesktopAppBar,
      ),
    );
  }

  Widget _buildMobileAppBar(BuildContext context) {
    return AppBar(
      title: Logo(
        color: PRIMARY,
      ),
      centerTitle: true,
    );
  }

  Widget _buildDesktopAppBar(BuildContext context) {
    return AppBar(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Logo(
            color: PRIMARY,
          ),
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
                _handleNavItem(navItems[index]);
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
          DrawerHeader(
              padding: EdgeInsets.zero,
              child: Container(
                  color: PRIMARY,
                  child: Center(
                    child: Logo(
                      color: OFF_WHITE,
                    ),
                  ))),
          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: navItems.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(navItems[index].title),
                onTap: () {
                  _handleNavItem(navItems[index]);
                },
              );
            },
          )
        ],
      ),
    );
  }

  void _handleNavItem(_NavigationItem item) {
    if (item.route == '/source-code') {
      launchUrl(Uri.parse('https://github.com/emmett-deen/Flutter-Developers-ATL'));
    }else if(item.route == '/feedback'){
      launchUrl(Uri.parse('https://forms.gle/d5eAkA7E1mgTquZGA'));
    } else {
      Navigator.of(context).pushNamed(item.route);
    }
  }
}

class _NavigationItem {
  final String title;
  final String route;

  _NavigationItem({required this.title, required this.route});
}
