import 'dart:io';

void main(List<String> args) async {
  final directory = args.isNotEmpty ? args.first : '.';

  stdout.writeln('Running lint check on $directory...');

  // Run the analyzer
  final analyzerResult = await Process.run('dart', ['analyze', directory]);

  stdout.writeln('\n--- Analyzer Results ---');
  stdout.writeln(analyzerResult.stdout);

  if (analyzerResult.exitCode != 0) {
    stderr.writeln(
      'Analyzer found issues! (exit code: ${analyzerResult.exitCode})',
    );
    exit(1);
  }

  // Run custom lint
  final customLintResult = await Process.run('dart', [
    'run',
    'custom_lint',
    directory,
  ]);

  stdout.writeln('\n--- Custom Lint Results ---');
  stdout.writeln(customLintResult.stdout);

  if (customLintResult.exitCode != 0) {
    stderr.writeln(
      'Custom lint found issues! (exit code: ${customLintResult.exitCode})',
    );
    exit(1);
  }

  stdout.writeln('\nAll lint checks passed!');
  exit(0);
}
