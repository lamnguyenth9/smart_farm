
import 'package:flutter/material.dart';

class Dimension {
  static late double screenHeight;
  static late double screenWidth;

  static double height50 = screenHeight * 0.05; // 5% chiều cao màn hình
  static double height250 = screenHeight * 0.4; // 10% chiều cao màn hình
  static double width025 = screenWidth * 0.25; // 40% chiều rộng màn hình
  static double fontSize = screenHeight * 0.025; // 2.5% chiều cao màn hình

  // Phương thức để khởi tạo kích thước
  static void init(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
  }
}