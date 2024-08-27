import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'views/homePage.dart';


void main(){
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    home: HomePage(
    ),
  ));
}