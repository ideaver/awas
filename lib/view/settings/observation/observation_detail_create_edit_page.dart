import 'package:awas/res/theme/colors/light_colors.dart';
import 'package:awas/res/widgets/kappbar_widget.dart';
import 'package:awas/res/widgets/kelevated_button.dart';
import 'package:awas/res/widgets/ktabbar_widget.dart';
import 'package:flutter/material.dart';

import '../../../res/widgets/ktext_form_field.dart';

class ObservationDetailCreatePage extends StatefulWidget {
  final bool isEdit;
  const ObservationDetailCreatePage({Key? key, this.isEdit = false})
      : super(key: key);

  static const String routeName = '/observation-detail-create-edit';

  @override
  State<ObservationDetailCreatePage> createState() =>
      _ObservationDetailCreatePageState();
}

class _ObservationDetailCreatePageState
    extends State<ObservationDetailCreatePage>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(vsync: this, length: 2);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBar(context),
      body: body(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
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
            '${widget.isEdit ? 'Edit' : 'Create'} Observation Details',
            style: LightColors.titleTextStyle.copyWith(
              fontSize: 18.0,
              color: LightColors.kBlackColor,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            'Pelindung Diri',
            style: LightColors.subTitle2TextStyle.copyWith(
              fontSize: 12.0,
              color: LightColors.kDarkBlue,
            ),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            // TODO
          },
          child: Text(
            'Clear',
            style: LightColors.subTitle2TextStyle,
          ),
        ),
      ],
    );
  }

  Widget body() {
    return NestedScrollView(
      physics: const BouncingScrollPhysics(),
      headerSliverBuilder: (context, value) {
        return [
          SliverToBoxAdapter(
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: defaultMargin,
                    vertical: defaultMargin,
                  ),
                  child: KtextFormFieldWidget(title: 'Event Name'),
                ),
                KtabBarWidget(
                  controller: tabController,
                  titles: const ['Positive', 'Negative'],
                ),
              ],
            ),
          ),
        ];
      },
      body: TabBarView(
        controller: tabController,
        children: [
          positiveForm(),
          negativeForm(),
        ],
      ),
    );
  }

  Widget positiveForm() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 28),
      decoration: const BoxDecoration(
        color: LightColors.kGreyColor,
      ),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            KtextFormFieldWidget(
              title: 'Positive Statement',
              fillColor: Colors.white,
              borderSideColor: LightColors.kBlackColor.withOpacity(0.24),
              minLines: 3,
            ),
            const SizedBox(height: 18.0),
            KtextFormFieldWidget(
              title: 'Positive Points',
              fillColor: Colors.white,
              borderSideColor: LightColors.kBlackColor.withOpacity(0.24),
            ),
            const SizedBox(height: defaultMargin * 2),
          ],
        ),
      ),
    );
  }

  Widget negativeForm() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 28),
      decoration: const BoxDecoration(
        color: LightColors.kGreyColor,
      ),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            KtextFormFieldWidget(
              title: 'Negative Statement',
              fillColor: Colors.white,
              borderSideColor: LightColors.kBlackColor.withOpacity(0.24),
              minLines: 3,
            ),
            const SizedBox(height: 18.0),
            KtextFormFieldWidget(
              title: 'Negative Points',
              fillColor: Colors.white,
              borderSideColor: LightColors.kBlackColor.withOpacity(0.24),
            ),
            const SizedBox(height: defaultMargin * 2),
          ],
        ),
      ),
    );
  }

  Widget floatingActionButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: defaultMargin),
      child: Row(
        children: [
          !widget.isEdit ? backButton() : const SizedBox.shrink(),
          saveButton(),
        ],
      ),
    );
  }

  Widget backButton() {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(right: 12.0),
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
    );
  }

  Widget saveButton() {
    return Expanded(
      child: KelevatedButtonWidget(
        onPressed: () {
          // TODO
        },
        title: 'Save Changes',
      ),
    );
  }
}
