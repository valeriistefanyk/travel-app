import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_app/cubit/app_cubits.dart';
import 'package:travel_app/misc/colors.dart';
import 'package:travel_app/widgets/app_buttons.dart';
import 'package:travel_app/widgets/app_text.dart';
import 'package:travel_app/widgets/responsive_button.dart';
import '../cubit/app_cubit_states.dart';
import '../widgets/appbar_widget.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  var numberPeopleIndexChosen = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: BlocBuilder<AppCubits, CubitStates>(builder: (context, state) {
        final detail = state as DetailState;
        return Stack(children: [
          Image.asset(
            "assets/images/uploads/${detail.place.img}",
            height: 300,
            width: double.maxFinite,
            fit: BoxFit.cover,
            alignment: Alignment.topCenter,
          ),
          AppBarWidget(
            leftIcon: Icons.arrow_back,
            leftIconPressed: () {
              BlocProvider.of<AppCubits>(context).goHome();
            },
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
                          AppLargeText(detail.place.name),
                          AppLargeText(
                            detail.place.priceWithCurrency,
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
                            detail.place.location,
                            color: AppColors.mainColor,
                          ),
                        ],
                      ),
                      const SizedBox(height: 5),
                      Row(
                        children: [
                          Wrap(
                            children:
                                getRatingStar(detail.place.stars.toDouble()),
                          ),
                          const SizedBox(width: 5),
                          AppText(
                              "(${(detail.place.stars.toDouble()).toStringAsFixed(1)})")
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
                            itemCount: detail.place.people,
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
                      AppText(detail.place.description),
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
        ]);
      })),
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
