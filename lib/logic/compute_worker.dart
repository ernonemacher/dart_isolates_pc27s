import 'package:flutter/foundation.dart';

String _heavyComputation(String input) {
  int sum = 0;
  for (int i = 0; i < 100000000; i++) {
    sum += i % 5;
  }
  return '$input finalizado com soma $sum';
}

Future<String> computeHeavyTask(String input) async {
  return await compute(_heavyComputation, input);
}
