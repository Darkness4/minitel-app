import 'package:auto_login_flutter/components/drawer.dart';
import 'package:auto_login_flutter/funcs/http_resquests.dart';
import 'package:flutter/material.dart';

class ReportingPage extends StatefulWidget {
  final String title;

  ReportingPage({Key key, this.title}) : super(key: key);

  @override
  _ReportingPageState createState() => _ReportingPageState();
}

class _ReportingPageState extends State<ReportingPage> {
  final _titleFocusNode = FocusNode();
  final _descriptionFocusNode = FocusNode();
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  var _status = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Colors.red,
      ),
      body: Container(
        child: Center(
          child: SingleChildScrollView(
            child: Card(
              child: Container(
                padding: EdgeInsets.all(10),
                child: Column(
                  children: <Widget>[
                    TextField(
                      controller: _titleController,
                      style: TextStyle(fontWeight: FontWeight.bold),
                      focusNode: _titleFocusNode,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        labelText: "Title",
                      ),
                      onSubmitted: (term) {
                        _titleFocusNode.unfocus();
                        FocusScope.of(context)
                            .requestFocus(_descriptionFocusNode);
                      },
                      autofocus: true,
                    ),
                    TextField(
                      controller: _descriptionController,
                      maxLines: null,
                      focusNode: _descriptionFocusNode,
                      textInputAction: TextInputAction.done,
                      keyboardType: TextInputType.multiline,
                      decoration: InputDecoration(
                        labelText: "Description",
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
      drawer: MainDrawer(),
      floatingActionButton: Builder(
        builder: (context) => FloatingActionButton.extended(
              label: Text('Report', style: TextStyle(color: Colors.white),),
              onPressed: () {
                report(_descriptionController.text,
                        title: _titleController.text)
                    .then((status) => setState(() => _status = status));
                Scaffold.of(context).showSnackBar(SnackBar(
                  content: Text(_status),
                ));
              },
              //onPressed: _incrementCounter,
              tooltip: 'Report',
              icon: Icon(Icons.send, color: Colors.white,),
              backgroundColor: Colors.red,
              foregroundColor: Colors.black,
            ),
      ),
    );
  }
}
