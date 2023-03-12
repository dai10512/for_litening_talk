import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';

import 'debug_page.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const TopPage(),
    );
  }
}

class TopPage extends StatelessWidget {
  const TopPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GestureDetector(
          onTap: () => Get.to(const DebugPage()),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Flutter.Okinawa Meetup #1',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 40),
              Text(
                'ChatGPTとの上手なお付き合い\n'
                'PublicLinkで誰でも簡単TestFlight',
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              const SizedBox(height: 56),
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  '登壇者：オサナイ（小山内 大輔）',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
