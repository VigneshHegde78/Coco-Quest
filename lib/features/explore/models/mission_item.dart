class MissionItem {
  final String name;
  final String emoji;
  final List<String> keywords;

  bool found;

  MissionItem({
    required this.name,
    required this.emoji,
    required this.keywords,
    this.found = false,
  });
}
