import 'package:flutter/material.dart';

class AddRecipeView extends StatefulWidget {
  @override
  _AddRecipeViewState createState() => _AddRecipeViewState();
}

class _AddRecipeViewState extends State<AddRecipeView> {
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;
    final deviceHeight = MediaQuery.of(context).size.height;

    List<DropdownMenuItem> _categoryList = [
      DropdownMenuItem(
        child: Text("Etli Yemek"),
        value: "Etli Yemek",
      ),
      DropdownMenuItem(
        child: Text("Çorba"),
        value: "Çorba",
      ),
    ];

    return Container(
      child: Form(
        child: Center(
          child: Container(
            width: deviceWidth * 0.8,
            height: deviceHeight * 0.85,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 25,
                  ),
                  Text(
                    'Yeni Tarif Ekle',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  Column(
                    children: [
                      SizedBox(
                        height: 25,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Tarif Adı'),
                          TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Lütfen burayı doldurun.';
                              }
                              return null;
                            },
                            onChanged: (val) {},
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Kategori"),
                          Container(
                            width: deviceWidth,
                            child: DropdownButton<dynamic>(
                              items: _categoryList,
                              value: 'Etli Yemek',
                              onChanged: (value) {},
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("İçindekiler"),
                          TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Lütfen burayı doldurun.';
                              }
                              return null;
                            },
                            onChanged: (val) {},
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Tarif"),
                          TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Lütfen burayı doldurun.';
                              }
                              return null;
                            },
                            maxLines: 5,
                            onChanged: (val) {},
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Kalori"),
                          TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Lütfen burayı doldurun.';
                              }
                              return null;
                            },
                            keyboardType: TextInputType.number,
                            onChanged: (val) {},
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Hazırlama Süresi"),
                          TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Lütfen burayı doldurun.';
                              }
                              return null;
                            },
                            keyboardType: TextInputType.number,
                            onChanged: (val) {},
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Kaç Kişilik"),
                          TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Lütfen burayı doldurun.';
                              }
                              return null;
                            },
                            keyboardType: TextInputType.number,
                            onChanged: (val) {},
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Karbonhidrat"),
                          TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Lütfen burayı doldurun.';
                              }
                              return null;
                            },
                            keyboardType: TextInputType.number,
                            onChanged: (val) {},
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Protein"),
                          TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Lütfen burayı doldurun.';
                              }
                              return null;
                            },
                            keyboardType: TextInputType.number,
                            onChanged: (val) {},
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Yağ"),
                          TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Lütfen burayı doldurun.';
                              }
                              return null;
                            },
                            keyboardType: TextInputType.number,
                            onChanged: (val) {},
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 25,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Resim"),
                      Row(
                        children: [
                          TextButton(
                            onPressed: () {},
                            child: Text(
                              "Resim Seç",
                              style: TextStyle(color: Colors.white),
                            ),
                            style: TextButton.styleFrom(
                              backgroundColor: Colors.deepOrange,
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Center(
                    child: _isLoading
                        ? CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation<Color>(
                                Colors.deepOrange),
                          )
                        : TextButton(
                            onPressed: () {},
                            child: Text(
                              "Kaydet",
                              style: TextStyle(color: Colors.white),
                            ),
                            style: TextButton.styleFrom(
                              backgroundColor: Colors.deepOrange,
                            ),
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
