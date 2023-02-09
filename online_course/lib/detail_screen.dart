import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:online_course/constants.dart';

class DetailScreen extends StatelessWidget {
  final String title;
  final String backgroundImage;
  const DetailScreen({super.key, required this.title, required this.backgroundImage});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.topRight,
        decoration: const BoxDecoration(
          color: Color(0xFFF5F4EF),
          image: DecorationImage(
            image: AssetImage("assets/images/ux_big.png"),
          ),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 50, right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                          child:
                              SvgPicture.asset("assets/icons/arrow-left.svg")),
                      SvgPicture.asset("assets/icons/more-vertical.svg"),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  ClipPath(
                    clipper: BestSellerClip(),
                    child: Container(
                      color: commonBestSellerColor,
                      padding: const EdgeInsets.only(
                          left: 10, top: 5, right: 20, bottom: 5),
                      child: const Text(
                        "Best Seller",
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Text(
                    title,
                    style: commonHeadingextStyle,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Row(
                    children: [
                      SvgPicture.asset("assets/icons/person.svg"),
                      const SizedBox(
                        width: 5,
                      ),
                      const Text("18K"),
                      const SizedBox(
                        width: 20,
                      ),
                      SvgPicture.asset("assets/icons/star.svg"),
                      const SizedBox(
                        width: 5,
                      ),
                      const Text("4.8")
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  RichText(
                      text: TextSpan(children: [
                    TextSpan(
                      text: "\$50",
                      style: commonHeadingextStyle.copyWith(fontSize: 32),
                    ),
                    TextSpan(
                      text: "\$70",
                      style: TextStyle(
                        color: commonTextColor.withOpacity(0.5),
                        decoration: TextDecoration.lineThrough,
                      ),
                    )
                  ]))
                ],
              ),
            ),
            const SizedBox(
              height: 60,
            ),
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.white,
                ),
                child: Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          bottom: 100, top: 30, right: 30, left: 30),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              "Course Content",
                              style: commonTitleTextStyle,
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            CourseContent(
                                number: "01",
                                duration: 5.35,
                                title: "Welcome to the Course",
                                isDone: true),
                            CourseContent(
                                number: "02",
                                duration: 15.50,
                                title: "Flutter Begineer - Course",
                                isDone: false),
                            CourseContent(
                                number: "03",
                                duration: 19.35,
                                title: "Flutter Intermediate - Course",
                                isDone: false),
                            CourseContent(
                                number: "04",
                                duration: 25.00,
                                title: "Flutter Advanced - Course",
                                isDone: false),
                            CourseContent(
                                number: "05",
                                duration: 30.00,
                                title: "Flutter Project - Course",
                                isDone: false),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      right: 0,
                      left: 0,
                      bottom: 0,
                      child: Container(
                        height: 100,
                        padding: const EdgeInsets.all(20),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(40),
                          boxShadow: [
                            BoxShadow(
                                offset: const Offset(0, 4),
                                blurRadius: 50,
                                color: commonTextColor.withOpacity(0.1)),
                          ],
                        ),
                        child: Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(14),
                              height: 56,
                              width: 80,
                              decoration: BoxDecoration(
                                color: const Color(0xFFFFEDEE),
                                borderRadius: BorderRadius.circular(40),
                              ),
                              child: SvgPicture.asset(
                                  "assets/icons/shopping-bag.svg"),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Expanded(
                              child: Container(
                                alignment: Alignment.center,
                                height: 56,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(40),
                                  color: commonBlueColor,
                                ),
                                child: Text(
                                  "Buy Now",
                                  style: commonSubtitleTextSyule.copyWith(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CourseContent extends StatelessWidget {
  final String number;
  final double duration;
  final String title;
  final bool isDone;
  const CourseContent({
    super.key,
    required this.number,
    required this.duration,
    required this.title,
    required this.isDone,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 30),
      child: Row(
        children: [
          Text(
            number,
            style: commonHeadingextStyle.copyWith(
              color: commonTextColor.withOpacity(0.15),
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: "$duration mins\n",
                  style: TextStyle(
                      color: commonTextColor.withOpacity(0.5), fontSize: 18),
                ),
                TextSpan(
                  text: title,
                  style: commonSubheadingextStyle.copyWith(
                      fontWeight: FontWeight.w600, fontSize: 16),
                )
              ],
            ),
          ),
          const Spacer(),
          Container(
            margin: const EdgeInsets.only(left: 20),
            height: 40,
            width: 40,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: commonGreenColor.withOpacity(isDone ? 1 : 0.5)),
            child: const Icon(
              Icons.play_arrow,
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}

class BestSellerClip extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    var path = Path();
    path.lineTo(size.width - 10, 0);
    path.lineTo(size.width, size.height / 1);
    path.lineTo(size.width - 10, size.height / 1);
    path.lineTo(0, size.height);
    path.lineTo(0, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) {
    return false;
  }
}
