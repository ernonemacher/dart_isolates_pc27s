import 'dart:isolate';

void _spawnedTask(List<dynamic> args) {
  final SendPort sendPort = args[0];
  final String input = args[1];
  int total = 0;
  for (int i = 0; i < 100000000; i++) {
    total += i % 7;
  }
  sendPort.send('$input finalizado com total $total');
}

Future<String> spawnHeavyTask(String input) async {
  final receivePort = ReceivePort();
  await Isolate.spawn(_spawnedTask, [receivePort.sendPort, input]);
  return await receivePort.first;
}
