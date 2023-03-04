import 'package:GameDevPortfolio/UI/responsive.dart';
import 'package:flutter/material.dart';

const double kDefaultPadding = 10;
const double kDefaultDesktopPagePadding = 95;
const double kDefaultTabletPagePadding = 80;
const double kDefaultMobilePagePadding = 30;

const double kMaxWidth = 1800.0;
const double kMaxWidthPage = 1400;

double kMaxFilterBarWidth = 800;

const double kBorderRadius = 8;
const double kImageBorderRadius = 25;
const double kButtonBorderRadius = 35;

class WidgetStyle{
  static final BorderSide kBorderLine = BorderSide(width: 1, color: Colors.grey[350]!);
}

EdgeInsets getPagePadding(BuildContext context) {
  return EdgeInsets.symmetric(
    horizontal: Responsive.isDesktop(context) ?
    kDefaultDesktopPagePadding : 
    Responsive.isTablet(context) ?
    kDefaultTabletPagePadding : kDefaultMobilePagePadding
  );
}
