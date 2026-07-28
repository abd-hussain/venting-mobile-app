import 'package:flutter/material.dart';

class NoInternetConnectionView extends StatefulWidget {
  final Future<bool> Function() onRetry;

  const NoInternetConnectionView({super.key, required this.onRetry});

  @override
  State<NoInternetConnectionView> createState() =>
      _NoInternetConnectionViewState();
}

class _NoInternetConnectionViewState extends State<NoInternetConnectionView> {
  //TODO: This UI need to be updated
  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height * 0.85,
      ),
      child: const SingleChildScrollView(
        child: Column(mainAxisSize: MainAxisSize.min),
      ),
    );
  }
}
