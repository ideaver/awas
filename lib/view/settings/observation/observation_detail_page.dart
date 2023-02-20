// ignore_for_file: use_key_in_widget_constructors

import 'package:awas/res/utils/enums.dart';

import '/res/theme/colors/light_colors.dart';
import '/res/widgets/kappbar_widget.dart';
import '/res/widgets/kelevated_button.dart';
import '/res/widgets/ktabbar_widget.dart';
import 'package:flutter/material.dart';

import '../../../res/widgets/ktext_form_field.dart';

class ObservationDetailPage extends StatefulWidget {
  final PageStateEnum userPageState;
  static const String routeName = '/observation-detail';
  static const String editModerouteName = '/observation-detail-edit';
  static const String createModeRouteName = '/observation-detail-create';

  const ObservationDetailPage({super.key, required this.userPageState});

  const ObservationDetailPage.edit() : this(userPageState: PageStateEnum.edit);
  const ObservationDetailPage.create()
      : this(userPageState: PageStateEnum.create);

  @override
  State<ObservationDetailPage> createState() => _ObservationDetailPageState();
}

class _ObservationDetailPageState extends State<ObservationDetailPage>
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
            '${widget.userPageState == PageStateEnum.edit ? 'Edit' : 'Create'} Observation Details',
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
          widget.userPageState != PageStateEnum.edit
              ? backButton()
              : const SizedBox.shrink(),
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
          Navigator.pop(context);
        },
        title: 'Save Changes',
      ),
    );
  }
}
