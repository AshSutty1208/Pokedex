/// Class that represents a Pokemon
class PokemonDetail {
  final int? id;
  final String? name;

  PokemonDetail({this.id,
    this.name});

  factory PokemonDetail.fromJson(Map<String, dynamic> json) {
    return PokemonDetail(id: json['id'] as int,
        name: json['name'] as String?);
  }
}