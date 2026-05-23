import 'package:flutter/material.dart';
import 'package:llm_chat_app/presentation/provider/chat_provider.dart';
import 'package:llm_chat_app/presentation/screen/splash_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ChatProvider(),
      child: MaterialApp(
        title: 'Durjoy AI',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF26C6A6)),
          useMaterial3: true,
        ),
        home: const SplashScreen(),
      ),
    );
  }
}