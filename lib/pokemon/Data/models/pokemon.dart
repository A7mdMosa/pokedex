extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }
}

class Pokemon {
  int id;
  String name;
  String types;
  String imageUrl;
  int height;
  int weight;
  int hp;
  int attack;
  int defense;
  int specialAttack;
  int specialDefense;
  int speed;

  Pokemon({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.height,
    required this.weight,
    required this.types,
    required this.hp,
    required this.attack,
    required this.defense,
    required this.specialAttack,
    required this.specialDefense,
    required this.speed,
  });

  factory Pokemon.fromJson(Map<String, dynamic> json) {
    List<String> types = [];
    json['types'].forEach((e) {
      types.add(e['type']['name'].toString().capitalize());
    });

    return Pokemon(
      id: json['id'],
      name: json['name'].toString().capitalize(),
      imageUrl: json['sprites']['other']['official-artwork']['front_default'],
      height: json['height'],
      weight: json['weight'],
      types: types.join(', '),
      hp: json['stats'][0]['base_stat'],
      attack: json['stats'][1]['base_stat'],
      defense: json['stats'][2]['base_stat'],
      specialAttack: json['stats'][3]['base_stat'],
      specialDefense: json['stats'][4]['base_stat'],
      speed: json['stats'][5]['base_stat'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'imageUrl': imageUrl,
      'height': height,
      'weight': weight,
      'types': types,
      'hp': hp,
      'attack': attack,
      'defense': defense,
      'specialAttack': specialAttack,
      'specialDefense': specialDefense,
      'speed': speed,
    };
  }

  factory Pokemon.fromSharedPrefJson(Map<String, dynamic> json) {
    return Pokemon(
      id: json['id'],
      name: json['name'],
      imageUrl: json['imageUrl'],
      height: json['height'],
      weight: json['weight'],
      types: json['types'],
      hp: json['hp'],
      attack: json['attack'],
      defense: json['defense'],
      specialAttack: json['specialAttack'],
      specialDefense: json['specialDefense'],
      speed: json['speed'],
    );
  }
}
