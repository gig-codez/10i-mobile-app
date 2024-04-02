// ignore_for_file: file_names

import 'dart:async';

import '/exports/exports.dart';

// quick model for slides
class Slide {
  String image;
  String description;
  Slide({required this.image, required this.description});
}

class OnBoarding extends StatefulWidget {
  const OnBoarding({super.key});

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  final pageController = PageController();
  Timer? _timer;
  int page = 0;
  @override
  void initState() {
    super.initState();
// controlling the sliding animation
    // _timer = Timer.periodic(const Duration(milliseconds: 2600), (timer) {
    //   if (mounted) {
    //     setState(() {
    //       page += 1;
    //     });
    //     if (page >= 3) {
    //       setState(() {
    //         page = -1;
    //       });
    //     } else {
    //       pageController.animateToPage(
    //         page,
    //         duration: const Duration(milliseconds: 800),
    //         curve: Curves.decelerate,
    //       );
    //     }
    //   } else {
    //     timer.cancel();
    //   }
    // });
  }

  void handleNextSlide() {
    if (mounted) {
      setState(() {
        page += 1;
      });
      if (page >= 3) {
        setState(() {
          page = -1;
        });
      } else {
        pageController.animateToPage(
          page,
          duration: const Duration(milliseconds: 800),
          curve: Curves.decelerate,
        );
      }
    }
  }

// slides
  final List<Slide> _slides = [
    Slide(
      image: "assets/svgs/mobile_pay.svg",
      description: "Now Easier to Make Online Payments.",
    ),
    Slide(
      image: "assets/svgs/secure_transactions.svg",
      description: "Secure Transactions & Reliable Anytime.",
    ),
    Slide(
      image: "assets/svgs/manage_financials.svg",
      description: "Let's Manage Your Financials Now!",
    )
  ];
  @override
  void dispose() {
    pageController.dispose();
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
        elevation: 0.0,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 18.0, right: 18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SpaceWidget(space: 0.25),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.61,
              child: PageView(
                controller: pageController,
                children: List.generate(
                  _slides.length,
                  (index) => OnboardSlide(
                    image: _slides[index].image,
                    description: _slides[index].description,
                  ),
                ),
              ),
            ),
            Center(
              child: SmoothPageIndicator(
                controller: pageController,
                count: 3,
                effect: WormEffect(
                  dotHeight: 12,
                  dotWidth: 12,
                  dotColor: Colors.grey.shade300,
                  activeDotColor: Theme.of(context).primaryColor,
                  type: WormType.normal,
                ),
              ),
            ),
            const SizedBox.square(dimension: 20),
            CustomButton(
              text: page >= 2 ? "Get Started" : "Next",
              textColor: Colors.white,
              opacity: 1,
              onPress: page >= 2
                  ? () => Routes.replacePage(const LetYouIn())
                  : handleNextSlide,
            ),
            const SizedBox.square(
              dimension: 10,
            ),
          ],
        ),
      ),
    );
  }
}
