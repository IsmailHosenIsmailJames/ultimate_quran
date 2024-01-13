import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:ultimate_quran/collect_info/pages/recitations.dart';
import 'package:ultimate_quran/collect_info/pages/tafseer_language.dart';
import 'package:ultimate_quran/collect_info/pages/translation_language.dart';

class CollectInfo extends StatefulWidget {
  final int pageNumber;
  const CollectInfo({super.key, required this.pageNumber});

  @override
  State<CollectInfo> createState() => _CollectInfoState();
}

class _CollectInfoState extends State<CollectInfo> {
  late PageController pageController;
  late int indexPage;
  String nextButtonText = "Next";
  @override
  void initState() {
    pageController = PageController(initialPage: widget.pageNumber);
    indexPage = widget.pageNumber;
    checkPageNumber(widget.pageNumber);
    super.initState();
  }

  void checkPageNumber(int index) {
    if (index >= 2) {
      setState(() {
        nextButtonText = "Done";
      });
    } else {
      setState(() {
        nextButtonText = "Next";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            scrollDirection: Axis.horizontal,
            controller: pageController,
            children: const [
              TranslationLanguage(),
              TafseerLanguage(),
              RecitaionChoice(),
            ],
          ),
          Container(
            alignment: const Alignment(0, 0.85),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextButton(
                  onPressed: () {
                    pageController.jumpToPage(2);
                    checkPageNumber(2);
                  },
                  child: const Text("Skip"),
                ),
                SmoothPageIndicator(
                  controller: pageController,
                  count: 3,
                  onDotClicked: (index) {
                    pageController.jumpToPage(
                      index,
                    );
                    checkPageNumber(index);
                  },
                ),
                TextButton(
                  onPressed: () async {
                    pageController.nextPage(
                        duration: const Duration(milliseconds: 200),
                        curve: Curves.bounceIn);
                    checkPageNumber(pageController.page!.toInt() + 1);
                  },
                  child: Text(nextButtonText),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
