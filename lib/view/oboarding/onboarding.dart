import 'package:bsv_new/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../constants/onboardContent.dart';
import '../auth/login.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({super.key});

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  final List<Content> content = [
    Content(
      image: "assets/svg/Group1.svg",
      heading: "Leading Brand and Social Media Analytics Platform",
      text1:
      "Build Brand Personas that Match Your Customers and Test How Your Social Media Content Affects the Relationship between your Brand and Customers.",
      text2:
      "The unique AI-powered algorithm examines the content and framing of your messages and develops recommendations so you always have a winning solution",
    ),
    Content(
      image: "assets/svg/Group2.svg",
      heading: "Create a Brand Persona",
      text1:
      "Fill out a form that describes what your brand would be like if it were a human being.",
      text2:
      "Answer questions about Brand Persona’s demographics, social values, and benefits of your products and services.",
    ),
    Content(
      image: "assets/svg/Group3.svg",
      heading: "Create Buyer Personas",
      text1:
      "Fill out a form that describes what you believe your customers are like.",
      text2:
      "Answer questions about Buyer Persona’s demographics, social values, and real benefits of your products and services.",
      text3:
      "Create multiple Buyer Personas that can represent different market segments.",
    ),
    Content(
      image: "assets/svg/Group4.svg",
      heading: "Select Target Market Segment",
      text1:
      "Our database includes information about 100s of different market segments. Pick your target market.",
      text2:
      "Use geodemographic (e.g. Age, State, Gender, Income Level) filters to narrow down your segment.",
    ),
    Content(
      image: "assets/svg/Group5.svg",
      heading: "Examine Results",
      text1:
      "Examine how well your brand matches your targeted market segment: 1) Social Values Match; 2) Product Benefit Match; and 3) Brand Social Value – The total values match between your brands and consumers.",
      text2:
      "Examine in-depth analysis of gaps between your brand and customers.",
      text3: "Compare your results to your competitors.",
      text4: "Optional - Examine how well your brand matches buyer personas.",
    ),
    Content(
      image: "assets/svg/Group6.svg",
      heading: "Create Social Media Content",
      text1:
      "Create your own original social media content for any of the major platforms. Or use our AI generated content.",
      text2:
      "Examine sentiment analysis report on how this social media post affects your Brand Social Value.",
      text3:
      "Try creating different content until you get an optimum solution.",
    ),
  ];

  late final PageController _pageController;
  double _currentPage = 0.0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController()
      ..addListener(() {
        setState(() {
          _currentPage = _pageController.page!;
        });
      });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: content.length,
                  itemBuilder: (context, index) {
                    return OnBoardingPage(content: content[index]);
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8, right: 8),
                child: DynamicDotsIndicator(
                  dotsCount: content.length,
                  position: _currentPage,
                  activeColor: Constants.dotedColor,
                  inactiveColor: Constants.dotedColor.withOpacity(0.3),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15, right: 8, left: 8, bottom: 8),
                child: GestureDetector(
                  onTap: (){
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Login()));

                  },
                  child: Container(
                    height: 50,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Constants.loginButtonColor,
                        borderRadius: BorderRadius.circular(10)),
                    child: const Center(
                      child: Text(
                        "Login",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: "PlusJakartaSans-SemiBold"),
                      ),
                    ),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 20, right: 20, bottom: 8),
                child: Center(
                  child: Row(
                    children: [
                      Text("Not a member yet? "),
                      Text(
                        " Register",
                        style: TextStyle(
                            decoration: TextDecoration.underline,
                            color: Constants.loginButtonColor,
                            decorationColor: Constants.loginButtonColor),
                      ),
                      Text(" and "),
                      Text(
                        " Subscribe",
                        style: TextStyle(
                            decoration: TextDecoration.underline,
                            color: Constants.loginButtonColor,
                            decorationColor: Constants.loginButtonColor),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            top: 73,
            right: 20,
            child: GestureDetector(
              onTap: () {
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Login()));
              },
              child: const Text(
                "Skip",
                style: TextStyle(
                  fontSize: 14,
                  fontFamily: "PlusJakartaSans-Medium",
                  color: Constants.loginButtonColor,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class OnBoardingPage extends StatelessWidget {
  final Content content;

  const OnBoardingPage({super.key, required this.content});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.1,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10, bottom: 10),
            child: SvgPicture.asset(content.image),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8),
            child: Text(
              content.heading,
              textAlign: TextAlign.start,
              style: const TextStyle(
                fontFamily: "PlusJakartaSans-Bold",
                fontSize: 19,
              ),
            ),
          ),
          const SizedBox(height: 8),
          if (content.text1.isNotEmpty) BulletText(content.text1),
          const SizedBox(height: 8),
          if (content.text2.isNotEmpty) BulletText(content.text2),
          const SizedBox(height: 8),
          if (content.text3 != null && content.text3!.isNotEmpty)
            BulletText(content.text3!),
          const SizedBox(height: 8),
          if (content.text4 != null && content.text4!.isNotEmpty)
            BulletText(content.text4!),
        ],
      ),
    );
  }
}

class BulletText extends StatelessWidget {
  final String text;

  const BulletText(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 4, left: 4, top: 4),
          child: SvgPicture.asset("assets/svg/subheading.svg"),
        ),
        Expanded(
          child: Text(
            text,
            overflow: TextOverflow.ellipsis,
            maxLines: 4,
            style: const TextStyle(
              fontFamily: "PlusJakartaSans-Medium",
              fontSize: 13,
            ),
          ),
        ),
      ],
    );
  }
}

class DynamicDotsIndicator extends StatelessWidget {
  final int dotsCount;
  final double position;
  final Color activeColor;
  final Color inactiveColor;

  const DynamicDotsIndicator({
    super.key,
    required this.dotsCount,
    required this.position,
    required this.activeColor,
    required this.inactiveColor,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(dotsCount, (index) {
        final difference = (position - index).abs();
        final opacity = (1.0 - (difference / dotsCount)).clamp(0.3, 1.0);
        final color = index == position.round()
            ? activeColor
            : inactiveColor.withOpacity(opacity);

        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 4.0),
          width: 9.0,
          height: 9.0,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
        );
      }),
    );
  }
}

            // simple dottd line implemented

// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:dots_indicator/dots_indicator.dart';
//
// import '../../constants/constants.dart';
// import '../../constants/onboardContent.dart';
//
// class OnBoarding extends StatefulWidget {
//   const OnBoarding({Key? key}) : super(key: key);
//
//   @override
//   State<OnBoarding> createState() => _OnBoardingState();
// }
//
// class _OnBoardingState extends State<OnBoarding> {
//   final List<Content> content = [
//     Content(
//       image: "assets/onboard/Group1.png",
//       heading: "Leading Brand and Social Media Analytics Platform",
//       text1: "Build Brand Personas that Match Your Customers and Test How Your Social Media Content Affects the Relationship between your Brand and Customers.",
//       text2: "The unique AI-powered algorithm examines the content and framing of your messages and develops recommendations so you always have a winning solution",
//     ),
//     Content(
//       image: "assets/onboard/Group2.png",
//       heading: "Create a Brand Persona",
//       text1: "Fill out a form that describes what your brand would be like if it were a human being.",
//       text2: "Answer questions about Brand Persona’s demographics, social values, and benefits of your products and services.",
//     ),
//     Content(
//       image: "assets/onboard/Group3.png",
//       heading: "Create Buyer Personas",
//       text1: "Fill out a form that describes what you believe your customers are like.",
//       text2: "Answer questions about Buyer Persona’s demographics, social values, and real benefits of your products and services.",
//       text3: "Create multiple Buyer Personas that can represent different market segments.",
//     ),
//     Content(
//       image: "assets/onboard/Group4.png",
//       heading: "Select Target Market Segment",
//       text1: "Our database includes information about 100s of different market segments. Pick your target market.",
//       text2: "Use geodemographic (e.g. Age, State, Gender, Income Level) filters to narrow down your segment.",
//     ),
//     Content(
//       image: "assets/onboard/Group5.png",
//       heading: "Examine Results",
//       text1: "Examine how well your brand matches your targeted market segment: 1) Social Values Match; 2) Product Benefit Match; and 3) Brand Social Value – The total values match between your brands and consumers.",
//       text2: "Examine in-depth analysis of gaps between your brand and customers.",
//       text3: "Compare your results to your competitors.",
//       text4: "Optional - Examine how well your brand matches buyer personas.",
//     ),
//     Content(
//       image: "assets/onboard/Group5.png",
//       heading: "Create Social Media Content",
//       text1: "Create your own original social media content for any of the major platforms. Or use our AI generated content.",
//       text2: "Examine sentiment analysis report on how this social media post affects your Brand Social Value.",
//       text3: "Try creating different content until you get an optimum solution.",
//     ),
//   ];
//
//   late final PageController _pageController;
//   double _currentPage = 0.0;
//
//   @override
//   void initState() {
//     super.initState();
//     _pageController = PageController()
//       ..addListener(() {
//         setState(() {
//           _currentPage = _pageController.page!;
//         });
//       });
//   }
//
//   @override
//   void dispose() {
//     _pageController.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         children: [
//           Expanded(
//             child: PageView.builder(
//               controller: _pageController,
//               itemCount: content.length,
//               itemBuilder: (context, index) {
//                 return OnBoardingPage(content: content[index]);
//               },
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: DotsIndicator(
//               dotsCount: content.length,
//               position: _currentPage,
//               decorator: DotsDecorator(
//                 activeColor: Constants.dotedColor, // Change to desired color
//                 color: Constants.dotedColor.withOpacity(0.3), // Change the opacity for inactive dots
//                 size: const Size.square(9.0),
//                 activeSize: const Size(18.0, 9.0),
//                 activeShape: CircleBorder(),
//
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// class OnBoardingPage extends StatelessWidget {
//   final Content content;
//
//   const OnBoardingPage({Key? key, required this.content}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           SizedBox(
//             height: MediaQuery.of(context).size.height * 0.15,
//           ),
//           Padding(
//             padding: const EdgeInsets.only(top: 10, bottom: 10),
//             child: Image.asset(content.image),
//           ),
//           Padding(
//             padding: const EdgeInsets.only(left: 8),
//             child: Text(
//               content.heading,
//               textAlign: TextAlign.start,
//               style: const TextStyle(
//                 fontFamily: "PlusJakartaSans-Bold",
//                 fontSize: 19,
//               ),
//             ),
//           ),
//           const SizedBox(height: 8),
//           if (content.text1.isNotEmpty) BulletText(content.text1),
//           const SizedBox(height: 8),
//           if (content.text2.isNotEmpty) BulletText(content.text2),
//           const SizedBox(height: 8),
//           if (content.text3 != null && content.text3!.isNotEmpty)
//             BulletText(content.text3!),
//           const SizedBox(height: 8),
//           if (content.text4 != null && content.text4!.isNotEmpty)
//             BulletText(content.text4!),
//         ],
//       ),
//     );
//   }
// }
//
// class BulletText extends StatelessWidget {
//   final String text;
//
//   const BulletText(this.text, {Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Padding(
//           padding: const EdgeInsets.only(right: 4, left: 4, top: 4),
//           child: SvgPicture.asset("assets/svg/subheading.svg"),
//         ),
//         Expanded(
//           child: Text(
//             text,
//             overflow: TextOverflow.ellipsis,
//             maxLines: 4,
//             style: const TextStyle(
//               fontFamily: "PlusJakartaSans-Medium",
//               fontSize: 13,
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }
//
//
