import 'package:llm_chat_app/core/constans/secrets.dart';

class AppStrings {
  static const String appName = 'Durjoy AI';
  static const String inputHint = 'Type message...';
  static const String imageGenInputHint = 'Describe an image...';

  static const String errorNoInternet =
      'No internet connection. Please check and try again.';
  static const String errorTimeout = 'Request timed out. Please try again.';
  static const String errorGeneral = 'Something went wrong. Please try again.';

  // Chat API
  static const String apiKey = Secrets.apiKey;
  static const String baseUrl = 'https://api.durjoyai.com/v1';
  static const String model = 'durjoy-kotha-1';
  static const String systemPrompt =
      'You are Durjoy, a helpful and friendly AI assistant. Respond concisely and helpfully.';

  // Image Generation API
  static const String imageGenApiKey = Secrets.imageGenApiKey;
  static const String imageGenBaseUrl = 'https://api.durjoyai.com/v1';
  static const String imageGenModel = 'durjoy-kotha-1';
}