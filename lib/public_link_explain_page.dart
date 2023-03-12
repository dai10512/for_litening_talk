import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:for_litening_talk/public_link_try_page.dart';
import 'package:get/get.dart';

import 'gen/assets.gen.dart';

class PublicLinkExplainPage extends ConsumerStatefulWidget {
  const PublicLinkExplainPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _PublicLinkExplainPageState();
}

class _PublicLinkExplainPageState extends ConsumerState<PublicLinkExplainPage> {
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
                '開発状況を非エンジニアとも共有したいんだけど',
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
                        '''クライアントやデザイナーなどの非エンジニアも、開発中のアプリを手元で確認したいと言う要望がある。。。\n\nどうするべきか。。。\n\nそんな環境の中で開発中のアプリを誰でも試せるのが外部テストであり、URL一つでできるのが、Public Linkです。'''),
                  ),
                ],
              ),
              const Expanded(child: SizedBox.shrink()),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () => Get.to(const PublicLinkTryPage()),
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
