// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'dart:convert';

import 'package:cryptography/cryptography.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:zuba_karis/main.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    final algo = Sha256();
    const msg = 'hello';
    final hash = await algo.hash(utf8.encode(msg));
    final algo1 = Sha256();
    const msg1 = 'hello';
    final hash1 = await algo1
        .hash(utf8.encode(msg1))
        .then((value) => value.bytes.toString());
    expect(hash, hash1);
  });
}
