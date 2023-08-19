import 'package:country_picker/src/country_parser.dart';
import 'package:country_picker/src/utils.dart';
import 'package:flutter/material.dart';


class Country{
  static Country worldwide = Country(
    phoneCode :"",
    countrycode :"WW",
    ec4516 : -1,
    geographic : false,
    level : -1,
    name : "World Wide",
    exemple : "",
    displayName: "World Wide (WW)",
    displaynamenocountrycode : "World Wide",
    e16Key:""


  );
  final String phoneCode;
  final String countrycode;
  final  int ec4516;
  final bool geographic;
  final int level;
  final String name;
  final String exemple;
  final String displayName;
  final String displaynamenocountrycode;
  final String e16Key;
  Country({
    required this.phoneCode,
    required this.name,
    required this.countrycode,
  required this.displayName,
  required this.displaynamenocountrycode,
  required this.e16Key,
  required this.ec4516,
  required this.exemple,
  required this.geographic,
  required this.level
  });
}