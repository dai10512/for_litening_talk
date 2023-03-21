import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ChatGptPromptPage extends ConsumerStatefulWidget {
  const ChatGptPromptPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ChatGptPromptPageState();
}

class _ChatGptPromptPageState extends ConsumerState<ChatGptPromptPage> {
  final comment = '''実際の現場では、エンジニアはもちろん、非エンジニアであるクライアント様などもいます。'
      'アプリ開発の進行状況を実際に手元でアプリとして動かして確認したい、というニーズがあります。 ''';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 32),
              Text(
                'コピペ用プロンプト',
                style: Theme.of(context).textTheme.headlineSmall,
                textAlign: TextAlign.start,
              ),
              const SizedBox(height: 24),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          SelectableText(
                            'Flutterでスマホアプリを開発しています。',
                          ),
                          SelectableText(
                            '・ボトムナビゲーションを含んだTOPページを実装したいので、コードのサンプルを書いてください',
                          ),
                          SizedBox(height: 16),
                          SelectableText(
                              '・アクセストークンとリフレッシュトークンを利用したログイン機能を実装したいので、ロジックのサンプルを書いてください'),
                          SizedBox(height: 16),
                          SelectableText(
                              '・const spaceH1 = SizedBox(height:1)とします。spaceH1からspaceH100まで同様のコードを書いてください'),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const Expanded(child: SizedBox.shrink()),
            ],
          ),
        ),
      ),
    );
  }
}
