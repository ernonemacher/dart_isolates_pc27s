# Dart Isolate PC29S

Este projeto demonstra três formas distintas de utilizar Isolates em Dart/Flutter para realizar tarefas concorrentes:

- `compute()` — ideal para tarefas leves e pontuais
- `Isolate.spawn()` — para tarefas mais complexas ou isoladas
- Comunicação bidirecional com `SendPort` e `ReceivePort`

## Estrutura do Projeto

```
lib/
├── logic/
│   ├── compute_worker.dart
│   ├── spawn_worker.dart
│   └── bidirectional_worker.dart
├── screens/
│   └── home_screen.dart
└── main.dart
```

## Executando o Projeto

### Pré-requisitos

- Flutter SDK >= 3.0
- Dart SDK >= 3.0

### Passos para executar:

```bash
flutter pub get
flutter run
```

## Explicações Técnicas

### compute()

Utiliza `flutter/foundation.dart` para rodar uma função em outro isolate de forma simplificada. Ideal para operações rápidas e sem estado.

### Isolate.spawn()

Cria uma nova instância de isolate e envia dados de volta via `SendPort`. Adequado para processos intensivos que não bloqueiam a main isolate.

### Comunicação Bidirecional

Cria um canal entre dois isolates com `ReceivePort` e `SendPort`. Permite troca contínua de mensagens entre main e worker isolates.

## Authors

Eduardo Nonemacher
...

## Licença

MIT
