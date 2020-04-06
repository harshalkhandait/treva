import 'package:flutter/material.dart';

class ApiKey {
  const ApiKey();
  static const apiKey = '3d40aa68';
}

class Colors {
  const Colors();

  static const Color planetCard = Color(0xFF8685E5);
  static const Color planetPageBackground = Color(0xFF736AB7);
  static const Color planetTitle = Color(0xFFFFFFFF);
  static const Color planetLocation = Color(0x66FFFFFF);
  static const Color planetDistance = Color(0x66FFFFFF);
}

class Dimens {
  static const planetWidth = 100.0;
  static const planetHeight = 100.0;
}

class TextStyles {
  static const TextStyle planetTitle = TextStyle(
      color: Colors.planetTitle,
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w600,
      fontSize: 24.0);

  static const TextStyle planetLocation = TextStyle(
      color: Colors.planetLocation,
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w300,
      fontSize: 14.0);

  static const TextStyle planetDistance = TextStyle(
      color: Colors.planetDistance,
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w300,
      fontSize: 12.0);
}
