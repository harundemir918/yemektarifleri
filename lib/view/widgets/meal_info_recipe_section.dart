import 'package:flutter/material.dart';

class MealInfoRecipeSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;
    final deviceHeight = MediaQuery.of(context).size.height;

    return Container(
      width: deviceWidth * 0.9,
      margin: EdgeInsets.symmetric(
        horizontal: deviceWidth * 0.05,
        vertical: deviceHeight * 0.025,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.description_outlined),
              SizedBox(
                width: 5,
              ),
              Text(
                'Tarif',
                style: Theme.of(context)
                    .textTheme
                    .bodyText1!
                    .copyWith(fontSize: 17),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            'Tavuk etini kuşbaşı doğrayın.\nSoğanları yemeklik, biberleri julyen doğrayın, domatesleri de küp küp doğrayın.\nKısık ateşte tavukları arada karıştırarak kavurun.\nSuyunu biraz çektikten sonra soğanları ve ince kesilmiş sarımsağı ekleyin.\n1-2 dk kavurduktan sonra biberleri ilave edin.\nBiberler de sotelenince domatesi, salçayı, baharatları ve tuzu ekleyip pişirmeye devam edin.\nSon olarak 1 bardak suyu ekleyin ve etler pişene kadar kapağı kapalı bir şekilde pişirin.',
            textAlign: TextAlign.justify,
          ),
        ],
      ),
    );
  }
}
