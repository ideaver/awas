import 'package:awas/res/theme/colors/light_colors.dart';
import '../routes.dart';
import '/res/widgets/kappbar_widget.dart';
import '/res/widgets/kscrollbar_widget.dart';
import 'package:flutter/material.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: KappBarWidget(title: 'Awas: Menu Screens (${routes.length - 1})'),
      body: KscrollBarWidget(
        child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: routes.length,
          itemBuilder: (context, index) {
            if (index == 0) {
              return const SizedBox();
            }
            return ListTile(
              tileColor: index.isOdd ? LightColors.kGreyColor : null,
              contentPadding: const EdgeInsets.symmetric(
                  horizontal: defaultMargin, vertical: defaultMargin / 4),
              onTap: () {
                Navigator.pushNamed(
                    context, routes.entries.elementAt(index).key);
              },
              title: Text(
                '$index. ${routes.entries.elementAt(index).key.substring(1).toUpperCase()} Page',
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
