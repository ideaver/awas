import 'package:flutter/material.dart';

import '../../res/theme/colors/light_colors.dart';
import '../../res/widgets/kappbar_widget.dart';
import '../../res/widgets/kelevated_button.dart';
import '../../res/widgets/ktext_form_field.dart';

class FiveWhyQuestFormPage extends StatefulWidget {
  const FiveWhyQuestFormPage({Key? key}) : super(key: key);

  static const String routeName = '/five-why-quest';

  @override
  State<FiveWhyQuestFormPage> createState() => _FiveWhyQuestFormPageState();
}

class _FiveWhyQuestFormPageState extends State<FiveWhyQuestFormPage> {
  TextEditingController controller = TextEditingController();
  ScrollController scrollController = ScrollController();

  List<String> answers = [];

  @override
  void initState() {
    answers.add('');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: body(),
      bottomNavigationBar: submitButton(),
    );
  }

  KappBarWidget appBar() {
    return KappBarWidget(
      context: context,
      centerTitle: false,
      title: '5 Why Question',
    );
  }

  Widget body() {
    return SingleChildScrollView(
      controller: scrollController,
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.only(bottom: defaultMargin),
      child: Column(
        children: [
          title(),
          forms(),
        ],
      ),
    );
  }

  Widget title() {
    return Padding(
      padding: const EdgeInsets.all(defaultMargin),
      child: Column(
        children: [
          SizedBox(
            height: 200,
            child: ClipOval(
              child: Image.asset('assets/setup_company.png'),
            ),
          ),
          const SizedBox(height: defaultMargin / 2),
          Text(
            'Identify the root cause with 5 why questions form below',
            textAlign: TextAlign.center,
            style: LightColors.blackTextStyle,
          ),
          const SizedBox(height: defaultMargin / 2),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Learn',
                textAlign: TextAlign.center,
                style: LightColors.blackTextStyle,
              ),
              Text(
                ' 5 why questions method',
                textAlign: TextAlign.center,
                style: LightColors.linkTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget forms() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: defaultMargin / 2),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: defaultMargin / 2,
            vertical: defaultMargin / 4,
          ),
          child: Text(
            'Resiko menumpahkan masakan panas',
            style: LightColors.black2TextStyle,
          ),
        ),
        const SizedBox(height: defaultMargin / 2),
        ...List.generate(answers.length, (i) {
          return questionField(i);
        }),
      ],
    );
  }

  Widget questionField(int i) {
    return Column(
      children: [
        questTitle(i),
        questAnswer(i),
      ],
    );
  }

  Widget questTitle(int i) {
    return Container(
      padding: const EdgeInsets.all(defaultMargin / 2),
      decoration: const BoxDecoration(
        color: LightColors.kDarkGreyColor2,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Why do you think ${i == 0 ? 'it' : 'number $i  above'} happened?',
            style: LightColors.black2TextStyle.copyWith(fontSize: 12),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                if (answers.length > 1) {
                  answers.removeAt(i);
                } else {
                  answers[0] = '';
                }
              });
            },
            child: Container(
              color: Colors.transparent,
              child: const Icon(
                Icons.delete,
                color: LightColors.kRed,
                size: 14,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget questAnswer(int i) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: defaultMargin / 2,
        vertical: defaultMargin / 2,
      ),
      child: Row(
        children: [
          Container(
            width: 42,
            height: 42,
            alignment: Alignment.center,
            decoration: const BoxDecoration(
              color: LightColors.kDarkGreyColor3,
              shape: BoxShape.circle,
            ),
            child: Text(
              '${i + 1}',
              style: LightColors.black2TextStyle.copyWith(
                fontSize: 16,
                color: LightColors.kDarkGreyColor,
              ),
            ),
          ),
          const SizedBox(width: defaultMargin / 2),
          Flexible(
            child: GestureDetector(
              onTap: () async {
                if (answers[i] != '') {
                  controller.text = answers[i];
                } else {
                  controller.clear();
                }

                final text = await showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  shape: const BeveledRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(defaultCircular),
                      topRight: Radius.circular(defaultCircular),
                    ),
                  ),
                  builder: (context) {
                    return answerFieldDialog(i);
                  },
                );

                if (text != null && text != '') {
                  setState(() {
                    answers[i] = text;

                    if (answers.length < 5 && answers.length < i + 2) {
                      answers.add('');

                      scrollController.animateTo(
                        scrollController.position.maxScrollExtent,
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.decelerate,
                      );
                    }
                  });
                }
              },
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(defaultMargin / 2),
                decoration: BoxDecoration(
                  color: LightColors.kGreyColor,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  answers[i] == '' ? 'Tap to fill...' : answers[i],
                  style: answers[i] == ''
                      ? LightColors.subTitle3TextStyle
                      : LightColors.subTitle3TextStyle.copyWith(
                          color: LightColors.kBlackColor,
                        ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget answerFieldDialog(int i) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(defaultMargin / 1.5),
            decoration: const BoxDecoration(
              color: LightColors.kGreyColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(defaultCircular),
                topRight: Radius.circular(defaultCircular),
              ),
            ),
            child: Row(
              children: [
                Container(
                  width: 30,
                  height: 30,
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(
                    color: LightColors.kDarkGreyColor3,
                    shape: BoxShape.circle,
                  ),
                  child: Text(
                    '${i + 1}',
                    style: LightColors.black2TextStyle.copyWith(
                      fontSize: 12,
                      color: LightColors.kDarkGreyColor,
                    ),
                  ),
                ),
                const SizedBox(width: defaultMargin / 2),
                Flexible(
                  child: Text(
                    'Why do you think ${i == 0 ? 'it' : 'number $i  above'} happened?',
                    style: LightColors.black2TextStyle.copyWith(fontSize: 12),
                  ),
                ),
              ],
            ),
          ),
          const Divider(height: 0),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: defaultMargin / 1.5,
              vertical: defaultMargin / 2,
            ),
            child: KtextFormFieldWidget(
              controller: controller,
              withTitle: false,
              hintText: 'Answer...',
              minLines: 4,
              style: LightColors.subTitle3TextStyle.copyWith(
                color: LightColors.kBlackColor,
              ),
              contentPadding: const EdgeInsets.all(defaultMargin / 1.5),
            ),
          ),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.fromLTRB(
              defaultMargin / 1.5,
              0,
              defaultMargin / 1.5,
              defaultMargin / 1.5,
            ),
            child: KelevatedButtonWidget(
              onPressed: () {
                Navigator.pop(context, controller.text);
              },
              elevation: 0,
              title: 'Save',
            ),
          ),
        ],
      ),
    );
  }

  Widget submitButton() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        horizontal: defaultMargin / 1.5,
        vertical: defaultMargin / 1.2,
      ),
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: LightColors.kDarkGreyColor3,
            offset: Offset(0, -3),
            blurRadius: 6,
          )
        ],
      ),
      child: KelevatedButtonWidget(
        onPressed: () {
          if (answers.length == 5 && answers[4] != '') {
            Navigator.pop(context);
          }
        },
        title: 'Submit & Close Report',
        elevation: 0,
        backgroundColor: answers.length == 5 && answers[4] != ''
            ? LightColors.kPrimaryColor
            : LightColors.kDarkGreyColor,
      ),
    );
  }
}
