import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:provider/provider.dart';

import '../../constants.dart';
import '../../model/recipe_model.dart';
import '../../service/api.dart';
import '../../viewmodel/category_list_view_model.dart';
import '../../viewmodel/recipe_list_view_model.dart';
import '../camera/camera_preview_screen.dart';

class EditRecipeView extends StatefulWidget {
  final recipe;

  EditRecipeView(this.recipe);

  @override
  State<EditRecipeView> createState() => _EditRecipeViewState();
}

class _EditRecipeViewState extends State<EditRecipeView> {
  final _formKey = GlobalKey<FormBuilderState>();
  int userId = 0;
  bool _isLoading = false;
  bool _isPictureLoading = false;
  String _picture = '';

  @override
  void initState() {
    Provider.of<CategoryListViewModel>(context, listen: false)
        .getAllCategories();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;
    final deviceHeight = MediaQuery.of(context).size.height;
    var categoryViewModel = Provider.of<CategoryListViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Tarif Düzenle',
          style: Theme.of(context).textTheme.headline6,
        ),
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Center(
        child: Container(
          margin: EdgeInsets.symmetric(
            horizontal: deviceWidth * 0.1,
            vertical: deviceHeight * 0.025,
          ),
          child: SingleChildScrollView(
            child: FormBuilder(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 25),
                  Text('Tarif Adı'),
                  FormBuilderTextField(
                    name: 'title',
                    initialValue: widget.recipe.title,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Lütfen burayı doldurun.';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 25),
                  Text('Kategori'),
                  FormBuilderDropdown(
                    name: 'category',
                    hint: Text('Select a category'),
                    initialValue: widget.recipe.category,
                    items: categoryViewModel.allCategories
                        .map(
                          (category) => DropdownMenuItem<dynamic>(
                            value: category.id!,
                            child: Text(category.title!),
                          ),
                        )
                        .toList(),
                  ),
                  SizedBox(height: 25),
                  Text('İçindekiler'),
                  FormBuilderTextField(
                    name: 'ingredients',
                    maxLines: 5,
                    initialValue: widget.recipe.ingredients,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Lütfen burayı doldurun.';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 25),
                  Text('Tarif'),
                  FormBuilderTextField(
                    name: 'recipe',
                    initialValue: widget.recipe.recipe,
                    maxLines: 5,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Lütfen burayı doldurun.';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 25),
                  Text('Kalori'),
                  FormBuilderTextField(
                    name: 'calories',
                    initialValue: widget.recipe.calories,
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Lütfen burayı doldurun.';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 25),
                  Text('Hazırlama Süresi'),
                  FormBuilderTextField(
                    name: 'duration',
                    initialValue: widget.recipe.duration,
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Lütfen burayı doldurun.';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 25),
                  Text('Kaç Kişilik'),
                  FormBuilderTextField(
                    name: 'person',
                    initialValue: widget.recipe.person,
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Lütfen burayı doldurun.';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 25),
                  Text('Karbonhidrat'),
                  FormBuilderTextField(
                    name: 'carbohydrate',
                    initialValue: widget.recipe.carbohydrate,
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Lütfen burayı doldurun.';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 25),
                  Text('Protein'),
                  FormBuilderTextField(
                    name: 'protein',
                    initialValue: widget.recipe.protein,
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Lütfen burayı doldurun.';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 25),
                  Text('Yağ'),
                  FormBuilderTextField(
                    name: 'fat',
                    initialValue: widget.recipe.fat,
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Lütfen burayı doldurun.';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 25),
                  Text("Resim"),
                  Row(
                    children: [
                      TextButton(
                        onPressed: () {
                          setState(() {
                            _isPictureLoading = true;
                          });
                          CameraPreviewScreen().takePicture().then(
                                (value) => setState(() {
                                  _picture = value!.path;
                                  _isPictureLoading = false;
                                }),
                              );
                        },
                        child: Text(
                          "Resim Seç",
                          style: TextStyle(color: Colors.white),
                        ),
                        style: TextButton.styleFrom(
                          backgroundColor: primaryColor,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      _isPictureLoading
                          ? SizedBox(
                              height: 15,
                              width: 15,
                              child: CircularProgressIndicator(
                                valueColor: AlwaysStoppedAnimation<Color?>(
                                    primaryColor),
                              ),
                            )
                          : _picture.isNotEmpty
                              ? Icon(
                                  Icons.done,
                                  color: Colors.green,
                                )
                              : Container(),
                    ],
                  ),
                  Center(
                    child: !_isLoading
                        ? ElevatedButton(
                            onPressed: () async {
                              userId = await Api().getId();
                              setState(() {
                                _isLoading = true;
                              });
                              var recipeViewModel =
                                  Provider.of<RecipeListViewModel>(
                                context,
                                listen: false,
                              );

                              final _recipeForm = _formKey.currentState;
                              final isValid = _recipeForm?.validate();
                              if (isValid != null && isValid) {
                                _recipeForm?.save();
                              }
                              final _recipe = RecipeModel()
                                ..id = widget.recipe.id
                                ..title = _recipeForm?.fields['title']!.value
                                ..category =
                                    _recipeForm?.fields['category']!.value
                                ..ingredients =
                                    _recipeForm?.fields['ingredients']!.value
                                ..recipe = _recipeForm?.fields['recipe']!.value
                                ..calories =
                                    _recipeForm?.fields['calories']!.value
                                ..duration =
                                    _recipeForm?.fields['duration']!.value
                                ..person = _recipeForm?.fields['person']!.value
                                ..carbohydrate =
                                    _recipeForm?.fields['carbohydrate']!.value
                                ..protein =
                                    _recipeForm?.fields['protein']!.value
                                ..fat = _recipeForm?.fields['fat']!.value
                                ..picture = _picture.isNotEmpty
                                    ? _picture
                                    : widget.recipe.picture;
                              FocusScope.of(context).unfocus();
                              bool isLoaded = await recipeViewModel
                                  .updateRecipe(userId, _recipe);
                              if (isLoaded) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text('Güncelleme başarılı.'),
                                    duration: Duration(seconds: 1),
                                  ),
                                );
                                Navigator.pop(context);
                                setState(() {
                                  _isLoading = false;
                                });
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text('Bir hata oluştu.'),
                                    duration: Duration(seconds: 1),
                                  ),
                                );
                                setState(() {
                                  _isLoading = false;
                                });
                              }
                            },
                            style:
                                ElevatedButton.styleFrom(primary: primaryColor),
                            child: Text('Kaydet'),
                          )
                        : CircularProgressIndicator(
                            valueColor:
                                AlwaysStoppedAnimation<Color?>(primaryColor),
                          ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
