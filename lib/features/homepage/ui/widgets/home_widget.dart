import 'package:baseapp/common/widgets/page_wrapper.dart';
import 'package:flutter/material.dart';

class HomeWidget extends StatelessWidget {
  const HomeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return PageWrapper(
        showAppBar: false,
        appBar: AppBar(
          title: const Text('Home Widget'),
        ),
        body: const Column(
          children: [],
        ));
  }
}
