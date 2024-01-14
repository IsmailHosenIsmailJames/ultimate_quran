import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:ultimate_quran/collect_info/pages/choice_tranlation_book.dart';
import 'package:ultimate_quran/collect_info/pages/recitations.dart';
import 'package:ultimate_quran/collect_info/pages/tafseer_language.dart';
import 'package:ultimate_quran/collect_info/pages/translation_language.dart';

import 'pages/choice_tafseer_book.dart';
import 'pages/get_controller.dart';

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
    if (index >= 4) {
      setState(() {
        nextButtonText = "Done";
      });
    } else {
      setState(() {
        nextButtonText = "Next";
      });
    }
  }

  final infoController = Get.put(InfoController());

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
              ChoiceTranslationBook(),
              TafseerLanguage(),
              ChoiceTafseerBook(),
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
                    pageController.previousPage(
                        duration: const Duration(milliseconds: 200),
                        curve: Curves.bounceIn);
                  },
                  child: const Text("previous"),
                ),
                SmoothPageIndicator(
                  controller: pageController,
                  count: 5,
                  onDotClicked: (index) {
                    pageController.jumpToPage(
                      index,
                    );
                    checkPageNumber(index);
                  },
                ),
                TextButton(
                  onPressed: () async {
                    if (pageController.page! == 0) {
                      if (infoController.selectedOptionTranslation.value ==
                          -1) {
                        return;
                      }
                    } else if (pageController.page! == 1) {
                      if (infoController.bookNameIndex.value == -1) {
                        return;
                      }
                    }
                    if (pageController.page! == 2) {
                      if (infoController.tafseerIndex.value == -1) {
                        return;
                      }
                    } else if (pageController.page! == 3) {
                      if (infoController.tafseerBookIndex.value == -1) {
                        return;
                      }
                    }
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
