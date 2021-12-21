import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mais_em_conta/Custom/cor.dart';
import 'package:mais_em_conta/controllers.dart/layoutControl.dart';
import 'package:mais_em_conta/pages/maisEmContaPage.dart';
import 'package:mais_em_conta/pages/regraDeTresPage.dart';

class Layout extends StatefulWidget {
  @override
  _LayoutState createState() => _LayoutState();
}

class _LayoutState extends State<Layout> {
  final pageController = PageController();
  final controller = LayoutControl();
  final _index = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        children: [HomePage(), RegraDeTresPage()],
        controller: pageController,
      ),
      bottomNavigationBar: AnimatedBuilder(
          animation: _index,
          builder: (context, snapshot) {
            return bottomNavigationBar();
          }),
    );
  }

  Widget bottomNavigationBar() {
    return BottomNavigationBar(
      selectedItemColor: Cor.primary,
      currentIndex: _index.value,
      onTap: (i) => onTap(i),
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.calculate),
          label: "Mais em conta",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.import_export),
          label: "Regra de três",
        ),
      ],
    );
  }

  void onTap(int i) {
    pageController.animateToPage(i,
        duration: Duration(milliseconds: 300), curve: Curves.linear);
    _index.value = i;
  }
}
