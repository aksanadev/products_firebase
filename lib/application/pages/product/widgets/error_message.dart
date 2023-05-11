import 'package:flutter/material.dart';

class ErrorMessage extends StatelessWidget {
  final String errorMessage;
  const ErrorMessage({super.key, required this.errorMessage});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Text(errorMessage),
        )
      ],
    );
  }
}
