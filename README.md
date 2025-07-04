# Dart Isolate PC29S

Este projeto demonstra três formas distintas de utilizar Isolates em Dart/Flutter para realizar tarefas concorrentes:

- `compute()` — ideal para tarefas leves e pontuais
- `Isolate.spawn()` — para tarefas mais complexas ou isoladas
- Comunicação bidirecional com `SendPort` e `ReceivePort`
- **GCD Calculation** — cálculo do Máximo Divisor Comum de 3 números aleatórios

## Estrutura do Projeto

```
lib/
├── logic/
│   ├── compute_worker.dart
│   ├── spawn_worker.dart
│   ├── bidirectional_worker.dart
│   └── gcd_worker.dart
├── screens/
│   └── home_screen.dart
└── main.dart
```

## Funcionalidades

### 1. Processamento de Mensagens

- **compute()**: Processa mensagens usando `flutter/foundation.dart`
- **Isolate.spawn()**: Cria isolate dedicado para processamento
- **Comunicação Bidirecional**: Permite troca contínua de mensagens

### 2. Cálculo de GCD (Máximo Divisor Comum)

- Gera 3 números inteiros aleatórios entre 1 e 1000
- Calcula o GCD usando o algoritmo de Euclides
- Executa o cálculo em isolate separado para não bloquear a UI
- Exibe os números gerados e o resultado do GCD

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

### GCD Calculation

Implementa o algoritmo de Euclides para calcular o GCD de três números:

- Gera números aleatórios usando `dart:math`
- Executa cálculo em isolate separado via `Isolate.spawn()`
- Retorna tanto os números gerados quanto o resultado do GCD

## Authors

Eduardo Nonemacher

## Licença

MIT
