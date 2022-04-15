import 'package:flutter/material.dart';
import '../../misc/colors.dart';
import '../../widgets/app_text.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  List<Map<String, String>> exploringObj = [
    {
      "image": "balloning.png",
      "title": "Balloning",
    },
    {
      "image": "hiking.png",
      "title": "Hiking",
    },
    {
      "image": "kayaking.png",
      "title": "Kayaking",
    },
    {
      "image": "snorkling.png",
      "title": "Snorkling",
    }
  ];

  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 3, vsync: this);

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Icon(Icons.menu, size: 30, color: Colors.black54),
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey.withOpacity(0.5),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              const Padding(
                padding: EdgeInsets.only(left: 20.0),
                child: AppLargeText("Пропозиції"),
              ),
              const SizedBox(height: 20),
              TabBar(
                  controller: _tabController,
                  labelColor: Colors.black,
                  unselectedLabelColor: Colors.grey,
                  isScrollable: true,
                  indicatorSize: TabBarIndicatorSize.label,
                  indicator: const CircleTabIndicator(
                      color: AppColors.mainColor, radius: 4),
                  tabs: const [
                    Tab(text: "Місця"),
                    Tab(text: "Натхнення"),
                    Tab(text: "Емоції"),
                  ]),
              Container(
                padding: const EdgeInsets.only(left: 20),
                height: 300,
                width: double.maxFinite,
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    ListView.builder(
                        itemCount: 3,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Container(
                            margin: const EdgeInsets.only(
                              right: 15,
                              top: 10,
                            ),
                            width: 200,
                            height: 300,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white,
                              image: const DecorationImage(
                                image:
                                    AssetImage("assets/images/mountain.jpeg"),
                                fit: BoxFit.cover,
                              ),
                            ),
                          );
                        }),
                    const Text("The Second Page"),
                    const Text("The Third Page"),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const AppLargeText("Explore more", size: 22),
                    GestureDetector(
                      child: const AppText(
                        "See all",
                        color: AppColors.textColor1,
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Container(
                height: 120,
                width: double.maxFinite,
                margin: const EdgeInsets.only(left: 20),
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: exploringObj.length,
                    itemBuilder: (_, index) => SquareBlockWidget(
                          imagePath:
                              "assets/images/${exploringObj[index]["image"]}",
                          text: exploringObj[index]["title"] as String,
                        )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SquareBlockWidget extends StatelessWidget {
  final String imagePath;
  final String text;

  const SquareBlockWidget({
    required this.imagePath,
    required this.text,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 40),
      child: Column(
        children: [
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
                image: DecorationImage(
                    image: AssetImage(imagePath), fit: BoxFit.cover)),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 3),
            child: AppText(
              text,
              color: AppColors.textColor2,
            ),
          ),
        ],
      ),
    );
  }
}

class CircleTabIndicator extends Decoration {
  final Color color;
  final double radius;
  const CircleTabIndicator({
    required this.color,
    required this.radius,
  });

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _CirclePainter(color: color, radius: radius);
  }
}

class _CirclePainter extends BoxPainter {
  final Color color;
  double radius;
  _CirclePainter({
    required this.color,
    required this.radius,
  });

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    Paint _paint = Paint();
    _paint.color = color;
    _paint.isAntiAlias = true;
    final Offset circleOffset = Offset(
        configuration.size!.width / 2 - radius / 2,
        configuration.size!.height - radius);
    canvas.drawCircle(offset + circleOffset, radius, _paint);
  }
}
