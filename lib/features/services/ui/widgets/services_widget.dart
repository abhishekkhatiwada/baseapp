import 'package:baseapp/common/widgets/page_wrapper.dart';
import 'package:flutter/material.dart';

class ServicesWidget extends StatelessWidget {
  const ServicesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return PageWrapper(
        appBarColor: Colors.black,
        showAppBar: true,
        appBar: AppBar(
          title: const Text('services Widget'),
        ),
        body: const Column(
          children: [],
        ));
  }
}
