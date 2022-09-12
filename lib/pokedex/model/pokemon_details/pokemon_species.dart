/// Class that represents a Pokemons Specific Detail
class PokemonSpecies {
  final int id;
  final String url;
  final String name;

  PokemonSpecies({required this.id,
    required this.url,
    required this.name});

  factory PokemonSpecies.fromJson(Map<String, dynamic> json, int id) {
    return PokemonSpecies(
      id: id,
      url: json['url'] ??= "",
      name: json['name'] ??= "No Name Found",
    );
  }

  @override
  String toString() {
    return "url: $url"
        " Name: $name";
  }
}
