import 'package:flutter/material.dart';

void main() {
  runApp(const ScoreKeeper());
}

class ScoreKeeper extends StatelessWidget {
  const ScoreKeeper({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: ScoreBoard(),
    );
  }
}

class ScoreBoard extends StatefulWidget {
  const ScoreBoard({super.key});

  @override
  _ScoreBoardState createState() => _ScoreBoardState();
}

class _ScoreBoardState extends State<ScoreBoard> {
  int teamAScore = 0;
  int teamBScore = 0;
  bool gameOver = false;

  void increaseScoreA() {
    setState(() {
      if (!gameOver) {
        teamAScore++;
        if (teamAScore == 12) {
          gameOver = true;
        }
      }
    });
  }

  void decreaseScoreA() {
    setState(() {
      if (!gameOver && teamAScore > 0) {
        teamAScore--;
      }
    });
  }

  void increaseScoreB() {
    setState(() {
      if (!gameOver) {
        teamBScore++;
        if (teamBScore == 12) {
          gameOver = true;
        }
      }
    });
  }

  void decreaseScoreB() {
    setState(() {
      if (!gameOver && teamBScore > 0) {
        teamBScore--;
      }
    });
  }

  void resetScores() {
    setState(() {
      teamAScore = 0;
      teamBScore = 0;
      gameOver = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Marcador de Pontuação'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    const Text(
                      'Equipe A',
                      style: TextStyle(fontSize: 20),
                    ),
                    Text(
                      '$teamAScore',
                      style: const TextStyle(fontSize: 40),
                    ),
                  ],
                ),
                Column(
                  children: [
                    const Text(
                      'Equipe B',
                      style: TextStyle(fontSize: 20),
                    ),
                    Text(
                      '$teamBScore',
                      style: const TextStyle(fontSize: 40),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_upward),
                  onPressed: increaseScoreA,
                ),
                IconButton(
                  icon: const Icon(Icons.arrow_downward),
                  onPressed: decreaseScoreA,
                ),
                IconButton(
                  icon: const Icon(Icons.arrow_upward),
                  onPressed: increaseScoreB,
                ),
                IconButton(
                  icon: const Icon(Icons.arrow_downward),
                  onPressed: decreaseScoreB,
                ),
              ],
            ),
            const SizedBox(height: 20),
            if (gameOver)
              ElevatedButton(
                onPressed: resetScores,
                child: const Text('Reiniciar'),
              ),
          ],
        ),
      ),
    );
  }
}
