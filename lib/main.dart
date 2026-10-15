import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const DiceGame(),
    );
  }
}

class DiceGame extends StatefulWidget {
  const DiceGame({super.key});

  @override
  State<DiceGame> createState() => _DiceGameState();
}

class _DiceGameState extends State<DiceGame> {
  int player1 = 1;
  int player2 = 1;

  String winner = '?';

  void startGame() {
    setState(() {
      player1 = Random().nextInt(6) + 1;
      player2 = Random().nextInt(6) + 1;

      if (player1 > player2) {
        winner = 'Player 1';
      } else if (player2 > player1) {
        winner = 'Player 2';
      } else {
        winner = 'Draw';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        centerTitle: true,
        elevation: 5,
        title: const Text(
          'Dice Game',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.tealAccent.shade700,

        child: Column(
          children: [

            const SizedBox(height: 30),

            // Winner
            Text(
              'Winner: $winner',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 35),

            // Player names
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                Text(
                  'Player 1',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                Text(
                  'Player 2',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 15),

            // Dice
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                DiceFace(number: player1),
                DiceFace(number: player2),
              ],
            ),

            const SizedBox(height: 15),

            // Numbers
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  '$player1',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                Text(
                  '$player2',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 40),

            // START button
            ElevatedButton(
              onPressed: startGame,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(
                  horizontal: 50,
                  vertical: 16,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: const Text(
                'START',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


// -------------------------
// DICE FACE
// -------------------------

class DiceFace extends StatelessWidget {
  final int number;

  const DiceFace({
    super.key,
    required this.number,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 150,

      // ONE box around the dice
      decoration: BoxDecoration(
        color: Colors.teal,
        border: Border.all(
          color: Colors.white,
          width: 8,
        ),
        borderRadius: BorderRadius.circular(5),
      ),

      child: Padding(
        padding: const EdgeInsets.all(15),

        child: GridView.count(
          crossAxisCount: 3,
          physics: const NeverScrollableScrollPhysics(),

          children: [
            Dot(show: _showDot(number, 0)),
            Dot(show: _showDot(number, 1)),
            Dot(show: _showDot(number, 2)),

            Dot(show: _showDot(number, 3)),
            Dot(show: _showDot(number, 4)),
            Dot(show: _showDot(number, 5)),

            Dot(show: _showDot(number, 6)),
            Dot(show: _showDot(number, 7)),
            Dot(show: _showDot(number, 8)),
          ],
        ),
      ),
    );
  }

  bool _showDot(int number, int position) {
    const dicePositions = {
      1: [4],
      2: [0, 8],
      3: [0, 4, 8],
      4: [0, 2, 6, 8],
      5: [0, 2, 4, 6, 8],
      6: [0, 2, 3, 5, 6, 8],
    };

    return dicePositions[number]!.contains(position);
  }
}


// -------------------------
// DOT
// -------------------------

class Dot extends StatelessWidget {
  final bool show;

  const Dot({
    super.key,
    required this.show,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: show
          ? Container(
              width: 20,
              height: 20,
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
            )
          : const SizedBox(),
    );
  }
}

