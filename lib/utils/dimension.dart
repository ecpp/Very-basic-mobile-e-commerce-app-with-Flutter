import 'package:flutter/material.dart';

class Dimen {
  static const double parentMargin = 16.0;
  static const double regularMargin = 10.0;
  static const double largeMargin = 50.0;
  static const double homepageMargin = 17.0;
  static const double borderRadius = 6.0;
  static const double borderRadiusRounded = 20.0;
  static const double textFieldHeight = 32.0;


  static get parentPadding => EdgeInsets.all(parentMargin);
  static get regularPadding => EdgeInsets.all(regularMargin);
  static get verticalparentPadding => EdgeInsets.symmetric(vertical: parentMargin);
  static get homepageDefaultPadding => EdgeInsets.only(left: regularMargin, top: homepageMargin);
  static get mainDefaultMargin => EdgeInsets.only(top: 50.0, bottom: 5.0, left: 15.0, right: 15.0);
  static get mainDefaultPadding =>EdgeInsets.only(top: 10.0, bottom: 10.0);

}
