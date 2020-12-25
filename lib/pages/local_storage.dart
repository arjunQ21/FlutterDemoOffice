import "package:flutter/material.dart";
import 'package:shared_preferences/shared_preferences.dart';

class LocalStoragePage extends StatefulWidget {
  final String storageKey = 'food_name';
  @override
  _LocalStoragePageState createState() => _LocalStoragePageState();
}

class _LocalStoragePageState extends State<LocalStoragePage> {
  String _status = 'hi';
  String _readString = 'Click on Read';
  final _formKey = GlobalKey<FormState>();
  TextEditingController _valueController = TextEditingController();

  void initState() {
    super.initState();
    _readValue();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Saving Data Locally'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: _formKey,
          child: ListView(children: [
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Set new value.',
                    ),
                    validator: (v) {
                      v = v.trim();
                      if (v.length < 1) {
                        return 'enter someting.';
                      }
                      return null;
                    },
                    controller: _valueController,
                  ),
                ),
                Container(width: 20),
                RaisedButton(
                  child: Text('Save'),
                  onPressed: () {
                    if (_formKey.currentState.validate()) {
                      print("valid");
                      _setValue();
                    } else {
                      print("invalid");
                    }
                  },
                ),
              ],
            ),
            Expanded(
              child: RaisedButton(
                child: Text("Read Saved Value"),
                onPressed: () {
                  _readValue();
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(_status),
            ),
            Container(
              color: Color(0xff999999),
              padding: EdgeInsets.all(10),
              child: Text(
                _readString,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 17,
                  color: Colors.white,
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }

  void _setValue() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      prefs.setString(widget.storageKey, _valueController.text);
      _showStatus('saved');
      _readValue();
    } catch (e) {
      _showStatus("error: " + e.toString());
    }
  }

  void _readValue() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      _readString = prefs.getString(widget.storageKey) ?? '<Empty>';
      _showStatus('Read Successfully');
    } catch (e) {
      _showStatus("error: " + e.toString());
    }
  }

  void _showStatus(String msg) {
    setState(() {
      _status = msg;
    });
  }
}
