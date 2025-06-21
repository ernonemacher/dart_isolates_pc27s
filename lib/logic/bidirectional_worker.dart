import 'dart:isolate';
import 'dart:convert';

void _worker(List<dynamic> args) {
  final SendPort replyTo = args[0];
  final SendPort responseTo = args[1];
  final ReceivePort workerPort = ReceivePort();
  replyTo.send(workerPort.sendPort);

  workerPort.listen((message) {
    final input = message as String;
    final result = utf8.encode(input).fold(0, (sum, byte) => sum + byte);
    final croppedInput =
        input.length > 10 ? '${input.substring(0, 10)}...' : input;
    responseTo.send('soma dos bytes de "$croppedInput" = $result');
  });
}

Future<String> runWithCommunication(String message) async {
  final mainReceivePort = ReceivePort();
  final responsePort = ReceivePort();

  await Isolate.spawn(
      _worker, [mainReceivePort.sendPort, responsePort.sendPort]);

  final SendPort workerSendPort = await mainReceivePort.first;
  workerSendPort.send(message);
  final response = await responsePort.first;
  mainReceivePort.close();
  responsePort.close();
  return response as String;
}
