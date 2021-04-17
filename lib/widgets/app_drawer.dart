import 'package:fitness_app/models/survey.dart';
import 'package:fitness_app/screens/wrapper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/auth.dart';
import '../screens/homepage_screen.dart';
import '../screens/login_screen.dart';

class AppDrawer extends StatelessWidget {
  final Survey survey;
  AppDrawer(this.survey);
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          AppBar(
            backgroundColor: Colors.amber[900],
            title: Container(
              margin: EdgeInsets.only(left: 55),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                image: DecorationImage(
                  image: AssetImage('assets/FitU_logo.png'),
                ),
              ),
              height: 40,
              width: 40,
            ),
            automaticallyImplyLeading: false,
          ),
          Divider(
            color: Theme.of(context).primaryColor,
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Home'),
            onTap: () {
              Navigator.of(context).pushReplacementNamed(
                HomePageScreen.routeName,
              );
            },
          ),
          Divider(
            color: Theme.of(context).primaryColor,
          ),
          ListTile(
            leading: Icon(Icons.schedule),
            title: Text('Schedule Workout'),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Wrapper('Scheduler', survey)));
              //TODO: return Scheduler
            },
          ),
          Divider(
            color: Theme.of(context).primaryColor,
          ),
          ListTile(
            leading: Icon(Icons.calendar_today),
            title: Text('Calorie Counter'),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Wrapper('Nutrition', survey)));
            },
          ),
          Divider(
            color: Theme.of(context).primaryColor,
          ),
          SizedBox(
            height: 250,
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Logout'),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).pushReplacementNamed(LoginScreen.routeName);
              Provider.of<Auth>(context, listen: false).logout();
            },
          ),
        ],
      ),
    );
  }
}
