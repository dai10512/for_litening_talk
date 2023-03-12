import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:qr_flutter/qr_flutter.dart';

class PublicLinkTryPage extends ConsumerStatefulWidget {
  const PublicLinkTryPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _PublicLinkTryPageState();
}

class _PublicLinkTryPageState extends ConsumerState<PublicLinkTryPage> {
  final comment = '''実際の現場では、エンジニアはもちろん、非エンジニアであるクライアント様などもいます。'
      'アプリ開発の進行状況を実際に手元でアプリとして動かして確認したい、というニーズがあります。 ''';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('public linkを試してみよう'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32.0),
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 16),
                const Text('1 参加者：iosでTestFlightアプリをDL'),
                const SizedBox(height: 16),
                const Text('2 登壇者：テスト用URLをコピペ'),
                TextFormField(
                  onFieldSubmitted: (newValue) =>
                      ref.read(urlProvider.notifier).getNewValue(newValue),
                ),
                const SizedBox(height: 16),
                const Text('3 参加者：QRコードをスキャン'),
                const SizedBox(height: 24),
                _buildQRcodeSpace(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildQRcodeSpace() {
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
