import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';

import 'chatgpt_prompt.dart';
import 'gen/assets.gen.dart';

class ChatGptExplainPage extends ConsumerStatefulWidget {
  const ChatGptExplainPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ChatGptExplainPageState();
}

class _ChatGptExplainPageState extends ConsumerState<ChatGptExplainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Public Linkの説明'),
      // ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 32),
              Text(
                'AIを最高の助手として活用しよう',
                style: Theme.of(context).textTheme.headlineSmall,
                textAlign: TextAlign.start,
              ),
              const SizedBox(height: 24),
              // const Expanded(child: SizedBox.shrink()),
              Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: Assets.images.client3691435640.image(
                      width: 300,
                    ),
                  ),
                  const SizedBox(height: 32, width: 32),
                  const Expanded(
                    flex: 4,
                    child: Text(
                        '''AIは完璧ではないけど、定例的だけなコードの生成などには一役買ってくれます。お決まりパターンだけど書くのが面倒くさい。そんなコードの生成にいいかもしれません'''),
                  ),
                ],
              ),
              const Expanded(child: SizedBox.shrink()),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () => Get.to(const ChatGptPromptPage()),
                    child: const Text('実際に試してみる =>')),
              ),
              const Expanded(child: SizedBox.shrink()),
            ],
          ),
        ),
      ),
    );
  }
}

final urlProvider = StateNotifierProvider.autoDispose<UrlNotifier, String>(
    (ref) => UrlNotifier());

class UrlNotifier extends StateNotifier<String> {
  UrlNotifier() : super('');

  void getNewValue(String? newValue) => state = newValue ?? '';
}
