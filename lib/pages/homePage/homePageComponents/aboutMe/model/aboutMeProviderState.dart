import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AboutMeProviderState extends ChangeNotifier {
  String pictureProfileUrl = "";
  Uint8List pictureProfileImgData = Uint8List(0);
  String aboutMeDescription = "";
  String title = "";
}