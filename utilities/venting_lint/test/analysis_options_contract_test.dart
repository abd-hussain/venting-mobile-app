import 'dart:io';

import 'package:test/test.dart';
import 'package:yaml/yaml.dart';

/// Guardrail for the shared lint config.
///
/// `lib/analysis_options.yaml` is included by every package in the workspace,
/// so silently dropping a rule or weakening the analyzer settings degrades the
/// whole monorepo at once. This test pins the current configuration as an
/// independent golden: removing any required rule, or weakening the hardened
/// analyzer settings, fails the test. Adding *new* (stricter) rules is allowed
/// and does not require touching this file.
void main() {
  // Lint rules that must always stay enabled in lib/analysis_options.yaml.
  // To intentionally remove one, you must also remove it here — that friction
  // is the point (it forces a conscious, reviewable change).
  const requiredLinterRules = <String>{
    // Error prevention
    'always_declare_return_types',
    'avoid_catching_errors',
    'avoid_empty_else',
    'avoid_print',
    'avoid_private_typedef_functions',
    'avoid_redundant_argument_values',
    'avoid_relative_lib_imports',
    'avoid_shadowing_type_parameters',
    'avoid_types_as_parameter_names',
    'avoid_unused_constructor_parameters',
    'avoid_void_async',
    'await_only_futures',
    'cancel_subscriptions',
    'cast_nullable_to_non_nullable',
    'comment_references',
    'curly_braces_in_flow_control_structures',
    'directives_ordering',
    'empty_catches',
    'no_adjacent_strings_in_list',
    'no_duplicate_case_values',
    'no_runtimeType_toString',
    'noop_primitive_operations',
    'null_check_on_nullable_type_parameter',
    'null_closures',
    'only_throw_errors',
    'prefer_const_constructors',
    'prefer_final_fields',
    'prefer_final_in_for_each',
    'prefer_final_locals',
    'prefer_typing_uninitialized_variables',
    'sized_box_shrink_expand',
    'tighten_type_of_initializing_formals',
    'unawaited_futures',
    'unnecessary_await_in_return',
    'unnecessary_lambdas',
    'unnecessary_null_checks',
    'unnecessary_overrides',
    'unnecessary_parenthesis',
    'unnecessary_raw_strings',
    'unnecessary_statements',
    'unrelated_type_equality_checks',
    'use_colored_box',
    'use_is_even_rather_than_modulo',
    'use_late_for_private_fields_and_variables',
    'use_named_constants',
    'use_setters_to_change_properties',
    'use_string_buffers',
    'use_super_parameters',
    'use_to_and_as_if_applicable',
    'valid_regexps',
    'void_checks',
    // Style
    'always_use_package_imports',
    'camel_case_extensions',
    'camel_case_types',
    'file_names',
    'leading_newlines_in_multiline_strings',
    'prefer_constructors_over_static_methods',
    'prefer_generic_function_type_aliases',
    'prefer_if_elements_to_conditional_expressions',
    'prefer_int_literals',
    'prefer_is_empty',
    'prefer_is_not_empty',
    'prefer_iterable_whereType',
    'prefer_null_aware_method_calls',
    'sort_unnamed_constructors_first',
    'type_annotate_public_apis',
    // Flutter specific
    'avoid_unnecessary_containers',
    'sized_box_for_whitespace',
    'use_build_context_synchronously',
    'use_full_hex_values_for_flutter_colors',
    'use_key_in_widget_constructors',
  };

  late YamlMap sharedOptions;

  setUpAll(() {
    final file = File('lib/analysis_options.yaml');
    expect(
      file.existsSync(),
      isTrue,
      reason: 'lib/analysis_options.yaml is the shared config and must exist',
    );
    sharedOptions = loadYaml(file.readAsStringSync()) as YamlMap;
  });

  YamlMap analyzerSection() => sharedOptions['analyzer'] as YamlMap;

  group('shared lib/analysis_options.yaml', () {
    test('keeps every required lint rule enabled', () {
      final linter = sharedOptions['linter'] as YamlMap?;
      final rules =
          (linter?['rules'] as YamlList?)?.map((e) => e as String).toSet() ??
          const <String>{};

      final missing = requiredLinterRules.difference(rules);
      expect(
        missing,
        isEmpty,
        reason:
            'These required lint rules were removed from the shared config: '
            '$missing',
      );
    });

    test('promotes unnecessary_const to an error', () {
      final errors = analyzerSection()['errors'] as YamlMap?;
      expect(errors?['unnecessary_const'], 'error');
    });

    test('keeps strict language settings enabled', () {
      final language = analyzerSection()['language'] as YamlMap?;
      expect(language?['strict-casts'], isTrue);
      expect(language?['strict-raw-types'], isTrue);
    });

    test('keeps generated and non-source files excluded from analysis', () {
      final exclude =
          (analyzerSection()['exclude'] as YamlList?)
              ?.map((e) => e as String)
              .toSet() ??
          const <String>{};
      expect(
        exclude,
        containsAll(<String>['**/*.g.dart', '**/*.freezed.dart']),
      );
    });
  });

  test('package analysis_options.yaml still includes the shared config', () {
    final root =
        loadYaml(File('analysis_options.yaml').readAsStringSync()) as YamlMap;
    expect(root['include'], 'lib/analysis_options.yaml');
  });
}
