import 'package:flutter/material.dart';
import 'package:venting_mobile_app/presentation/home/listener/call/listener_call_args.dart';
import 'package:venting_mobile_app/presentation/home/listener/call/listener_call_instruction_screen.dart';

Future<void> openListenerCallFlow({
  required BuildContext context,
  required ListenerCallArgs args,
}) {
  return Navigator.of(context).push<void>(
    MaterialPageRoute(
      builder: (_) => ListenerCallInstructionScreen(args: args),
    ),
  );
}
