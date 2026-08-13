import 'package:flutter/material.dart';
import 'package:venting_mobile_app/presentation/home/ventor/call/ventor_call_args.dart';
import 'package:venting_mobile_app/presentation/home/ventor/call/ventor_call_tips_screen.dart';

Future<bool?> openVentorCallFlow({
  required BuildContext context,
  required VentorCallArgs args,
}) {
  return Navigator.of(context).push<bool>(
    MaterialPageRoute(
      builder: (_) => VentorCallTipsScreen(args: args),
    ),
  );
}
