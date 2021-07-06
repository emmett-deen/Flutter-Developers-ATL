import 'package:dartz/dartz.dart' as dartz;
import 'package:flutter/material.dart';
import 'package:flutter_developers_atl/constants.dart';
import 'package:flutter_developers_atl/domain/errors/failure.dart';
import 'package:flutter_developers_atl/domain/models/meetup_event.dart';
import 'package:flutter_developers_atl/domain/services/meetup_service.dart';
import 'package:flutter_developers_atl/presentation/layouts/navigation_layout.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
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
                    child: FutureBuilder<dartz.Either<Failure, MeetupEvent>>(
                        future: MeetupService().nextEvent(),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            var data = snapshot.data!.fold((l) => l, (r) => r);
                            if (data is MeetupEvent) {
                              return HtmlWidget(data.htmlData);
                            } else {
                              return Center(
                                child: Icon(Icons.error),
                              );
                            }
                          } else {
                            return Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                        }),
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
