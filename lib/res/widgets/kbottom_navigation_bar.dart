import 'package:flutter/services.dart';

import '../utils/globals.dart';
import '/res/theme/colors/light_colors.dart';
import '/view/dashboard/dashboard_employee_page.dart';
import '/view/report/report_list_page.dart';
import '/view/settings/settings_page.dart';
import '/view/user/inbox_page.dart';
import 'package:flutter/material.dart';

class KbottomNavigationBar extends StatefulWidget {
  static const String routeName = '/navigation-bar';

  const KbottomNavigationBar({super.key});

  @override
  State<StatefulWidget> createState() {
    return KbottomNavigationBarState();
  }
}

class KbottomNavigationBarState extends State<KbottomNavigationBar> {
  bool clickedCentreFAB =
      false; //boolean used to handle container animation which expands from the FAB
  int selectedIndex =
      0; //to handle which item is currently selected in the bottom app bar

  final Map<Widget, IconData> _screens = {
    const DashboardEmployeePage(): Icons.home,
    const DashboardEmployeePage(): Icons.home,
    const ReportListPage(): Icons.featured_play_list_rounded,
    const InboxPage(): Icons.notifications,
    const SettingsPage.employee(): Icons.settings,
  };

  final List<String> bottomNavBarTitle = [
    'Home',
    'Home',
    'Report',
    'Inbox',
    'Settings',
  ];
  //call this method on click of each bottom app bar item to update the screen

  void updateTabSelection(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        screensWidget(selectedIndex),
        Align(
          alignment: FractionalOffset.bottomCenter,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 250),
            //if clickedCentreFAB == true, the first parameter is used. If it's false, the second.
            height:
                clickedCentreFAB ? MediaQuery.of(context).size.height : 10.0,
            width: clickedCentreFAB ? MediaQuery.of(context).size.height : 10.0,
            decoration: BoxDecoration(
                borderRadius:
                    BorderRadius.circular(clickedCentreFAB ? 0.0 : 300.0),
                color: LightColors.kBlackColor),
          ),
        )
      ]),
      floatingActionButtonLocation: FloatingActionButtonLocation
          .centerDocked, //specify the location of the FAB
      floatingActionButton: fabWidget(), extendBody: true,
      bottomNavigationBar: bottomAppBarWidget(), resizeToAvoidBottomInset: true,
    );
  }

  Widget fabWidget() {
    return MediaQuery.of(context).viewInsets.bottom == 0.0
        ? FloatingActionButton(
            heroTag: UniqueKey(),
            backgroundColor: LightColors.kSecondaryColor,
            onPressed: () {
              setState(() {
                clickedCentreFAB =
                    !clickedCentreFAB; //to update the animated container
              });
            },
            tooltip: "Centre FAB",
            elevation: 4.0,
            child: Container(
              margin: const EdgeInsets.all(15.0),
              child: const Icon(Icons.add),
            ),
          )
        : const SizedBox();
  }

  Widget bottomAppBarWidget() {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
          topRight: Radius.circular(defaultCircular * 2),
          topLeft: Radius.circular(defaultCircular * 2)),
      child: BottomAppBar(
        color: LightColors.kWhiteColor,
        shape: const CircularNotchedRectangle(),
        child: Container(
          margin: const EdgeInsets.symmetric(
              vertical: 5, horizontal: defaultMargin),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              buttonWidget(context, 1),
              buttonWidget(context, 2),
              //to leave space in between the bottom app bar items and below the FAB
              const SizedBox(
                width: 50.0,
              ),
              buttonWidget(context, 3),
              buttonWidget(context, 4),
            ],
          ),
        ),
      ),
    );
  }

  Widget buttonWidget(BuildContext context, int index) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min, //kalau tidak pakai ini rusak
      children: [
        IconButton(
          //update the bottom app bar view each time an item is clicked
          onPressed: () {
            if (selectedIndex != 0) {
              setState(() {
                SystemChrome.setSystemUIOverlayStyle(darkStatusBar);
              });
            }
            updateTabSelection(index);
          },
          iconSize: 27.0,
          icon: Icon(
            _screens.values.elementAt(index),
            //darken the icon if it is selected or else give it a different color
            color: selectedIndex == index
                ? LightColors.kPrimaryColor
                : LightColors.kDarkGreyColor,
          ),
        ),
        Text(
          bottomNavBarTitle[index],
          style: LightColors.subTitle2TextStyle.copyWith(
              color: selectedIndex == index
                  ? LightColors.kPrimaryColor
                  : LightColors.kDarkGreyColor,
              fontSize: 14,
              fontWeight: FontWeight.normal),
        )
      ],
    );
  }

  Widget screensWidget(int index) {
    switch (index) {
      case 1:
        {
          return _screens.keys.elementAt(1);
        }

      case 2:
        {
          return _screens.keys.elementAt(2);
        }

      case 3:
        {
          return _screens.keys.elementAt(3);
        }

      case 4:
        {
          return _screens.keys.elementAt(4);
        }

      default:
        {
          return _screens.keys.elementAt(0);
        }
    }
  }
}
