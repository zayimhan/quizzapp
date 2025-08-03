import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quizapp/data/entity/player.dart';
import 'package:quizapp/ui/cubit/game_cubit.dart';
import 'package:quizapp/ui/pages/qr_generator.dart';

class Game extends StatefulWidget {
  const Game({super.key});

  @override
  State<Game> createState() => _GameState();
}

class _GameState extends State<Game> {
  @override
  void initState() {
    super.initState();
    context.read<GameCubit>().randomPlayer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green.shade100,
      appBar: AppBar(
        title: const Text(
          "Random Player Quiz",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.green.shade800,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const QRGenerator()),
              );
            },
            icon: const Icon(Icons.qr_code, color: Colors.white),
            tooltip: 'Generate QR Code',
          ),
        ],
      ),
      body: Center(
        child: BlocBuilder<GameCubit, Player?>(
          builder: (context, player) {
            if (player == null) {
              return const CircularProgressIndicator();
            }

            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: SizedBox(
                height: 600,
                width: 400,
                child: Card(
                  elevation: 6,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: SizedBox(
                            height: 300,
                            width: 200,
                            child: Image.network(
                              player.fotograf,
                              width: 100,
                              height: 100,
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) => const Icon(Icons.error),
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),
                        Text(player.isim, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                        const SizedBox(height: 8),
                        Text("Pozisyon: ${player.pozisyon}"),
                        Text("Forma No: ${player.formaNumarasi}"),
                        Text("Doğum Tarihi: ${player.dogumTarihi}"),
                        Text("Piyasa Değeri: ${player.piyasaDegeri}"),
                        const SizedBox(height: 20),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton.icon(
                            onPressed: () {
                              context.read<GameCubit>().randomPlayer();
                            },
                            icon: const Icon(Icons.refresh, color: Colors.white),
                            label: const Text(
                              'Next Player',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green.shade700,
                              padding: const EdgeInsets.symmetric(vertical: 12),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
