import 'package:awas/res/theme/colors/light_colors.dart';
import 'package:awas/res/widgets/kappbar_widget.dart';
import 'package:awas/res/widgets/kelevated_button.dart';
import 'package:awas/res/widgets/ktext_form_field.dart';
import 'package:flutter/material.dart';

class CompanyDetails extends StatefulWidget {
  const CompanyDetails({Key? key}) : super(key: key);

  static const String routeName = '/company-details';

  @override
  State<CompanyDetails> createState() => _CompanyDetailsState();
}

class _CompanyDetailsState extends State<CompanyDetails> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context),
      body: body(),
    );
  }

  KappBarWidget appBar(BuildContext context) {
    return KappBarWidget(
      context: context,
      centerTitle: false,
      title: 'Company Details',
      actions: [
        TextButton(
          onPressed: () {},
          child: Text(
            'Clear',
            style: LightColors.subTitle2TextStyle,
          ),
        )
      ],
    );
  }

  Widget body() {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.all(defaultMargin),
      child: Column(
        children: [
          nameAndLogo(),
          const SizedBox(height: defaultMargin),
          const KtextFormFieldWidget(title: 'Company Name'),
          const SizedBox(height: defaultMargin),
          const KtextFormFieldWidget(title: 'Phone'),
          const SizedBox(height: defaultMargin),
          const KtextFormFieldWidget(title: 'Email'),
          const SizedBox(height: defaultMargin),
          KtextFormFieldWidget.password(title: 'Password'),
          const SizedBox(height: defaultMargin),
          const KtextFormFieldWidget(title: 'Website'),
          const SizedBox(height: defaultMargin),
          const KtextFormFieldWidget(title: 'Owner Name'),
          const SizedBox(height: defaultMargin),
          const KtextFormFieldWidget(
            title: 'Description',
            minLines: 3,
          ),
          const SizedBox(height: defaultMargin * 2),
          saveButton(),
          const SizedBox(height: defaultMargin * 3),
        ],
      ),
    );
  }

  Widget nameAndLogo() {
    return Column(
      children: [
        Container(
          height: 100,
          padding: const EdgeInsets.all(14),
          decoration: const BoxDecoration(
            color: LightColors.kGreyColor,
            shape: BoxShape.circle,
          ),
          child: ClipOval(
            child: Image.asset('assets/logo.png'),
          ),
        ),
        const SizedBox(height: defaultMargin / 3),
        Text(
          "Company Logo",
          style: LightColors.black2TextStyle.copyWith(),
        ),
        const SizedBox(height: defaultMargin),
        const Divider(),
      ],
    );
  }

  Widget saveButton() {
    return SizedBox(
      width: double.infinity,
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
