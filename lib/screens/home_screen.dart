import 'package:flutter/material.dart';
import '../../logic/compute_worker.dart';
import '../../logic/spawn_worker.dart';
import '../../logic/bidirectional_worker.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _messageController = TextEditingController(text: 'mensagem teste');

  void _showResult(BuildContext context, String method, String result) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text('Resultado - $method'),
        content: Text(result),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Fechar'),
          ),
        ],
      ),
    );
  }

  Future<void> _handleCompute(BuildContext context) async {
    final result = await computeHeavyTask(_messageController.text);
    _showResult(context, 'compute()', result);
  }

  Future<void> _handleSpawn(BuildContext context) async {
    final result = await spawnHeavyTask(_messageController.text);
    _showResult(context, 'Isolate.spawn()', result);
  }

  Future<void> _handleBidirectional(BuildContext context) async {
    final result = await runWithCommunication(_messageController.text);
    _showResult(context, 'Bidirectional', result);
  }

  @override
  void dispose() {
    _messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Dart Isolate PC27S')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: _messageController,
                decoration: const InputDecoration(
                  labelText: 'Mensagem para processar',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => _handleCompute(context),
                child: const Text('Executar com compute()'),
              ),
              const SizedBox(height: 12),
              ElevatedButton(
                onPressed: () => _handleSpawn(context),
                child: const Text('Executar com Isolate.spawn()'),
              ),
              const SizedBox(height: 12),
              ElevatedButton(
                onPressed: () => _handleBidirectional(context),
                child: const Text('Executar com comunicação bidirecional'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
