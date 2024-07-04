class Card {
  const Card({
    required this.title,
    required this.type,
    required this.description,
    required this.imagePath,
    required this.tags,
  });

  final String title;
  final String type;
  final String description;
  final String imagePath;
  final List<String> tags;
}
