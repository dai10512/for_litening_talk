import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:for_litening_talk/public_link_try_page.dart';
import 'package:get/get.dart';
import 'package:qr_flutter/qr_flutter.dart';

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
      appBar: AppBar(
        title: const Text('Public Linkの説明'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32.0),
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 16),
                Text(
                  '非エンジニアとも開発を共有',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                const SizedBox(height: 16),
                Assets.images.client3691435640.image(),
                const SizedBox(height: 32),
                const Text('''
クライアントやデザイナーなどの非エンジニアも、開発中のアプリを手元で確認したいと言う要望がある。。。\n\nどうするべきか。。。\n\nそんな環境の中で開発中のアプリを誰でも試せるのが外部テストであり、URL一つでできるのが、Public Linkです。'''),
                const SizedBox(height: 32),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: () => Get.to(const PublicLinkTryPage()),
                      child: const Text('実際に試してみる =>')),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildQrcodeSpace() {
    final url = ref.watch(urlProvider);
    return ref.watch(urlProvider).isNotEmpty
        ? QrImage(
            data: url,
            version: QrVersions.auto,
            size: MediaQuery.of(context).size.width,
          )
        : const SizedBox.shrink();
  }
}

final urlProvider = StateNotifierProvider.autoDispose<UrlNotifier, String>(
    (ref) => UrlNotifier());

class UrlNotifier extends StateNotifier<String> {
  UrlNotifier() : super('');

  void getNewValue(String? newValue) => state = newValue ?? '';
}
