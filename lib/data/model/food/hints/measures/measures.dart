class Measures {
  String uri;
  String label;
  double weight;


  Measures({
      required this.uri,
      required this.label,
      required this.weight
      });

  factory Measures.fromJson(Map<String, dynamic> jsonData) {
    return Measures(
        uri: jsonData['uri'] ?? '',
        label: jsonData['label'] ?? '',
        weight: jsonData['weight'] ?? 0.0,
        );
  }
}
