import '../constants.dart';
import '../model/category_model.dart';

class CategoryViewModel {
  CategoryModel? _categoryModel;

  CategoryViewModel({CategoryModel? category}) : _categoryModel = category;

  int? get id {
    return _categoryModel?.id;
  }

  String? get title {
    return _categoryModel?.title;
  }

  String? get picture {
    return '$apiCategoryImagesUrl/${_categoryModel?.picture}';
  }
}
