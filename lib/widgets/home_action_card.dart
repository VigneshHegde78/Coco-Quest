import 'package:flutter/material.dart';

class HomeActionCard extends StatelessWidget {
  final String name;
  final VoidCallback onTap;

  const HomeActionCard({super.key, required this.name, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(24),
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(50)),
        child: Image.asset('assets/images/$name.png', width: 90),
      ),
    );
  }
}
