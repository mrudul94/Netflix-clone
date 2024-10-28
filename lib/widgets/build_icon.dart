import 'package:flutter/material.dart';

Widget buildIconColumn(IconData icon, String label, VoidCallback onPressed) {
  return Column(
    children: [
      IconButton(
        onPressed: onPressed,
        icon: Icon(icon, color: Colors.white, size: 30),
      ),
      Text(
        label,
        style: const TextStyle(
          fontSize: 10,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    ],
  );
}
