import '../model/recipe_model.dart';

class RecipeViewModel {
  RecipeModel? _recipeModel;

  RecipeViewModel({RecipeModel? recipe}) : _recipeModel = recipe;

  int? get id {
    return _recipeModel?.id;
  }

  String? get title {
    return _recipeModel?.title;
  }

  int? get category {
    return _recipeModel?.category;
  }

  String? get ingredients {
    return _recipeModel?.ingredients;
  }

  String? get recipe {
    return _recipeModel?.recipe;
  }

  String? get calories {
    return _recipeModel?.calories;
  }

  String? get duration {
    return _recipeModel?.duration;
  }

  String? get person {
    return _recipeModel?.person;
  }

  String? get carbohydrate {
    return _recipeModel?.carbohydrate;
  }

  String? get protein {
    return _recipeModel?.protein;
  }

  String? get fat {
    return _recipeModel?.fat;
  }

  int? get recommended {
    return _recipeModel?.recommended;
  }

  String? get picture {
    return _recipeModel?.picture;
  }
}
