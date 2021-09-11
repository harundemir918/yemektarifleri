import 'package:flutter/material.dart';

final String appName = 'Yemek Tarifleri';

final String apiUrl = 'http://127.0.0.1:8000/api';
final String apiLoginUrl = '$apiUrl/auth/login';
final String apiRegisterUrl = '$apiUrl/auth/signup';
final String apiRecipesUrl = '$apiUrl/recipes';
final String apiRecommendedRecipesUrl = '$apiUrl/recipes/recommended';
final String apiLastAddedRecipesUrl = '$apiUrl/recipes/last-added';

final Color? primaryColor = Colors.deepOrange[500];

final String loginString = 'Giriş Yap';
final String signUpString = 'Kayıt Ol';
final String createNewAccountString = 'Yeni hesap oluşturun';
final String loginToYourAccountString = 'Hesabınıza giriş yapın';
final String doNotYouHaveAnAccountString = 'Hesabınız yok mu? Kayıt olun.';
final String doYouHaveAnAccountString = 'Hesabınız var mı? Giriş yapın.';
final String emailString = 'EMAİL';
final String passwordString = 'ŞİFRE';
final String passwordAgainString = 'ŞİFRE (TEKRAR)';

final String lastAddedRecipesString = 'Son Eklenen Tarifler';
final String categoriesString = 'Kategoriler';
final String recommendedString = 'Tavsiye edilenler';
final String seeAllString = 'Hepsini Gör';
final String caloriesUnitString = 'kcal';
final String durationUnitString = 'dk';
final String personUnitString = 'kişi';
final String ingredientsString = 'İçindekiler';
final String nutritionFactsString = 'Besin Değerleri';
final String carbohydrateTitleString = 'Karbonhidrat';
final String carbohydrateUnitString = 'g';
final String proteinTitleString = 'Protein';
final String proteinUnitString = 'g';
final String fatTitleString = 'Yağ';
final String fatUnitString = 'g';
