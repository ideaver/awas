import 'package:awas/res/theme/colors/light_colors.dart';
import 'package:awas/res/widgets/kappbar_widget.dart';
import 'package:awas/res/widgets/kelevated_button.dart';
import 'package:flutter/material.dart';

class CompanyOnboarding extends StatefulWidget {
  const CompanyOnboarding({Key? key}) : super(key: key);

  static const String routeName = '/company-onboarding';

  @override
  State<CompanyOnboarding> createState() => _CompanyOnboardingState();
}

class _CompanyOnboardingState extends State<CompanyOnboarding> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: LightColors.kDarkGreyColor3,
      appBar: appBar(context),
      body: body(),
    );
  }

  KappBarWidget appBar(BuildContext context) {
    return KappBarWidget(
      context: context,
      centerTitle: false,
      title: 'Company Onboarding',
      actions: [
        IconButton(
          onPressed: () {
            //TODO
          },
          icon: const Icon(
            Icons.support_agent_rounded,
            color: LightColors.kBlue,
          ),
        )
      ],
    );
  }

  Widget body() {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          const SizedBox(height: defaultMargin * 1.5),
          SizedBox(
            height: 108,
            child: Image.asset('assets/logo.png'),
          ),
          Container(
            margin: const EdgeInsets.symmetric(
              vertical: defaultMargin * 1.5,
              horizontal: defaultMargin,
            ),
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              "Welcome to our company onboarding process! We're excited to have you on board. Follow these easy steps to set up your company",
              style: LightColors.blackTextStyle,
            ),
          ),
          const SizedBox(width: defaultMargin / 2),
          ...List.generate(
            8,
            (i) => listTile(i, i < 4 ? true : false),
          ),
          const SizedBox(height: defaultMargin * 2),
          saveButton(),
          const SizedBox(height: defaultMargin * 3),
        ],
      ),
    );
  }

  Widget listTile(int i, bool isDone) {
    return Container(
      margin: const EdgeInsets.only(bottom: 2),
      padding: const EdgeInsets.symmetric(
        vertical: defaultMargin / 3,
        horizontal: defaultMargin / 2,
      ),
      decoration: BoxDecoration(
        color: isDone ? LightColors.kGreyColor : Colors.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                width: 50,
                height: 50,
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: LightColors.kDarkGreyColor2,
                ),
                child: Text(
                  "$i",
                  style: LightColors.subTitle3TextStyle.copyWith(
                    fontSize: 18,
                  ),
                ),
              ),
              const SizedBox(width: defaultMargin),
              Text(
                "Setup Company Details",
                style: LightColors.black2TextStyle.copyWith(
                  color: isDone
                      ? LightColors.kDarkGreyColor
                      : LightColors.kBlackColor,
                ),
              ),
            ],
          ),
          isDone
              ? Container(
                  width: 32,
                  height: 32,
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: LightColors.kSuccessColor,
                  ),
                  child: const Icon(
                    Icons.check,
                    size: 14,
                    color: LightColors.kBackgroundColor,
                  ),
                )
              : Icon(
                  Icons.keyboard_arrow_right,
                  color: LightColors.kBlackColor.withOpacity(0.84),
                ),
        ],
      ),
    );
  }

  Widget saveButton() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: defaultMargin),
      child: KelevatedButtonWidget(
        onPressed: () {
          // TODO;
          Navigator.pop(context);
        },
        title: 'Save Changes',
      ),
    );
  }
}
