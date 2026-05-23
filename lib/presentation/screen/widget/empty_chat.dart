import 'package:flutter/material.dart';
import 'package:llm_chat_app/core/constans/app_colors.dart';

class EmptyChat extends StatelessWidget {
  const EmptyChat({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 100,
            width: 100,
            decoration: const BoxDecoration(
              color: AppColors.avatarBg,
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.smart_toy_outlined,
              size: 54,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 24),
          // "Hello!" bubble
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(24),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.06),
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: const Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Hello! ',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF1A1A1A)),
                ),
                Text('😊', style: TextStyle(fontSize: 16)),
              ],
            ),
          ),
          const SizedBox(height: 10),
          // "How can I help?" bubble
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(24),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.06),
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: const Text(
              'How can I help?',
              style: TextStyle(
                  fontSize: 15,
                  color: Color(0xFF555555),
                  fontWeight: FontWeight.w400),
            ),
          ),
        ],
      ),
    );
  }
}