// Make a two-player Rock-Paper-Scissors game against computer.

import 'dart:convert';
import 'dart:io';
import 'dart:math';

enum RPS { rock, paper, scissors }

String emoji(RPS rps) {
  switch (rps) {
    case RPS.rock:
      return '🪨';
    case RPS.paper:
      return '📃';
    case RPS.scissors:
      return '✂️';
  }
}

Future<RPS> player() async {
  var prompt = () => stdout.write('(R)ock, (p)aper, or (s)cissors? ');
  prompt();

  stdin.lineMode = false;
  await for (final key in stdin.transform(const Utf8Decoder())) {
    print('');
    switch (key.toUpperCase()) {
      case 'R':
        stdin.lineMode = true;
        return RPS.rock;
      case 'P':
        stdin.lineMode = true;
        return RPS.paper;
      case 'S':
        stdin.lineMode = true;
        return RPS.scissors;
      default:
        prompt();
    }
  }

  throw Exception('Invalid player input!');
}

RPS opponent() {
  final Random random = Random();
  switch (random.nextInt(3)) {
    case 0:
      return RPS.rock;
    case 1:
      return RPS.paper;
    case 2:
      return RPS.scissors;
    default:
      throw Exception("Invalid opponent play!");
  }
}

bool? play(RPS p, RPS o) {
  switch (p) {
    case RPS.rock:
      switch (o) {
        case RPS.rock:
          return null;
        case RPS.paper:
          return false;
        case RPS.scissors:
          return true;
      }
    case RPS.paper:
      switch (o) {
        case RPS.rock:
          return true;
        case RPS.paper:
          return null;
        case RPS.scissors:
          return false;
      }
    case RPS.scissors:
      switch (o) {
        case RPS.rock:
          return false;
        case RPS.paper:
          return true;
        case RPS.scissors:
          return null;
      }
  }
}

void main() async {
  RPS p = await player();
  print("\nYou played ${p.name}! ${emoji(p)}");

  RPS o = opponent();
  print("Your opponent played ${o.name}! ${emoji(o)}\n");

  bool? winner = play(p, o);
  if (winner != null) {
    winner ? print("You won! 🎉") : print("You lost. 😢");
  } else {
    print('You tied.');
  }
}
