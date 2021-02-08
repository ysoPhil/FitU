///Written: Phil D.
///Purpose: Class that generates an
///         image banner widget to
///         improve readability

import 'package:flutter/material.dart';

class ImageBanner extends StatelessWidget {
  final String _assetPath;

  //Constructor w/ position param
  ImageBanner(this._assetPath);

  @override
  Widget build(BuildContext context) {
    return Container(
        constraints: BoxConstraints.expand(
          height: 200.0,
        ),
        decoration: BoxDecoration(color: Colors.grey),
        child: Image.asset(_assetPath, fit: BoxFit.cover));
  }
}
