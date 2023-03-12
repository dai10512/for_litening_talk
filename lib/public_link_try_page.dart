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
      // appBar: AppBar(
      //   title: const Text('public linkを試してみよう'),
      // ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 32),
              Text(
                'Public Linkを試してみよう！',
                style: Theme.of(context).textTheme.headlineSmall,
                textAlign: TextAlign.start,
              ),
              const SizedBox(height: 24),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 3,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            ''
                            '1 参加者：iosでTestFlightアプリをDL',
                          ),
                          const SizedBox(height: 16),
                          const Text('2 登壇者：テスト用URLをコピペ'),
                          TextFormField(
                            onFieldSubmitted: (newValue) => ref
                                .read(urlProvider.notifier)
                                .getNewValue(newValue),
                          ),
                          const SizedBox(height: 16),
                          const Text('3 参加者：QRコードをスキャン'),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 70),
                  Expanded(
                    flex: 2,
                    // padding: const EdgeInsets.symmetric(horizontal: 200.0),
                    child: _buildQRcodeSpace(),
                  ),
                ],
              ),
              const Expanded(child: SizedBox.shrink()),

              // const SizedBox(height: 40),
              // const SizedBox(width: 30),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildQRcodeSpace() {
    final url = ref.watch(urlProvider);
    return ref.watch(urlProvider).isNotEmpty
        ? Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: QrImage(
              data: url,
              version: QrVersions.auto,
              // size: MediaQuery.of(context).size.width,
            ),
          )
        : const SizedBox.shrink();
    // return QrImage(
    //   data: url,
    //   version: QrVersions.auto,
    //   // size: MediaQuery.of(context).size.width,
    // );
  }
}

final urlProvider = StateNotifierProvider.autoDispose<UrlNotifier, String>(
    (ref) => UrlNotifier());

class UrlNotifier extends StateNotifier<String> {
  UrlNotifier() : super('');

  void getNewValue(String? newValue) => state = newValue ?? '';
}
