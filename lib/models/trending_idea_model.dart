class TrendingIdeaModel {
  String id;
  String name;
  String tagline;
  String description;
  int rating;
  String aiFeedback;
  int upvotes;
  String category;
  bool isUpvoted;

  DateTime createdAt;

  TrendingIdeaModel({
    required this.id,
    required this.name,
    required this.tagline,
    required this.description,
    required this.rating,
    required this.aiFeedback,
    required this.category,
    this.upvotes = 0,
    this.isUpvoted = false,
    required this.createdAt,
  });

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'tagline': tagline,
    'description': description,
    'rating': rating,
    'aiFeedback': aiFeedback,
    'upvotes': upvotes,
    'category': category,
    'isUpvoted': isUpvoted,
    'createdAt': createdAt.toIso8601String(),
  };

  factory TrendingIdeaModel.fromJson(Map<String, dynamic> json) => TrendingIdeaModel(
    id: json['id'],
    name: json['name'],
    tagline: json['tagline'],
    description: json['description'],
    rating: json['rating'],
    aiFeedback: json['aiFeedback'],
    upvotes: json['upvotes'],
    isUpvoted: json['isUpvoted'],
    category: json['category'],
    createdAt: DateTime.parse(json['createdAt']),
  );
}