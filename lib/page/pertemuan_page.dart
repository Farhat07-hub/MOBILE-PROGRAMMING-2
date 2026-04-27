import 'package:flutter/material.dart';
import 'package:flutter_application_2/Model/pertemuan.dart';

class PertemuanPage extends StatelessWidget {
  final Pertemuan pertemuan;

  const PertemuanPage({super.key, required this.pertemuan});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(pertemuan.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(
          pertemuan.subtitle,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}