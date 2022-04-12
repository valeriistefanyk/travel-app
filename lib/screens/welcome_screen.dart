import 'package:flutter/material.dart';
import '../misc/colors.dart';
import '../widgets/app_text.dart';
import '../widgets/responsive_button.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  List pages = [
    {
      "image": "welcome-one.png",
      "header": "Подорожі",
      "subheader": "Гори",
      "description":
          "Походи в гори дають неймовірне почуття свободи разом із випробуванням на витривалість",
    },
    {
      "image": "welcome-two.png",
      "header": "Подорожі",
      "subheader": "Гори",
      "description":
          "Походи в гори дають неймовірне почуття свободи разом із випробуванням на витривалість",
    },
    {
      "image": "welcome-three.png",
      "header": "Подорожі",
      "subheader": "Гори",
      "description":
          "Походи в гори дають неймовірне почуття свободи разом із випробуванням на витривалість",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        scrollDirection: Axis.vertical,
        itemCount: pages.length,
        itemBuilder: (_, index) => Container(
          width: double.maxFinite,
          height: double.maxFinite,
          decoration: BoxDecoration(
              image: DecorationImage(
            image: AssetImage('assets/images/' + pages[index]["image"]),
            fit: BoxFit.cover,
          )),
          child: Container(
            margin: const EdgeInsets.only(top: 150, left: 20, right: 20),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppLargeText(pages[index]["header"]),
                      AppText(
                        pages[index]["subheader"],
                        size: 30,
                      ),
                      const SizedBox(height: 10),
                      SizedBox(
                        width: 250,
                        child: AppText(
                          pages[index]["description"],
                          color: AppColors.textColor2,
                        ),
                      ),
                      const SizedBox(height: 40),
                      const ResponsiveButton(
                        width: 120,
                      ),
                    ],
                  ),
                  Column(
                    children: List.generate(
                      pages.length,
                      (indexDots) => Container(
                        margin: const EdgeInsets.only(bottom: 2),
                        width: 8,
                        height: index == indexDots ? 25 : 8,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: index == indexDots
                                ? AppColors.mainColor
                                : AppColors.mainColor.withOpacity(0.3)),
                      ),
                    ),
                  )
                ]),
          ),
        ),
      ),
    );
  }
}
