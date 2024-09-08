import 'package:baseapp/common/widgets/page_wrapper.dart';
import 'package:flutter/material.dart';

class ScanQrWidget extends StatelessWidget {
  const ScanQrWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return PageWrapper(
        showAppBar: true,
        appBar: AppBar(
          title: const Text('Scan QR Widget'),
        ),
        body: const Column(
          children: [],
        ));
  }
}
