import 'package:flutter/material.dart';
import 'package:aoltask6/models/profile.dart';

class ProfileTile extends StatelessWidget {

  final Profile profile;

  ProfileTile({this.profile});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.fromLTRB(20, 5, 20, 0),
      child: ListTile(
        leading: CircleAvatar(
          child: Icon(Icons.supervised_user_circle,color: Colors.white),
          radius: 20,
          backgroundColor: Colors.pink[600],
        ),
        title: Text(profile.name),
        subtitle: Text('${profile.age} years'),
      ),
    );
  }
}
