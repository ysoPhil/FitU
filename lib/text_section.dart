import 'package:flutter/material.dart';

class TextSection extends StatelessWidget {
  final String _title;
  final String _body;
  final Color _color;
  static const double _hPad = 16.0;

  //Constructor w/ positional params
  TextSection(this._title, this._body, this._color);

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            color: Colors.amber[200],
            padding: const EdgeInsets.fromLTRB(_hPad, 15.0, _hPad, 4.0),
            child: Text(_title,
                style: TextStyle(
                    fontFamily: 'assets/fonts/Montserrat-Regular.ttf',
                    color: _color,
                    fontSize: 25.0)),
          ),
          Container(
            color: Colors.amber[200],
            padding: const EdgeInsets.fromLTRB(_hPad, 10.0, _hPad, _hPad),
            child: Text(_body,
                style: TextStyle(
                    fontFamily: 'assets/fonts/Montserrat-Regular.ttf',
                    color: _color,
                    fontSize: 15.0)),
          )
        ]);
  }
}
