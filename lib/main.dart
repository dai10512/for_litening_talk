import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const DebugPage(),
    );
  }
}

class TopPage extends StatefulWidget {
  const TopPage({super.key, required this.title});

  final String title;

  @override
  State<TopPage> createState() => _TopPageState();
}

class _TopPageState extends State<TopPage> {
  int _currentIndex = 0;

  final List<Widget> _children = [Container()];

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'タイトル未定aaaaaaaaaaaaaaa',
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            Text(
              '登壇者　小山内　大輔',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: onTabTapped,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Search',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.camera),
              label: 'Camera',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ]),
    );
  }
}

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
                    Get.to(const WebviewPage(webview: Webview.findy));
                  },
                ),
                _debugButton(
                  'Flutter学習にChatGPTを使ってみる',
                  () {
                    Get.to(const WebviewPage(webview: Webview.chatGPT));
                  },
                ),
                _debugButton(
                  'Flutter学習にFlutterを使ってみる',
                  () {},
                ),
                _debugButton(
                  'Flutter学習にFlutterを使ってみる',
                  () {},
                ),
                _debugButton(
                  'Flutter学習にFlutterを使ってみる',
                  () {},
                ),
                _debugButton(
                  'Flutter学習にFlutterを使ってみる',
                  () {},
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
    VoidCallback aa,
  ) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: ElevatedButton(
        onPressed: aa,
        child: Text(text),
      ),
    );
  }
}

enum Webview {
  chatGPT('https://chat.openai.com/chat'),
  findy('https://findy-code.io/share_profiles/yiPGaVBeMDU1Q');

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
    controller.loadRequest(Uri.parse(widget.webview.url));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: WebViewWidget(controller: controller));
  }
}
