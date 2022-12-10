import 'package:flutter/material.dart';

class AuthError extends StatelessWidget {
  const AuthError({Key? key, required this.message}) : super(key: key);
  final String message;

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.amber.shade400)),
      child: Row(
        children: [
          Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
              color: Colors.amber.shade400,
              child: const Icon(
                Icons.error_outline,
              )),
          const SizedBox(
            width: 10,
          ),
          Text(
            message,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          )
        ],
      ),
    );
  }
}
