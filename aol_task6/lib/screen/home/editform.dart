import 'package:aoltask6/models/user.dart';
import 'package:aoltask6/services/database.dart';
import 'package:aoltask6/shared/loading.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EditForm extends StatefulWidget {
  @override
  _EditFormState createState() => _EditFormState();
}

class _EditFormState extends State<EditForm> {

  final _formKey = GlobalKey<FormState>();
  final List<String> sugars = ['0', '1', '2', '3', '4'];

  // form values
  String _currentName;
  String _currentAge;

  @override
  Widget build(BuildContext context) {

    final user = Provider.of<User>(context);

    return StreamBuilder<UserData>(
        stream: DatabaseService(uid: user.uid).userData,
        builder: (context, snapshot) {
          if(snapshot.hasData){
            UserData userData = snapshot.data;
            return Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  Text(
                    'Update Profile Settings..',
                    style: TextStyle(fontSize: 18),
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    initialValue: userData.name,
                    decoration: InputDecoration(
                      labelText: 'Name',
                      hintText: 'Enter name..',
                    ),
                    validator: (val) => val.isEmpty ? 'Please enter a name' : null,
                    onChanged: (val) => setState(() => _currentName = val),
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    initialValue: userData.age,
                    decoration: InputDecoration(
                      labelText: 'Age',
                      hintText: 'Enter age..',
                    ),
                    validator: (val) => val.isEmpty ? 'Please enter age' : null,
                    onChanged: (val) => setState(() => _currentAge = val),
                  ),
                  SizedBox(height: 20),
                  RaisedButton(
                    color: Colors.redAccent,
                    child: Text(
                      'Update',
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () async {
                      if(_formKey.currentState.validate()){
                        await DatabaseService(uid: user.uid).updateUserData(
                            _currentName ?? userData.name,
                            _currentAge ?? userData.age
                        );
                        Navigator.pop(context);
                      }
                    },
                  ),
                ],
              ),
            );
          }
          else{
            return Loading();
          }

        }
    );
  }
}
