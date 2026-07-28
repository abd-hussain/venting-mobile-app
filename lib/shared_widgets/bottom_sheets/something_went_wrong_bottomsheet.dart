import 'package:flutter/material.dart';

class SomethingWentWrongBottomsheet extends StatelessWidget {
  final Function() onRetry;
  final String? title;
  final String? message;

  const SomethingWentWrongBottomsheet({
    super.key,
    required this.onRetry,
    this.message,
    this.title,
  });

  @override
  Widget build(BuildContext context) {
    //TODO: This UI need to be updated

    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.5,
      child: const Padding(
        padding: EdgeInsets.only(left: 16, right: 16, top: 20),
        child: Column(mainAxisSize: MainAxisSize.min),
      ),
    );
  }
}
