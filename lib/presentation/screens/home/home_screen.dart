import 'package:flutter/material.dart';
import 'package:flutter_developers_atl/constants.dart';
import 'package:flutter_developers_atl/presentation/layouts/navigation_layout.dart';
import 'package:responsive_builder/responsive_builder.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return NavigationLayout(
        child: ScreenTypeLayout(
      mobile: _buildMobile(),
      tablet: _buildMobile(),
      desktop: _buildDesktop(),
    ));
  }

  Widget _buildDesktop() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        _buildHero(),
        Row(
          children: [
            Expanded(flex: 1, child: _buildWhatIsFDATL()),
            Expanded(flex: 1, child: _buildNextEvent()),
          ],
        ),
        _buildFeatures()
      ],
    );
  }

  Widget _buildMobile() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        _buildHero(),
        Row(
          children: [
            Expanded(flex: 1, child: _buildWhatIsFDATL()),
          ],
        ),
        Row(
          children: [
            Expanded(flex: 1, child: _buildNextEvent()),
          ],
        ),
        _buildFeatures()
      ],
    );
  }

  Widget _buildFeatures() {
    return Container(
      height: 400,
      width: MediaQuery.of(context).size.width,
      color: ACCENT,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Card(
            child: Container(
              width: 350,
              height: 350,
            ),
          ),
          Card(
            child: Container(
              width: 350,
              height: 350,
            ),
          ),
          Card(
            child: Container(
              width: 350,
              height: 350,
            ),
          ),
        ],
      ),
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
      height: 500,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Our Next Meetup',
                  style: Theme.of(context)
                      .textTheme
                      .headline5
                      ?.copyWith(color: OFF_WHITE),
                ),
              ),
              Container(
                constraints: BoxConstraints(minWidth: 150, maxWidth: 450),
                child: Card(
                  elevation: 4,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ListTile(
                          title: Text(
                              'Exploring Flutter and Why You Should Use It'),
                          subtitle: Text('JUL 15th, 2021 at 7:00 PM'),
                        ),
                        Divider(
                          thickness: 1,
                          color: GREY,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                              'In our inaugural meeting, we will be doing a broad overview of Flutter, it\'s capabilities/limitations, and special considerations. We will also watch a presentation of Flutter in action!'),
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildWhatIsFDATL() {
    return Container(
      height: 500,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: FlutterLogo(
                  size: 32,
                ),
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
                    style: Theme.of(context).textTheme.headline6,
                    textAlign: TextAlign.center,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
