import 'package:flutter/material.dart';

class StfScreen extends StatefulWidget {
  final String nameTap;

  const StfScreen({super.key, required this.nameTap});

  @override
  State<StfScreen> createState() => _StfScreenState();
}

class _StfScreenState extends State<StfScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            widget.nameTap,
            style: const TextStyle(fontSize: 48),
          ),
        ],
      ),
    );
  }
}
