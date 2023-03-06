// ignore_for_file: use_key_in_widget_constructors
import 'package:awas/view/settings/observation/observation_detail_view.dart';
import 'package:awas_core/res/utils/enums.dart';
import 'package:awas_core/res/widgets/kappbar_widget.dart';
import 'package:awas_core/res/widgets/kelevated_button.dart';
import 'package:awas_core/res/widgets/ktext_form_field.dart';
import 'package:flutter/material.dart';

import '../../../res/theme/colors/light_colors.dart';

class ObservationEventView extends StatelessWidget {
  final PageStateEnum userPageState;

  static const String editModerouteName = '/observation-event-edit';
  static const String createModeRouteName = '/observation-event-create';

  const ObservationEventView({super.key, required this.userPageState});

  const ObservationEventView.edit() : this(userPageState: PageStateEnum.edit);
  const ObservationEventView.create()
      : this(userPageState: PageStateEnum.create);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBar(context),
      body: body(context),
      bottomSheet: bottomButtons(context),
    );
  }

  KappBarWidget appBar(BuildContext context) {
    return KappBarWidget(
      title:
          '${userPageState == PageStateEnum.edit ? 'Edit' : 'Create'} Observation Event',
      context: context,
    );
  }

  Widget body(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(
            horizontal: defaultMargin,
            vertical: defaultMargin,
          ),
          child: KtextFormFieldWidget(title: 'Event Name'),
        ),
        ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: 3,
          shrinkWrap: true,
          itemBuilder: (context, i) {
            return obsDetailList(context, i);
          },
        ),
      ],
    );
  }

  Widget obsDetailList(BuildContext context, int i) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          ObservationDetailView.editModerouteName,
        );
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 28),
        decoration: BoxDecoration(
          color: i.isOdd ? LightColors.kGreyColor : null,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Pemakaian Peralatan Perlindungan Diri ',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: LightColors.titleTextStyle.copyWith(fontSize: 16),
            ),
            const SizedBox(height: 18.0),
            Row(
              children: [
                const Icon(
                  Icons.add_circle_outline_rounded,
                  size: 12,
                ),
                const SizedBox(width: 8.0),
                Flexible(
                  child: Text(
                    'Pemakaian Peralatan Perlindungan Diri',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: LightColors.subTitle2TextStyle.copyWith(
                      fontSize: 14,
                      color: LightColors.kDarkBlue,
                    ),
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
                Flexible(
                  child: Text(
                    'Tidak Memakai Peralatan Perlindungan Diri',
                    style: LightColors.subTitle2TextStyle.copyWith(
                      fontSize: 14,
                      color: LightColors.kDarkBlue,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget bottomButtons(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: defaultMargin,
        horizontal: defaultMargin,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Expanded(
                flex: 1,
                child: KelevatedButtonWidget(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  title: 'Back',
                  elevation: 0,
                  shadowColor: Colors.transparent,
                  icon: Icons.keyboard_arrow_left,
                  textColor: LightColors.kPrimaryColor,
                  backgroundColor: LightColors.Blue.withOpacity(0.1),
                ),
              ),
              const SizedBox(
                width: defaultMargin / 2,
              ),
              Expanded(
                flex: 1,
                child: KelevatedButtonWidget(
                  onPressed: () {
                    Navigator.pop(context);
                    if (userPageState == PageStateEnum.edit) {
                      // TODO
                    } else {
                      // TODO
                    }
                  },
                  title: userPageState == PageStateEnum.edit ? 'Save' : 'Add',
                  trailingIcon: Icons.add,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
