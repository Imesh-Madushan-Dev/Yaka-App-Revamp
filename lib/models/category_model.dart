class Category {
  final int id;
  final int mainId;
  final int freeAddCount;
  final String name;
  final String url;
  final String description;
  final String image;
  final int status;
  final DateTime createdAt;
  final DateTime updatedAt;

  Category({
    required this.id,
    required this.mainId,
    required this.freeAddCount,
    required this.name,
    required this.url,
    required this.description,
    required this.image,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['id'] ?? 0,
      mainId: json['mainId'] ?? 0,
      freeAddCount: json['free_add_count'] ?? 0,
      name: json['name'] ?? '',
      url: json['url'] ?? '',
      description: json['description'] ?? '',
      image: json['image'] ?? '',
      status: json['status'] ?? 0,
      createdAt: DateTime.parse(json['created_at'] ?? ''),
      updatedAt: DateTime.parse(json['updated_at'] ?? ''),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'mainId': mainId,
      'free_add_count': freeAddCount,
      'name': name,
      'url': url,
      'description': description,
      'image': image,
      'status': status,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
    };
  }
}

class CategoryResponse {
  final String status;
  final List<Category> categories;

  CategoryResponse({
    required this.status,
    required this.categories,
  });

  factory CategoryResponse.fromJson(Map<String, dynamic> json) {
    return CategoryResponse(
      status: json['status'] ?? '',
      categories: (json['categories'] as List<dynamic>? ?? [])
          .map((item) => Category.fromJson(item as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'categories': categories.map((category) => category.toJson()).toList(),
    };
  }
}
