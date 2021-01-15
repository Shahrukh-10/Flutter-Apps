import 'package:auth_ui/components/LeagueContainer.dart';
import 'package:flutter/material.dart';

import 'tableScreen.dart';

class Body extends StatefulWidget {
  @override
  _Body createState() => _Body();
}

class _Body extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: ListView(
            children: [
              SizedBox(
                height: 20,
              ),
              Text(
                'Competitions',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              GridView.count(
                shrinkWrap: true,
                crossAxisCount: 2,
                crossAxisSpacing: 15,
                mainAxisSpacing: 15,
                children: [
                  GestureDetector(
                    child: LeagueContainer(image: 'assets/images/pl.png'),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => TableScreen(code: 'PL'),
                          ));
                    },
                  ),
                  GestureDetector(
                    child: LeagueContainer(image: 'assets/images/laliga.png'),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => TableScreen(code: 'PD'),
                          ));
                    },
                  ),
                  GestureDetector(
                    child: LeagueContainer(image: 'assets/images/bundesliga.png'),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => TableScreen(code: 'BL1'),
                          ));
                    },
                  ),
                  GestureDetector(
                    child: LeagueContainer(image: 'assets/images/seria.png'),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => TableScreen(code: 'SA'),
                          ));
                    },
                  ),
                  GestureDetector(
                    child: LeagueContainer(image: 'assets/images/ligue1.png'),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => TableScreen(code: 'FL1'),
                          ));
                    },
                  ),
                  GestureDetector(
                    child: LeagueContainer(image: 'assets/images/nos.png'),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => TableScreen(code: 'PPL'),
                          ));
                    },
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}