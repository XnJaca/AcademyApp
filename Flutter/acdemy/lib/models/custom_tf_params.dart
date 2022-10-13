import 'package:flutter/material.dart';

class DataTextField {
  final IconData icon;
  final String label;
  final String placeHolder;
  final bool isPass; // ** Tipo de Texfield (ej: texto, passwordm etc)
  final TextInputType tfType;
  DataTextField({required this.icon, required this.label, required this.placeHolder,required this.isPass, required this.tfType});
}
