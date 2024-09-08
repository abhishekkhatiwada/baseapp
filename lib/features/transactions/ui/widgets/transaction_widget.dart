import 'package:baseapp/common/widgets/page_wrapper.dart';
import 'package:flutter/material.dart';

class TransactionWidget extends StatelessWidget {
  const TransactionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return PageWrapper(
        showAppBar: true,
        appBarColor: Colors.blue,
        appBar: AppBar(
          title: const Text('Transaction Widget'),
        ),
        body: const Column(
          children: [],
        ));
  }
}
