import 'package:antisepticks/navigation/routest_const.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AntisepticList extends StatefulWidget {
  @override
  _AntisepticListState createState() => _AntisepticListState();
}

class _AntisepticListState extends State<AntisepticList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Antiseptics"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add, color: Colors.white),
            onPressed: () {
              Navigator.pushNamed(context, RoutesPath.ANTISEPTIC_ADD);
            },
          )
        ],
      ),
      body: Column(
        children: <Widget>[
          SizedBox(
            height: 8,
          ),
          Text(
            "Propose variant antiseptic",
            style: TextStyle(color: Colors.blue),
          ),
          SizedBox(
            height: 8,
          ),
          Divider(
            color: Colors.blue,
          ),
        ],
      ),
    );
  }
}
