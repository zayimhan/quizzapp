class Player {
  final String isim;
  final String pozisyon;
  final String dogumTarihi;
  final String piyasaDegeri;
  final String formaNumarasi;
  final String fotograf;
  final bool popularForGame;

  Player({
    required this.isim,
    required this.pozisyon,
    required this.dogumTarihi,
    required this.piyasaDegeri,
    required this.formaNumarasi,
    required this.fotograf,
    required this.popularForGame,
  });

  factory Player.fromJson(Map<String, dynamic> json) {
    return Player(
      isim: json['isim'] ?? '',
      pozisyon: json['pozisyon'] ?? '',
      dogumTarihi: json['doğumTarihi'] ?? '',
      piyasaDegeri: json['piyasaDeğeri'] ?? '',
      formaNumarasi: json['formaNumarası'] ?? '',
      fotograf: json['fotoğraf'] ?? '',
      popularForGame: json['popularForGame'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'isim': isim,
      'pozisyon': pozisyon,
      'doğumTarihi': dogumTarihi,
      'piyasaDeğeri': piyasaDegeri,
      'formaNumarası': formaNumarasi,
      'fotoğraf': fotograf,
      'popularForGame': popularForGame,
    };
  }
}
