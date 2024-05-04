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
  // Pontuação das duas equipes
  int teamAScore = 0;
  int teamBScore = 0;

  // Flag para indicar se o jogo acabou
  bool gameOver = false;

  // Função para aumentar a pontuação da equipe A
  void increaseScoreA() {
    setState(() {
      // Verifica se o jogo não acabou
      if (!gameOver) {
        teamAScore++;
        // Verifica se a equipe A atingiu a pontuação máxima
        if (teamAScore == 12) {
          gameOver = true; // Define o jogo como encerrado
        }
      }
    });
  }

  // Função para diminuir a pontuação da equipe A
  void decreaseScoreA() {
    setState(() {
      // Verifica se o jogo não acabou e se a pontuação é maior que zero
      if (!gameOver && teamAScore > 0) {
        teamAScore--;
      }
    });
  }

  // Função para aumentar a pontuação da equipe B
  void increaseScoreB() {
    setState(() {
      // Verifica se o jogo não acabou
      if (!gameOver) {
        teamBScore++;
        // Verifica se a equipe B atingiu a pontuação máxima
        if (teamBScore == 12) {
          gameOver = true; // Define o jogo como encerrado
        }
      }
    });
  }

  // Função para diminuir a pontuação da equipe B
  void decreaseScoreB() {
    setState(() {
      // Verifica se o jogo não acabou e se a pontuação é maior que zero
      if (!gameOver && teamBScore > 0) {
        teamBScore--;
      }
    });
  }

  // Função para reiniciar o jogo
  void resetScores() {
    setState(() {
      teamAScore = 0; // Reseta a pontuação da equipe A
      teamBScore = 0; // Reseta a pontuação da equipe B
      gameOver = false; // Define o jogo como não encerrado
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
            // Marcadores de pontuação das duas equipes
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
            // Botões para aumentar ou diminuir a pontuação das equipes
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
            // Botão para reiniciar o jogo quando ele acabar
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
