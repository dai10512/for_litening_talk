import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

enum Webview {
  chatGPT('https://chat.openai.com/chat'),
  findy('https://findy-code.io/share_profiles/yiPGaVBeMDU1Q'),
  firstTask('https://zenn.dev/articles/bc99f9cc42fa13/edit'),
  appStoreConnect('https://appstoreconnect.apple.com/apps');

  const Webview(this.url);
  final String url;
}

class WebviewPage extends StatefulWidget {
  const WebviewPage({super.key, required this.webview});

  final Webview webview;
  @override
  State<WebviewPage> createState() => _WebviewPageState();
}

class _WebviewPageState extends State<WebviewPage> {
  final controller = WebViewController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller
      ..loadRequest(Uri.parse(widget.webview.url))
      ..enableZoom(true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(),
      body: WebViewWidget(controller: controller),
    );
  }
}
