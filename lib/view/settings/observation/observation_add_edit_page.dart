import 'package:awas/res/widgets/kappbar_widget.dart';
import 'package:awas/res/widgets/ktext_form_field.dart';
import 'package:flutter/material.dart';

import '../../../res/theme/colors/light_colors.dart';
import '../../../res/widgets/kelevated_button.dart';

class ObservationAddEditPage extends StatelessWidget {
  final bool isEdit;
  const ObservationAddEditPage({Key? key, this.isEdit = false})
      : super(key: key);

  static const String routeName = '/observation-add-edit';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBar(context),
      body: body(context),
    );
  }

  KappBarWidget appBar(BuildContext context) {
    return KappBarWidget(
      title: '${isEdit ? 'Edit' : 'Create'} Observation Event',
      context: context,
    );
  }

  Widget body(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: defaultMargin,
        vertical: defaultMargin,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Expanded(
            child: KtextFormFieldWidget(title: 'Event Name'),
          ),
          bottomButtons(context),
        ],
      ),
    );
  }

  Widget bottomButtons(BuildContext context) {
    return Column(
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
                  if (isEdit) {
                    // TODO
                  } else {
                    // TODO
                  }
                },
                title: isEdit ? 'Save' : 'Add',
                trailingIcon: Icons.add,
              ),
            )
          ],
        ),
      ],
    );
  }
}
