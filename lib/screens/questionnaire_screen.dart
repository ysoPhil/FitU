import 'package:fitness_app/models/survey.dart';
import 'package:fitness_app/screens/homepage_screen.dart';
import 'package:fitness_app/widgets/app_drawer.dart';
import 'package:flutter/material.dart';

class QuestionnaireScreen extends StatefulWidget {
  final Survey survey;
  QuestionnaireScreen(this.survey);
  @override
  _QuestionnaireScreenState createState() => _QuestionnaireScreenState();
}

//TODO: Questions: Do you wanna lose or not
class _QuestionnaireScreenState extends State<QuestionnaireScreen> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber[100],
      appBar: new AppBar(
        title: Text(
          "FitU Questionnaire",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.amber[900],
      ),
      drawer: AppDrawer(widget.survey),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              Text('In order to use the exercise schedule and the calorie' +
                  ' counter you must complete this questionnaire. ' +
                  'we will regularly request you to resubmitt'),
              TextFormField(
                //Weight
                onChanged: (val) {
                  setState(() {
                    widget.survey.currentWeight = double.parse(val);
                  });
                },
                decoration: const InputDecoration(
                  icon: Icon(Icons.linear_scale),
                  hintText: 'Current Weight',
                ),
                //Format validator
                validator: (String val) {
                  try {
                    double temp = double.parse(val);
                    if (temp <= 50 || temp >= 500) {
                      return "Please consult your doctor";
                    }
                  } catch (e) {
                    print("INCATCH BLOCK");
                    return "Please enter a valid weight.";
                  }
                  return "Please enter a valid weight.";
                },
              ),
              SizedBox(
                height: 5,
              ),
              TextFormField(
                //Age
                onChanged: (val) {
                  setState(() {
                    widget.survey.age = int.parse(val);
                  });
                },
                decoration: const InputDecoration(
                  icon: Icon(Icons.timer),
                  hintText: 'Current Age',
                ),
                //Format validator
                validator: (String val) {
                  try {
                    double temp = double.parse(val);
                    if (temp <= 18 || temp >= 70) {
                      return "Please consult your doctor";
                    }
                  } catch (e) {
                    print("IN CATCH BLOCK");
                    return "Please enter a valid Age.";
                  }
                  return "Please enter a valid Age.";
                },
              ),
              SizedBox(
                height: 5,
              ),
              TextFormField(
                //height
                onChanged: (val) {
                  setState(() {
                    widget.survey.height = double.parse(val);
                  });
                },
                decoration: const InputDecoration(
                  icon: Icon(Icons.height),
                  hintText: 'Height in Inches',
                ),
                //Format validator
                validator: (String val) {
                  try {
                    double temp = double.parse(val);
                    if (temp <= 22 || temp >= 100) {
                      return "Please consult your doctor, " +
                          "or make sure measurement is in inches.";
                    }
                  } catch (e) {
                    print("IN CATCH BLOCK");
                    return "Please enter a valid Height in inches.";
                  }
                  return "Please enter a valid Height in inches.";
                },
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Please give an approximation of your gender:',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              ListTile(
                leading: Radio(
                  value: 'Male',
                  groupValue: widget.survey.gender,
                  onChanged: (value) {
                    setState(() {
                      widget.survey.gender = value;
                    });
                  },
                ),
                title: Text('Male'),
              ),
              ListTile(
                leading: Radio(
                  value: 'Female',
                  groupValue: widget.survey.gender,
                  onChanged: (value) {
                    setState(() {
                      widget.survey.gender = value;
                    });
                  },
                ),
                title: Text('Female'),
              ),
              ListTile(
                leading: Radio(
                  value: 'Other',
                  groupValue: widget.survey.gender,
                  onChanged: (value) {
                    setState(() {
                      widget.survey.gender = value;
                    });
                  },
                ),
                title: Text('Other'),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                'On a scale from 1 to 5, How active are you?',
                style: TextStyle(fontSize: 18),
              ),
              ListTile(
                leading: Radio(
                  value: 1,
                  groupValue: widget.survey.activity,
                  onChanged: (value) {
                    setState(() {
                      widget.survey.activity = value;
                    });
                  },
                ),
                title: Text('1: Not Exercise, and Physically unactive Job. '),
              ),
              ListTile(
                leading: Radio(
                  value: 2,
                  groupValue: widget.survey.activity,
                  onChanged: (value) {
                    setState(() {
                      widget.survey.activity = value;
                    });
                  },
                ),
                title: Text('2: Light Exercise 1-3 times a week'),
              ),
              ListTile(
                leading: Radio(
                  value: 3,
                  groupValue: widget.survey.activity,
                  onChanged: (value) {
                    setState(() {
                      widget.survey.activity = value;
                    });
                  },
                ),
                title: Text('3: Exercise Moderately 3-5 times a week.'),
              ),
              ListTile(
                leading: Radio(
                  value: 4,
                  groupValue: widget.survey.activity,
                  onChanged: (value) {
                    setState(() {
                      widget.survey.activity = value;
                    });
                  },
                ),
                title: Text('4: Intense exercise 6-7 days a week/'),
              ),
              ListTile(
                leading: Radio(
                  value: 5,
                  groupValue: widget.survey.activity,
                  onChanged: (value) {
                    setState(() {
                      widget.survey.activity = value;
                    });
                  },
                ),
                title: Text(
                    '5: Intense exercise 6-7 days a week, with Physically demanding job.'),
              ),
              SizedBox(
                height: 5,
              ),
              ElevatedButton(
                  onPressed: () {
                    widget.survey.storeData();
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                HomePageScreen(widget.survey)));
                  },
                  child: Text('Submit')),
              SizedBox(
                height: 5,
              ),
              Text(
                  'By clicking submitt you agree that you have/will consult your doctor' +
                      "before using FitU."),
            ],
          ),
        ),
      ),
    );
  }
}
