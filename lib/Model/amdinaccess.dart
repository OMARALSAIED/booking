import 'package:booking/pages/AfterBook.dart';
import 'package:booking/pages/Home.dart';
import 'package:flutter/material.dart';

class Auth {
  Map<String, Widget> authmap = {"amdin": Home(), "user": AfterBook()};
}
