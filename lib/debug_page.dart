import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'public_link_page.dart';
import 'web_view_page.dart';

class DebugPage extends StatefulWidget {
  const DebugPage({super.key});

  @override
  State<DebugPage> createState() => _DebugPageState();
}

class _DebugPageState extends State<DebugPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 24),
            child: GridView.count(
              shrinkWrap: true,
              // 横1行あたりに表示するWidgetの数
              crossAxisCount: 3,
              // Widget間のスペース（左右）
              crossAxisSpacing: 4,
              // Widget間のスペース（上下）
              mainAxisSpacing: 4,
              // 全体の余白
              // padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              childAspectRatio: 5 / 3,

              children: [
                _debugButton(
                  'スキルレベル',
                  () {
                    Get.to(
                      const WebviewPage(webview: Webview.findy),
                    );
                  },
                ),
                _debugButton(
                  'Flutter学習にChatGPTを使ってみる',
                  () {
                    Get.to(
                      const WebviewPage(
                        webview: Webview.chatGPT,
                      ),
                    );
                  }
                ),
                // ログイン認証方法
                // bottomNavigation
                // package ×
                // 最新じゃない
                _debugButton(
                  'public linkを使ってみる',
                  () {
                    Get.to(const PublicLinkPage());
                  },
                ),
                _debugButton(
                  '0→1開発で最初にやること',
                  () {
                    Get.to(const WebviewPage(webview: Webview.firstTask));
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _debugButton(
    String text,
    VoidCallback callBack,
  ) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: ElevatedButton(
        onPressed: callBack,
        child: Text(text),
      ),
    );
  }
}
