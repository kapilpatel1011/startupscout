class IdeaModel {
  int key;
  String name;
  String tagline;
  String category;
  String description;

  IdeaModel({
    required this.key,
    required this.name,
    required this.tagline,
    required this.category,
    required this.description,
  });

  Map<String, dynamic> toJson() {
    return {
      'key': key,
      'name': name,
      'tagline': tagline,
      'category': category,
      'description': description,
    };
  }

  factory IdeaModel.fromJson(Map<String, dynamic> json) {
    return IdeaModel(
      key: json['key'] ?? 0,
      name: json['name'],
      tagline: json['tagline'],
      category: json['category'],
      description: json['description'],
    );
  }
}
