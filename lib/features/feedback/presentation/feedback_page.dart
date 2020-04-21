import 'package:antisepticks/features/feedback/data/models/request_deedback.dart';
import 'package:antisepticks/features/feedback/presentation/bloc/feedback_bloc.dart';
import 'package:antisepticks/ui/widgets/progress_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FeedbackPage extends StatefulWidget {
  @override
  _FeedbackPageState createState() => _FeedbackPageState();
}

class _FeedbackPageState extends State<FeedbackPage> {
  String _selection;
  final _formKey = GlobalKey<FormState>();
  final _textController = TextEditingController();
  var isEnabledAutoValidation = false;

  void _sendFeedback() {
    if (_formKey.currentState.validate()) {
      BlocProvider.of<FeedbackBloc>(context).add(PostFeedback(
          feedbackModel: FeedbackModel(
              message: "Test flutter feedback ", type: "BUG WTF"))); // добавл}
    }
  }

  @override
  void initState() {
    _textController.addListener(() {
      checkValidationFields();
    });
    super.initState();
  }

  void checkValidationFields() {
    if (!isEnabledAutoValidation && _textController.text.isNotEmpty)
      setState(() {
        isEnabledAutoValidation = true;
      });
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: buildBottomButton(),
      appBar: buildAppBar(),
      body: _listenerWrapper,
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      title: Text(
        "Feedback",
      ),
    );
  }

  Widget get _listenerWrapper {
    return BlocListener<FeedbackBloc, FeedbackState>(
        listener: (context, state) {
          if (state is PostedState) {
            final snackBar = SnackBar(
              content: Text('Feedback was send'),
              duration: Duration(seconds: 2),
              action: SnackBarAction(
                label: 'Close screen', // or some operation you would like
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            );
            Scaffold.of(context).showSnackBar(snackBar);

            // _refreshCompleter?.complete();
            //_refreshCompleter = Completer();
          } else if (state is PostErrorState) {
            // в случае ошибки показываем ошибку
          }
        },
        child: _buildDefaultWidget);
  }

  Widget buildBottomButton() {
    return GestureDetector(
      child: Container(
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
      onTap: () {
        _sendFeedback();
      },
    );
  }

  Widget get _buildDefaultWidget {
    return BlocBuilder<FeedbackBloc, FeedbackState>(builder: (context, state) {
      if (state is InitialFeedbackState) {
        return _buildBaseState;
      }
      if (state is PostingState) {
        return DefaultProgressIndicator();
      }
      if (state is PostErrorState) {
        return _buildBaseState;
      }
      if (state is PostedState) {
        //final weatherResponse = state.forecastResponse;
        //initWeatherWithData(weatherResponse.list);
        return _buildBaseState;
      }
      return null;
    });
  }

  Widget get _buildBaseState {
    return Container(
      child: Column(
        children: <Widget>[
          buildPopupMenuButton(),
          Form(
            key: _formKey,
            child: Container(
              margin: EdgeInsets.only(left: 16, right: 16),
              child: TextFormField(
                controller: _textController,
                maxLength: 244,
                decoration: InputDecoration(labelText: "Your feedback"),
                keyboardType: TextInputType.multiline,
                maxLines: null,
                autovalidate: isEnabledAutoValidation,
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
              ),
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
