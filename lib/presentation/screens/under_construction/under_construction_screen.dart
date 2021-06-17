import 'package:flutter/material.dart';
import 'package:flutter_developers_atl/constants.dart';
import 'package:flutter_developers_atl/presentation/components/logo.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class UnderConstructionScreen extends StatefulWidget {
  UnderConstructionScreen({Key? key}) : super(key: key);

  @override
  _UnderConstructionScreenState createState() =>
      _UnderConstructionScreenState();
}

class _UnderConstructionScreenState extends State<UnderConstructionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Logo(
            color: PRIMARY,
            height: 64,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'COMING SOON',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 32.0),
            child: ElevatedButton.icon(
              style: ButtonStyle(
                  padding: MaterialStateProperty.all(
                      EdgeInsets.symmetric(horizontal: 24, vertical: 12))),
              icon: FaIcon(FontAwesomeIcons.github),
              label: Text('Contribute on GitHub'),
              onPressed: () {
                launch('https://github.com/emmett-deen/Flutter-Developers-ATL');
              },
            ),
          )
        ],
      ),
    );
  }
}
