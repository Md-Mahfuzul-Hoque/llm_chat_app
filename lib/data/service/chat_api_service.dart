import 'dart:convert';
import 'package:llm_chat_app/core/constans/app_strings.dart';
import 'package:llm_chat_app/data/model/message_model.dart';
import 'package:http/http.dart' as http;

class ChatApiService {
  Future<String> fetchAssistantReply(List<MessageModel> messages) async {
    final response = await http
        .post(
      Uri.parse('${AppStrings.baseUrl}/chat/completions'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${AppStrings.apiKey}',
      },
      body: jsonEncode({
        'model': AppStrings.model,
        'max_tokens': 1024,
        'messages': [
          {'role': 'system', 'content': AppStrings.systemPrompt},
          ...messages.map((m) => m.toApiMap()),
        ],
      }),
    )
        .timeout(const Duration(seconds: 30));

    if (response.statusCode != 200) {
      throw Exception('Failed: ${response.statusCode} - ${response.body}');
    }

    final data = jsonDecode(response.body);
    return (data['choices'][0]['message']['content'] as String).trim();
  }
}