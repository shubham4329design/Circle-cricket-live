import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ConnectionStatusWidget extends ConsumerWidget {
  final Widget child;

  const ConnectionStatusWidget({
    required this.child,
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // In real implementation, would watch connectivity provider
    final isConnected = true; // Placeholder

    return Stack(
      children: [
        child,
        if (!isConnected)
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              color: Colors.orange[700],
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.cloud_off,
                    color: Colors.white,
                    size: 16,
                  ),
                  const SizedBox(width: 8),
                  const Text(
                    'No Internet Connection',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ),
      ],
    );
  }
}
