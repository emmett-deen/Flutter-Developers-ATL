import 'package:flutter/material.dart';
import 'package:flutter_developers_atl/constants.dart';
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
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        _buildHero(),
        _buildWhatIsFDATL(),
        _buildNextEvent(),
      ],
    );
  }

  Widget _buildHero() {
    return AspectRatio(
      aspectRatio: 2.5,
      child: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/hero.png'),
                fit: BoxFit.cover)),
      ),
    );
  }

  Widget _buildNextEvent() {
    return Container(
      color: GREY,
      height: 150,
    );
  }

  Widget _buildWhatIsFDATL() {
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 16.0),
            child: FlutterLogo(size: 32,),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'What is Flutter Developers ATL?',
                style: Theme.of(context).textTheme.headline5,
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
                constraints: BoxConstraints(minWidth: 150, maxWidth: 450),
                child: Text(
                    'FDATL is a monthly meetup for all things Flutter. While FDATL is welcoming to beginners we also cover advanced topics for more experienced Flutter developers. Make sure to check out our next event to learn something new and meet other like-minded Flutter developers. We can\'t wait to see you there!',
                    style: Theme.of(context).textTheme.headline6, textAlign: TextAlign.center,),),
          )
        ],
      ),
    );
  }
}
