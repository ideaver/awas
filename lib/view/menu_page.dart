import 'package:awas/res/theme/colors/light_colors.dart';
import '/res/widgets/kappbar_widget.dart';
import '/res/widgets/kscrollbar_widget.dart';
import 'package:flutter/material.dart';

class MenuPage extends StatelessWidget {
  MenuPage({super.key});

  List<String> routes = [
    'login',
    'forgot-password',
    'thank-you',
    'terms',
    'profile',
    'point-transactions',
    'dashboard-employee',
    'report-list'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: KappBarWidget(title: 'Menu Screens (${routes.length})'),
      body: KscrollBarWidget(
        child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: routes.length,
          itemBuilder: (context, index) {
            return ListTile(
              tileColor: index.isOdd ? LightColors.kGreyColor : null,
              contentPadding: const EdgeInsets.all(defaultMargin),
              onTap: () {
                Navigator.pushNamed(context, '/${routes[index]}');
              },
              title: Text(
                routes[index].toUpperCase(),
                style: LightColors.titleTextStyle.copyWith(fontSize: 20),
              ),
              trailing: const Icon(
                Icons.arrow_forward,
                color: LightColors.kPrimaryColor,
              ),
            );
          },
        ),
      ),
    );
  }
}
