import 'package:flutter/material.dart';

ThemeData darkMode = ThemeData(
  colorScheme: ColorScheme.dark().copyWith(
    primary: Colors.green, 
    secondary: Colors.white, 
   surface: Color.fromARGB(255, 3, 3, 3), 
    error: Colors.green,
    onError: const Color.fromARGB(255, 17, 17, 17), 
    tertiary: Colors.white,

  ),
);
