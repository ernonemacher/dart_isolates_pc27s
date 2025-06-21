import 'dart:isolate';
import 'dart:math';

int gcd(int a, int b) {
  while (b != 0) {
    int temp = b;
    b = a % b;
    a = temp;
  }
  return a;
}

int gcdOfThree(int a, int b, int c) {
  return gcd(gcd(a, b), c);
}

void _gcdWorker(SendPort sendPort) {
  final random = Random();
  final numbers = List.generate(3, (_) => random.nextInt(1000) + 1);

  final result = gcdOfThree(numbers[0], numbers[1], numbers[2]);

  sendPort.send({
    'numbers': numbers,
    'gcd': result,
  });
}

Future<Map<String, dynamic>> calculateGCD() async {
  final receivePort = ReceivePort();

  await Isolate.spawn(_gcdWorker, receivePort.sendPort);

  final result = await receivePort.first as Map<String, dynamic>;
  receivePort.close();

  return result;
}

Future<Map<String, dynamic>> calculateGCDWithCompute() async {
  final random = Random();
  final numbers = List.generate(3, (_) => random.nextInt(1000) + 1);

  final gcd = await Isolate.run(() {
    return gcdOfThree(numbers[0], numbers[1], numbers[2]);
  });

  return {
    'numbers': numbers,
    'gcd': gcd,
  };
}
