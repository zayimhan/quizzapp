import 'package:quizapp/data/entity/player.dart';

class Teams {
  final String teamName;
  final List<Player> kadro;

  Teams({
    required this.teamName,
    required this.kadro,
  });

  factory Teams.fromJson(Map<String, dynamic> json) {
    var oyuncularList = json['kadro'] as List<dynamic>? ?? [];
    List<Player> oyuncular = oyuncularList.map((e) => Player.fromJson(e)).toList();

    return Teams(
      teamName: json['teamName'] ?? '',
      kadro: oyuncular,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'teamName': teamName,
      'kadro': kadro.map((e) => e.toJson()).toList(),
    };
  }
}
