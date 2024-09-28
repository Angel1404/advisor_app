import '../presentation.dart';

class TabsPages extends StatefulWidget {
  TabsPages({
    super.key,
    required this.children,
    required this.titlesTabs,
    this.tanIndicatorColor,
    this.lineTabColor,
    this.tabBorderColor,
  })  : assert(children.isNotEmpty, "Children is required"),
        assert(children.length <= 4, "Children length is not > 4"),
        assert(titlesTabs.isNotEmpty, "titlesTabs is required");

  final List<Widget> children;
  final List<String> titlesTabs;
  final Color? tanIndicatorColor, lineTabColor, tabBorderColor;

  @override
  State<TabsPages> createState() => _TabsPagesState();
}

class _TabsPagesState extends State<TabsPages> {
  final PageController _pagecontroller = PageController();

  @override
  void dispose() {
    _pagecontroller.dispose();
    super.dispose();
  }

  goToPage(int page) {
    _pagecontroller.animateToPage(
      page,
      duration: durationAnimation,
      curve: Curves.easeIn,
    );
  }

  int page = 0;
  final durationAnimation = const Duration(milliseconds: 450);
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, contrains) {
        return Column(
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  width: contrains.maxWidth,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: List.generate(
                      widget.titlesTabs.length,
                      (index) => InkWell(
                        onTap: () => goToPage(index),
                        child: SizedBox(
                          width: (contrains.maxWidth / widget.children.length),
                          child: AutoSizeTextApp(
                            title: widget.titlesTabs[index],
                            maxLines: 2,
                            textStyle: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 5),
                Container(
                  width: contrains.maxWidth,
                  height: 15,
                  padding: const EdgeInsets.symmetric(vertical: 3),
                  decoration: BoxDecoration(
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        offset: const Offset(0, 4),
                        blurRadius: 4,
                        color: ColorApp.black.withOpacity(.25),
                      )
                    ],
                  ),
                  child: Stack(
                    children: [
                      AnimatedPositioned(
                        left: ((contrains.maxWidth / widget.children.length) * page) + 10,
                        duration: durationAnimation,
                        curve: Curves.ease,
                        child: Container(
                          clipBehavior: Clip.antiAlias,
                          margin: const EdgeInsets.symmetric(horizontal: 5),
                          width: (contrains.maxWidth / widget.children.length) - 20,
                          height: 10,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: widget.tanIndicatorColor ?? ColorApp.blue,
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
            Flexible(
              child: PageView(
                controller: _pagecontroller,
                onPageChanged: (value) => setState(() {
                  page = value;
                }),
                children: widget.children,
              ),
            ),
          ],
        );
      },
    );
  }
}
