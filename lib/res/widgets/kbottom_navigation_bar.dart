import '/view/dashboard/dashboard_employee_page.dart';
import '/view/report/report_form_page.dart';

import '/res/theme/colors/light_colors.dart';
import 'package:flutter/material.dart';

class KbottomNavigationBar extends StatefulWidget {
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
  String text = "Home";

  //call this method on click of each bottom app bar item to update the screen
  void updateTabSelection(int index, String buttonText) {
    setState(() {
      selectedIndex = index;
      text = buttonText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          selectedIndex == 0
              ? const DashboardEmployeePage()
              : const ReportFormPage(),
          //this is the code for the widget container that comes from behind the floating action button (FAB)
          Align(
            alignment: FractionalOffset.bottomCenter,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 250),
              //if clickedCentreFAB == true, the first parameter is used. If it's false, the second.
              height:
                  clickedCentreFAB ? MediaQuery.of(context).size.height : 10.0,
              width:
                  clickedCentreFAB ? MediaQuery.of(context).size.height : 10.0,
              decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.circular(clickedCentreFAB ? 0.0 : 300.0),
                  color: LightColors.kPrimaryColor),
            ),
          )
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation
          .centerDocked, //specify the location of the FAB
      floatingActionButton: FloatingActionButton(
        backgroundColor: LightColors.kPrimaryColor,
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
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 10.0,
        shape: const CircularNotchedRectangle(),
        //color of the BottomAppBar
        color: LightColors.kWhiteColor,
        child: Container(
          margin: const EdgeInsets.only(left: 12.0, right: 12.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                //update the bottom app bar view each time an item is clicked
                onPressed: () {
                  updateTabSelection(0, "Home");
                },
                iconSize: 27.0,
                icon: Icon(
                  Icons.home,
                  //darken the icon if it is selected or else give it a different color
                  color: selectedIndex == 0
                      ? LightColors.kPrimaryColor
                      : LightColors.kDarkGreyColor,
                ),
              ),
              IconButton(
                onPressed: () {
                  updateTabSelection(1, "Outgoing");
                },
                iconSize: 27.0,
                icon: Icon(
                  Icons.featured_play_list_rounded,
                  color: selectedIndex == 1
                      ? LightColors.kPrimaryColor
                      : LightColors.kDarkGreyColor,
                ),
              ),
              //to leave space in between the bottom app bar items and below the FAB
              const SizedBox(
                width: 50.0,
              ),
              IconButton(
                onPressed: () {
                  updateTabSelection(2, "Incoming");
                },
                iconSize: 27.0,
                icon: Icon(
                  Icons.call_received,
                  color: selectedIndex == 2
                      ? LightColors.kPrimaryColor
                      : LightColors.kDarkGreyColor,
                ),
              ),
              IconButton(
                onPressed: () {
                  updateTabSelection(3, "Settings");
                },
                iconSize: 27.0,
                icon: Icon(
                  Icons.settings,
                  color: selectedIndex == 3
                      ? LightColors.kPrimaryColor
                      : LightColors.kDarkGreyColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
