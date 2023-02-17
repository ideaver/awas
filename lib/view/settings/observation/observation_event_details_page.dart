import 'package:awas/res/theme/colors/light_colors.dart';
import 'package:awas/res/widgets/kappbar_widget.dart';
import 'package:awas/view/settings/observation/observation_detail_create_edit_page.dart';
import 'package:flutter/material.dart';

class ObservationEventDetailsPage extends StatelessWidget {
  const ObservationEventDetailsPage({Key? key}) : super(key: key);

  static const String routeName = '/observation-event-details';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBar(context),
      body: body(),
      floatingActionButton: floatingActionButton(context),
    );
  }

  KappBarWidget appBar(BuildContext context) {
    return KappBarWidget(
      context: context,
      centerTitle: false,
      titleWidget: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Observation Details',
            style: LightColors.titleTextStyle.copyWith(
              fontSize: 18.0,
              color: LightColors.kBlackColor,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            'Pelindung Diri (5)',
            style: LightColors.subTitle2TextStyle.copyWith(
              fontSize: 12.0,
              color: LightColors.kDarkBlue,
            ),
          ),
        ],
      ),
      actions: [
        IconButton(
          onPressed: () {
            //TODO
          },
          icon: const Icon(
            Icons.delete,
            color: LightColors.kRed,
            size: 18,
          ),
        )
      ],
    );
  }

  Widget body() {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: 3,
      itemBuilder: (context, i) {
        return obsList(i);
      },
    );
  }

  Widget obsList(int i) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 28),
      decoration: BoxDecoration(
        color: i.isOdd ? LightColors.kGreyColor : null,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Pemakaian Peralatan Perlindungan Diri',
            style: LightColors.titleTextStyle.copyWith(fontSize: 14),
          ),
          const SizedBox(height: 18.0),
          Row(
            children: [
              const Icon(
                Icons.add_circle_outline_rounded,
                size: 12,
              ),
              const SizedBox(width: 8.0),
              Text(
                'Pemakaian Peralatan Perlindungan Diri',
                style: LightColors.subTitle2TextStyle.copyWith(
                  fontSize: 12,
                  color: LightColors.kDarkBlue,
                ),
              ),
            ],
          ),
          const SizedBox(height: 2.0),
          Row(
            children: [
              const Icon(
                Icons.remove_circle_outline_rounded,
                size: 12,
              ),
              const SizedBox(width: 8.0),
              Text(
                'Tidak Memakai Peralatan Perlindungan Diri',
                style: LightColors.subTitle2TextStyle.copyWith(
                  fontSize: 12,
                  color: LightColors.kDarkBlue,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget floatingActionButton(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        Navigator.pushNamed(context, ObservationDetailCreatePage.routeName);
      },
      child: const Icon(
        Icons.add,
        color: LightColors.kWhiteColor,
      ),
    );
  }
}
