import 'package:flutter/material.dart';

class HomepageLoadingWidget extends StatelessWidget {
  const HomepageLoadingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: 15,
      itemBuilder: (context, index) => Text('Loading'),
      separatorBuilder: (context, index) => const Divider(),
    );
  }
}
