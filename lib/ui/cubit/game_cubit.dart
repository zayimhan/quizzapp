import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quizapp/data/entity/player.dart';

class GameCubit extends Cubit<Player?> {
  GameCubit() : super(null);

  final _teamsCollection = FirebaseFirestore.instance.collection("teams");
  final _random = Random();

  Future<void> randomPlayer() async {
    try {
      // 🔹 1. Tüm takımları çek
      final teamsSnapshot = await _teamsCollection.get();

      if (teamsSnapshot.docs.isEmpty) {
        throw Exception("Veritabanında takım bulunamadı.");
      }

      // 🔹 2. Random bir takım seç
      final randomTeamDoc = teamsSnapshot.docs[_random.nextInt(teamsSnapshot.docs.length)];
      final teamData = randomTeamDoc.data();

      // 🔹 3. Kadro listesini al
      final kadro = teamData['kadro'] as List<dynamic>?;

      if (kadro == null || kadro.isEmpty) {
        throw Exception("Seçilen takımın kadrosu boş.");
      }

      // 🔹 4. Kadrodan random oyuncu seç
      final randomPlayerJson = kadro[_random.nextInt(kadro.length)] as Map<String, dynamic>;
      final selectedPlayer = Player.fromJson(randomPlayerJson);

      // 🔹 5. Seçilen oyuncuyu state olarak yay
      emit(selectedPlayer);

    } catch (e) {
      print("Hata oluştu: $e");
      emit(null); // null göndererek fallback davranışı sağlanabilir
    }
  }
}
