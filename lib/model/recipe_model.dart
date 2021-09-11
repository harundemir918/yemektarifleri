class RecipeModel {
  int? id;
  int? userId;
  int? category;
  String? title;
  String? ingredients;
  String? recipe;
  String? calories;
  String? duration;
  String? person;
  String? carbohydrate;
  String? protein;
  String? fat;
  int? active;
  int? recommended;
  String? picture;
  String? createdAt;
  String? updatedAt;

  RecipeModel({
    this.id,
    this.userId,
    this.category,
    this.title,
    this.ingredients,
    this.recipe,
    this.calories,
    this.duration,
    this.person,
    this.carbohydrate,
    this.protein,
    this.fat,
    this.active,
    this.recommended,
    this.picture,
    this.createdAt,
    this.updatedAt,
  });

  RecipeModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    category = json['category'];
    title = json['title'];
    ingredients = json['ingredients'];
    recipe = json['recipe'];
    calories = json['calories'];
    duration = json['duration'];
    person = json['person'];
    carbohydrate = json['carbohydrate'];
    protein = json['protein'];
    fat = json['fat'];
    active = json['active'];
    recommended = json['recommended'];
    picture = json['picture'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['category'] = this.category;
    data['title'] = this.title;
    data['ingredients'] = this.ingredients;
    data['recipe'] = this.recipe;
    data['calories'] = this.calories;
    data['duration'] = this.duration;
    data['person'] = this.person;
    data['carbohydrate'] = this.carbohydrate;
    data['protein'] = this.protein;
    data['fat'] = this.fat;
    data['active'] = this.active;
    data['recommended'] = this.recommended;
    data['picture'] = this.picture;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
