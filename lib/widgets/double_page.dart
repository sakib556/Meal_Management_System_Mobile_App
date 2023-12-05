import 'package:flutter/material.dart';
import 'package:meal_management/widgets/page_button.dart';

class DoublePage extends StatefulWidget {
  const DoublePage(
      {Key? key,
      required this.firstPageTitle,
      required this.firstPageWidget,
      required this.secondPageTitle,
      required this.secondPageWidget})
      : super(key: key);
  final String firstPageTitle;
  final Widget firstPageWidget;
  final String secondPageTitle;
  final Widget secondPageWidget;
  @override
  State<DoublePage> createState() => _DoublePageState();
}

class _DoublePageState extends State<DoublePage> {
  final PageController _pageController = PageController();
  bool isFirstPage = true;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          _buttons(),
          Expanded(
            child: PageView(
                controller: _pageController,
                onPageChanged: (value) {
                  setState(() {
                    value == 0 ? isFirstPage = true : isFirstPage = false;
                  });
                },
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    width: double.infinity,
                    height: double.infinity,
                    child: widget.firstPageWidget,
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    width: double.infinity,
                    height: double.infinity,
                    child: widget.secondPageWidget,
                  ),
                ]),
          )
        ],
      ),
    );
  }

  Widget _buttons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        PageButton(
          title: widget.firstPageTitle,
          isClicked: isFirstPage,
          onTap: () {
            setState(() {
              isFirstPage = true;
              _pageController.animateToPage(0,
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.linear);
            });
          },
        ),
        PageButton(
          title: widget.secondPageTitle,
          isClicked: !isFirstPage ? true : false,
          onTap: () {
            setState(() {
              isFirstPage = false;
              _pageController.animateToPage(1,
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.linear);
            });
          },
        ),
      ],
    );
  }
}
