import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:qr_flutter/qr_flutter.dart';

class PublicLinkPage extends ConsumerStatefulWidget {
  const PublicLinkPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _PublicLinkPageState();
}

class _PublicLinkPageState extends ConsumerState<PublicLinkPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('public linkを試してみよう'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 56.0),
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
                _buildQrcodeSpace(),
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
