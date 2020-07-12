import 'package:aoltask6/models/user.dart';
import 'package:aoltask6/screen/authenticate/authenticate.dart';
import 'package:aoltask6/screen/home/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);

    //return home or authenticate
    if(user == null){
      return Authenticate();
    }
    else{
      return Home();
    }
  }
}
