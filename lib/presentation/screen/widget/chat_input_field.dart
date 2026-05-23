import 'package:flutter/material.dart';
import 'package:llm_chat_app/core/constans/app_colors.dart';
import 'package:llm_chat_app/core/constans/app_strings.dart';

class ChatInputField extends StatefulWidget {
  final void Function(String text) onSend;
  final bool isLoading;
  final String? hintText;
  final IconData? sendIcon;

  const ChatInputField({
    super.key,
    required this.onSend,
    required this.isLoading,
    this.hintText,
    this.sendIcon,
  });

  @override
  State<ChatInputField> createState() => _ChatInputFieldState();
}

class _ChatInputFieldState extends State<ChatInputField> {
  final TextEditingController _controller = TextEditingController();
  bool _hasText = false;

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      final has = _controller.text.trim().isNotEmpty;
      if (has != _hasText) setState(() => _hasText = has);
    });
  }

  void _handleSend() {
    final text = _controller.text.trim();
    if (text.isEmpty || widget.isLoading) return;
    widget.onSend(text);
    _controller.clear();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: AppColors.inputBackground,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.07),
            blurRadius: 8,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: SafeArea(
        top: false,
        child: Row(
          children: [
            // Attachment icon
            Icon(Icons.attach_file, color: Colors.grey.shade400, size: 22),
            const SizedBox(width: 8),

            // Text field
            Expanded(
              child: TextField(
                controller: _controller,
                enabled: !widget.isLoading,
                textCapitalization: TextCapitalization.sentences,
                maxLines: 4,
                minLines: 1,
                onSubmitted: (_) => _handleSend(),
                decoration: InputDecoration(
                  hintText: widget.hintText ?? AppStrings.inputHint,
                  hintStyle: TextStyle(color: Colors.grey.shade400, fontSize: 14),
                  border: InputBorder.none,
                  isDense: true,
                  contentPadding: const EdgeInsets.symmetric(vertical: 8),
                ),
              ),
            ),

            const SizedBox(width: 8),

            // Emoji icon (when no text)
            if (!_hasText && !widget.isLoading)
              Icon(Icons.emoji_emotions_outlined,
                  color: Colors.grey.shade400, size: 22),

            const SizedBox(width: 8),

            // Send / Mic button
            GestureDetector(
              onTap: _handleSend,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                width: 44,
                height: 44,
                decoration: BoxDecoration(
                  color: (_hasText && !widget.isLoading)
                      ? AppColors.primary
                      : AppColors.primary.withValues(alpha: 0.5),
                  shape: BoxShape.circle,
                ),
                child: widget.isLoading
                    ? const Padding(
                  padding: EdgeInsets.all(12),
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    color: Colors.white,
                  ),
                )
                    : Icon(
                  _hasText
                      ? (widget.sendIcon ?? Icons.send_rounded)
                      : Icons.mic,
                  color: Colors.white,
                  size: 20,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}