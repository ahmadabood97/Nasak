import 'package:flutter/material.dart';
import 'package:onboarding/onboarding.dart';

import '../../../core/utils/assets_manager.dart';
import '../widgets/start_button.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  late Material materialButton;
  late int index;
  final onboardingPagesList = [
    PageModel(
      widget: DecoratedBox(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            width: 0.0,
            color: Colors.white,
          ),
        ),
        child: ListView(
          children: [
            SizedBox(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 45.0,
                      vertical: 20.0,
                    ),
                    child: Image.asset(
                      ImageAssets.onboarding1,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 45.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'SECURED BACKUP',
                        style: TextStyle(
                          color: Colors.orange,
                          fontWeight: FontWeight.bold,
                          fontSize: 23.0,
                          wordSpacing: 1,
                          letterSpacing: 1.2,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                  const Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 45.0, vertical: 10.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Keep your files in closed safe so you can\'t lose them. Consider TrueNAS.',
                        style: pageInfoStyle,
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
    PageModel(
      widget: DecoratedBox(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            width: 0.0,
            color: Colors.white,
          ),
        ),
        child: ListView(
          children: [
            SizedBox(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 45.0,
                      vertical: 20.0,
                    ),
                    child: Image.asset(
                      ImageAssets.onboarding1,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 45.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'SECURED BACKUP',
                        style: TextStyle(
                          color: Colors.orange,
                          fontWeight: FontWeight.bold,
                          fontSize: 23.0,
                          wordSpacing: 1,
                          letterSpacing: 1.2,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                  const Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 45.0, vertical: 10.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Keep your files in closed safe so you can\'t lose them. Consider TrueNAS.',
                        style: pageInfoStyle,
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
    PageModel(
      widget: DecoratedBox(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            width: 0.0,
            color: Colors.white,
          ),
        ),
        child: ListView(
          children: [
            SizedBox(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 45.0,
                      vertical: 20.0,
                    ),
                    child: Image.asset(
                      ImageAssets.onboarding1,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 45.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'SECURED BACKUP',
                        style: TextStyle(
                          color: Colors.orange,
                          fontWeight: FontWeight.bold,
                          fontSize: 23.0,
                          wordSpacing: 1,
                          letterSpacing: 1.2,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                  const Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 45.0, vertical: 10.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Keep your files in closed safe so you can\'t lose them. Consider TrueNAS.',
                        style: pageInfoStyle,
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  ];
  Material _skipButton({void Function(int)? setIndex}) {
    return Material(
      borderRadius: defaultSkipButtonBorderRadius,
      color: Colors.orange,
      child: InkWell(
        borderRadius: defaultSkipButtonBorderRadius,
        onTap: () {
          if (setIndex != null) {
            index = 2;
            setIndex(2);
          }
        },
        child: const Padding(
          padding: defaultSkipButtonPadding,
          child: Text(
            'Skip',
            style: defaultSkipButtonTextStyle,
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    materialButton = _skipButton();
    index = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Onboarding(
        pages: onboardingPagesList,
        onPageChange: (int pageIndex) {
          index = pageIndex;
        },
        startPageIndex: 0,
        footerBuilder: (context, dragDistance, pagesLength, setIndex) {
          return DecoratedBox(
            decoration: BoxDecoration(
              color: background,
              border: Border.all(
                width: 0.0,
                color: background,
              ),
            ),
            child: ColoredBox(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(45.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomIndicator(
                      netDragPercent: dragDistance,
                      pagesLength: pagesLength,
                      indicator: Indicator(
                        closedIndicator: const ClosedIndicator(
                            color: Colors.orange, borderWidth: 2),
                        activeIndicator: const ActiveIndicator(
                            color: Colors.grey, borderWidth: 2),
                        indicatorDesign: IndicatorDesign.line(
                          lineDesign: LineDesign(
                            lineType: DesignType.line_nonuniform,
                          ),
                        ),
                      ),
                    ),
                    index == pagesLength - 1
                        ? startButton(context)
                        : _skipButton(setIndex: setIndex)
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
