import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class GoogleButton extends StatelessWidget {
  const GoogleButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.all(12),
        elevation: 1,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        backgroundColor: Colors.white,
      ),
      onPressed: () {},
      icon: const Icon(
        Ionicons.logo_google,
        color: Colors.red,
      ),
      label: const FittedBox(
        child: Text(
          'Sign in with Google',
          style: TextStyle(color: Colors.black),
        ),
      ),
    );
  }
}
