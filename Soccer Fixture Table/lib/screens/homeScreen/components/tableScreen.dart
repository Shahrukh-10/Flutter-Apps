import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:http/http.dart' as http;

class TableScreen extends StatefulWidget {
  final String code;

  const TableScreen({Key key, this.code}) : super(key: key);
  @override
  _TableScreenState createState() => _TableScreenState();
}

class _TableScreenState extends State<TableScreen> {
  List _table;

  getTable() async {
    http.Response response = await http.get(
        'http://api.football-data.org/v2/competitions/${widget.code}/standings',
        headers: {'X-Auth-Token': 'fc30ef42ba374357af0ae589bf987167'});
    String body = response.body;
    Map data = jsonDecode(body);
    List table = data['standings'][0]['table'];
    setState(() {
      _table = table;
    });
  }

  Widget buildTable() {
    List<Widget> teams = [];
    for (var team in _table) {
      teams.add(
        Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            children: [
              Expanded(
                child: Row(
                  children: [
                    team['position'].toString().length > 1
                        ? Text(team['position'].toString() + ' - ',
                        style: TextStyle(
                          color: Colors.white,
                        ) )
                        : Text(" " + team['position'].toString() + ' - ',
                        style: TextStyle(
                          color: Colors.white,
                        ) ),
                    Row(
                      children: [
                        SvgPicture.network(
                          team['team']['crestUrl'],
                          height: 30,
                          width: 30,
                        ),
                        team['team']['name'].toString().length > 11
                            ? Text(team['team']['name']
                            .toString()
                            .substring(0, 11) +
                            '...',
                            style: TextStyle(
                              color: Colors.white,
                            ) )
                            : Text(team['team']['name'].toString(),
                            style: TextStyle(
                              color: Colors.white,
                            ) ),
                      ],
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(team['playedGames'].toString(),
                      style: TextStyle(
                        color: Colors.white,
                      ) ,),
                    Text(team['won'].toString()
                    ,style: TextStyle(
                          color: Colors.white,
                        ) ),
                    Text(team['draw'].toString(),
                        style: TextStyle(
                          color: Colors.white,
                        ) ),
                    Text(team['lost'].toString()
                    ,style: TextStyle(
                          color: Colors.white,
                        )
                    ),
                    Text(team['goalDifference'].toString(),
                        style: TextStyle(
                          color: Colors.white,
                        ) ),
                    Text(team['points'].toString(),
                        style: TextStyle(
                          color: Colors.white,
                        ) ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    }
    return Column(
      children: teams,
    );
  }

  @override
  void initState() {
    super.initState();
    getTable();
  }
  @override
  Widget build(BuildContext context) {
    return _table == null ?
        Container(
          color: Colors.grey[900],
          child: Center(
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(
                Colors.white
              ),
            ),
          ),
        )
        : Scaffold(
      body: Container(
        color: Colors.grey[900],

          child: ListView(
            physics: const BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics()),
              children: [
                SizedBox(
                  height: 20,
                ),
                Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                  child: Row(
                    children: [
                      Expanded(
                        child: Row(
                          children: [
                            Text(
                              'POS',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Text(
                              'Club',
                              style: TextStyle(fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'PL',
                              style: TextStyle(fontWeight: FontWeight.bold,
                                color: Colors.white,),
                            ),
                            Text(
                              'W',
                              style: TextStyle(fontWeight: FontWeight.bold,
                                color: Colors.white,),
                            ),
                            Text(
                              'D',
                              style: TextStyle(fontWeight: FontWeight.bold,
                                color: Colors.white,),
                            ),
                            Text(
                              'L',
                              style: TextStyle(fontWeight: FontWeight.bold,
                                color: Colors.white,),
                            ),
                            Text(
                              'GD',
                              style: TextStyle(fontWeight: FontWeight.bold,
                                color: Colors.white,),
                            ),
                            Text(
                              'Pts',
                              style: TextStyle(fontWeight: FontWeight.bold,
                                color: Colors.white,),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                buildTable(),
              ],
            ),
         )
      );
  }
}
