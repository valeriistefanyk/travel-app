import 'package:flutter/material.dart';
import 'package:travel_app/misc/colors.dart';
import 'package:travel_app/widgets/app_buttons.dart';
import 'package:travel_app/widgets/app_text.dart';
import 'package:travel_app/widgets/responsive_button.dart';
import '../widgets/appbar_widget.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  var detailData = {
    "title": "Yosemite",
    "price": "\$ 250",
    "location": "USA, California",
    "rating": 4.32,
    "maximum_number_of_people": 5,
    "description":
        "Yosemite National Park is located in central Sierra Nevada in the US state of California. It is located near the wild protected areas.",
  };

  var numberPeopleIndexChosen = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(children: [
          Image.asset(
            "assets/images/mountain.jpeg",
            height: 300,
            width: double.maxFinite,
            fit: BoxFit.cover,
            alignment: Alignment.topCenter,
          ),
          AppBarWidget(
            leftIconPressed: () {},
            iconColor: Colors.white,
            rightAction: const Icon(
              Icons.menu,
              color: Colors.white,
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 260),
            height: double.maxFinite,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
            ),
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 15,
                ),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          AppLargeText(detailData["title"] as String),
                          AppLargeText(
                            detailData["price"] as String,
                            color: AppColors.mainColor,
                          ),
                        ],
                      ),
                      const SizedBox(height: 5),
                      Row(
                        children: [
                          const Icon(
                            Icons.location_on,
                            size: 20,
                            color: AppColors.mainColor,
                          ),
                          const SizedBox(width: 5),
                          AppText(
                            detailData["location"] as String,
                            color: AppColors.mainColor,
                          ),
                        ],
                      ),
                      const SizedBox(height: 5),
                      Row(
                        children: [
                          Wrap(
                            children:
                                getRatingStar(detailData["rating"] as double),
                          ),
                          const SizedBox(width: 5),
                          AppText(
                              "(${(detailData["rating"] as double).toStringAsFixed(1)})")
                        ],
                      ),
                      const SizedBox(height: 20),
                      const AppLargeText("Люди", size: 24),
                      const AppText("Оберіть кількість людей у групі"),
                      const SizedBox(height: 10),
                      SizedBox(
                          height: 50,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount:
                                detailData["maximum_number_of_people"] as int,
                            itemBuilder: (_, index) => Padding(
                              padding: const EdgeInsets.only(right: 10),
                              child: AppButtons(
                                  onTap: () => choiceOfNumberOfPeople(index),
                                  text: (index + 1).toString(),
                                  color: numberPeopleIndexChosen == index
                                      ? Colors.white
                                      : AppColors.textColor2,
                                  backgroundColor:
                                      numberPeopleIndexChosen == index
                                          ? Colors.black87
                                          : AppColors.buttonBackground,
                                  borderColor: numberPeopleIndexChosen == index
                                      ? Colors.black87
                                      : AppColors.buttonBackground),
                            ),
                          )),
                      const SizedBox(height: 20),
                      const AppLargeText("Опис", size: 24),
                      AppText(detailData["description"] as String),
                      const SizedBox(height: 20),
                      Row(
                        children: [
                          AppButtons(
                            onTap: () {},
                            size: 60,
                            color: AppColors.mainColor,
                            borderColor: AppColors.mainColor,
                            backgroundColor: Colors.transparent,
                            isIcon: true,
                            icon: Icons.favorite_border,
                          ),
                          const SizedBox(width: 15),
                          ResponsiveButton(
                            onTap: () {},
                            isResponsive: true,
                          ),
                        ],
                      )
                    ]),
              ),
            ),
          ),
        ]),
      ),
    );
  }

  void choiceOfNumberOfPeople(index) {
    setState(() {
      numberPeopleIndexChosen = index;
    });
  }

  List<Icon> getRatingStar(double rating) {
    return List.generate(
      5,
      (index) => rating / (index + 1) >= 1
          ? Icon(
              Icons.star,
              color: Colors.yellow[700],
            )
          : Icon(
              Icons.star_border,
              color: Colors.grey[400],
            ),
    );
  }
}
