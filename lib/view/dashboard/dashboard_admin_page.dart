import 'package:awas/res/theme/colors/light_colors.dart';
import 'package:awas/res/widgets/kappbar_widget.dart';
import 'package:flutter/material.dart';

class DashboardAdminPage extends StatelessWidget {
  const DashboardAdminPage({Key? key}) : super(key: key);

  static const String routeName = '/dashboard-admin';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBar(context),
      body: body(),
    );
  }

  KappBarWidget appBar(BuildContext context) {
    return KappBarWidget(
      context: context,
      centerTitle: false,
      automaticallyImplyLeading: false,
      titleWidget: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 12,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(width: defaultMargin),
            Image.asset('assets/logo.png', scale: 6),
            const SizedBox(width: defaultMargin / 2),
            Text(
              'Hi Admin',
              style: LightColors.titleTextStyle.copyWith(
                fontSize: 22,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget body() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          Row(
            children: buildRows(1),
          ),
          const Divider(
            height: 1,
            color: Colors.black,
          ),
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: buildRows(20),
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> buildCells(int count) {
    return List.generate(
      count,
      (index) => Container(
        alignment: Alignment.center,
        width: 120.0,
        height: 60.0,
        child: Text("${index + 1}"),
      ),
    );
  }

  List<Widget> buildRows(int count) {
    return List.generate(
      count,
      (index) => Container(
        color: index.isEven ? LightColors.kGreyColor : null,
        child: Row(
          children: buildCells(4),
        ),
      ),
    );
  }
}
