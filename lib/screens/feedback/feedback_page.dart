import 'package:antisepticks/blocs/feedback/feedback_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FeedbackPage extends StatefulWidget {
  @override
  _FeedbackPageState createState() => _FeedbackPageState();
}

class _FeedbackPageState extends State<FeedbackPage> {
  String _selection;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        padding: const EdgeInsets.only(bottom: 0.0),
        height: 44,
        color: Colors.blue,
        child: Center(
          child: Text(
            "Send",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
      appBar: AppBar(
        title: Text(
          "Feedback",
        ),
      ),
      body: BlocBuilder<FeedbackBloc, FeedbackState>(
        bloc: BlocProvider.of(context),
        builder: (ctx, state) {
          return buildDefaultWidget();
        },
      ),
    );
  }

  Container buildDefaultWidget() {
    return Container(
      child: Column(
        children: <Widget>[
//            Container(
//              width: double.infinity,
//              child: Text(
//                "Please, select feedback type",
//                textAlign: TextAlign.start,
//              ),
//            ),
          buildPopupMenuButton(),
          Container(
            margin: EdgeInsets.only(left: 16, right: 16),
            child: TextFormField(
              decoration: InputDecoration(labelText: "Your feedback"),
              keyboardType: TextInputType.multiline,
              maxLines: null,
            ),
          )
        ],
      ),
    );
  }

  PopupMenuButton<String> buildPopupMenuButton() {
    return PopupMenuButton<String>(
      onSelected: (String value) {
        setState(() {
          _selection = value;
        });
      },
      child: ListTile(
        title: Text("Please, select feedback type"),
        subtitle: Text(_selection == null
            ? 'Nothing selected yet'
            : _selection.toString()),
      ),
      itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
        const PopupMenuItem<String>(
          value: 'Value1',
          child: Text('Choose value 1'),
        ),
        const PopupMenuItem<String>(
          value: 'Value2',
          child: Text('Choose value 2'),
        ),
        const PopupMenuItem<String>(
          value: 'Value3',
          child: Text('Choose value 3'),
        ),
      ],
    );
  }
}
