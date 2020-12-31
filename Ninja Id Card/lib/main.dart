import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     home: Scaffold(
       backgroundColor: Colors.grey[800],
      appBar: AppBar(
        title: Text('NINJA ID CARD'),
        centerTitle: true,
        backgroundColor: Colors.grey[900],
        elevation: 0.0,
      ),
       body: Padding(
         padding: EdgeInsets.fromLTRB(30.0, 40.0, 30.0, 0.0),
         child: Column(
           crossAxisAlignment: CrossAxisAlignment.start,
           children: <Widget>[
             Center(
               child: CircleAvatar(
                 backgroundImage: AssetImage('assets/ninja.jpg'),
                 radius: 40.0,
               ),
             ),
             Divider(
               height: 60.0,
               color: Colors.grey[900],
             ),
             Text(
               'NAME',
               style: TextStyle(
                 letterSpacing: 2.0,
                 color: Colors.grey,
               ),
             ),
             SizedBox(height: 10.0),
             Text(
               'Shahrukh',
               style: TextStyle(
                 color: Colors.amberAccent[200],
                 letterSpacing: 2.0,
                 fontWeight: FontWeight.bold,
                 fontSize: 28.0
               ),
             ),
             SizedBox(height: 30.0),
             Text(
               'HOMETOWN',
               style: TextStyle(
                 letterSpacing: 2.0,
                 color: Colors.grey,
               ),
             ),
             SizedBox(height: 10.0),
             Text(
               'Kanpur , India',
               style: TextStyle(
                   color: Colors.amberAccent[200],
                   letterSpacing: 2.0,
                   fontWeight: FontWeight.bold,
                   fontSize: 28.0
               ),
             ),
             SizedBox(height: 30.0),
             Text(
               'CURRENT NINJA ID',
               style: TextStyle(
                 letterSpacing: 2.0,
                 color: Colors.grey,
               ),
             ),
             SizedBox(height: 10.0),
             Text(
               '10',
               style: TextStyle(
                   color: Colors.amberAccent[200],
                   letterSpacing: 2.0,
                   fontWeight: FontWeight.bold,
                   fontSize: 28.0
               ),
             ),
             SizedBox(height: 30.0),
             Row(
               children: <Widget>[
                 Icon(
                   Icons.email_rounded,
                    color: Colors.grey[400],
                 ),
                 SizedBox(width: 10.0),
                 Text(
                   'shahrukh.khan_ccv18@gmail.com',
                       style: TextStyle(
                           color: Colors.grey,
                           letterSpacing: 2.0,
                       )
                 )

               ],
             )
           ],
         ),
       ),

     )
    );
  }
}
