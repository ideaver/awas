import '/res/widgets/kscrollbar_widget.dart';
import '/res/widgets/ktext_form_field.dart';

import '../../res/widgets/kchoicechip_widget.dart';
import '/res/widgets/kcard_widget.dart';
import '/res/widgets/kelevated_button.dart';
import '/res/widgets/report_category_grid_widget.dart';

import '../../res/widgets/kdropdown_widget.dart';
import '../../res/widgets/kexpansiontile_widget.dart';
import '../../res/widgets/location_and_datetime_widget.dart';
import '/res/theme/colors/light_colors.dart';
import '/res/widgets/kappbar_widget.dart';
import '/res/widgets/ktabbar_widget.dart';
import 'package:flutter/material.dart';

import 'package:dotted_border/dotted_border.dart';

class ReportFormPage extends StatefulWidget {
  const ReportFormPage({super.key});

  @override
  State<ReportFormPage> createState() => _ReportFormPageState();
}

class _ReportFormPageState extends State<ReportFormPage>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(vsync: this, length: 2);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final TextStyle titleTextStyle =
        LightColors.black2TextStyle.copyWith(fontWeight: FontWeight.bold);
    //TODO: Change to sliver appbar
    return Scaffold(
      backgroundColor: LightColors.kBackgroundColor,
      appBar: KappBarWidget(
        title: 'Report',
        subTitle: 'ID45345783',
        actions: [
          TextButton(
              onPressed: () {},
              child: Text(
                'Clear',
                style: LightColors.subTitle2TextStyle,
              ))
        ],
        bottom: KtabBarWidget(
            controller: tabController,
            titles: const ['Observation', 'Action'],
            labelIcon: const Icon(
              Icons.chevron_right,
              color: LightColors.kPrimaryColor,
            )),
      ),
      body: TabBarView(
          physics: const BouncingScrollPhysics(),
          controller: tabController,
          children: [
            observationTabBarViewWidget(titleTextStyle, context),
            actionTabBarViewWidget(titleTextStyle, context)
          ]),
    );
  }

  ListView actionTabBarViewWidget(
      TextStyle titleTextStyle, BuildContext context) {
    return ListView(
      physics: const BouncingScrollPhysics(),
      children: [
        const SizedBox(
          height: defaultMargin,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: defaultMargin),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Observed Action/Condition',
                style: titleTextStyle,
              ),
              const SizedBox(
                height: defaultMargin,
              ),
              const KtextFormFieldWidget(
                  minLines: 5, withTitle: false, title: 'description'),
              const SizedBox(
                height: defaultMargin,
              ),
              Text(
                'Impact you believe will occur',
                style: titleTextStyle,
              ),
              const SizedBox(
                height: defaultMargin,
              ),
              const KtextFormFieldWidget(
                  minLines: 5, withTitle: false, title: 'description'),
            ],
          ),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width,
          height: 100,
          child: KscrollBarWidget(
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              itemCount: 20,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                if (index == 0) {
                  return const SizedBox(
                    width: defaultMargin,
                  );
                }
                return const KchoiceChipWidget(selected: true);
              },
            ),
          ),
        ),
        const SizedBox(
          height: defaultMargin,
        ),
        Padding(
          padding: const EdgeInsets.all(defaultMargin),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Preventive and corrective actions',
                style: titleTextStyle,
              ),
              const SizedBox(
                height: defaultMargin,
              ),
              const KtextFormFieldWidget(
                  minLines: 5, withTitle: false, title: 'description'),
            ],
          ),
        ),
        const SizedBox(
          height: defaultMargin,
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: defaultMargin),
          child: LocationAndDateTimeTileWidget(),
        ),
        const SizedBox(
          height: defaultMargin * 2,
        ),
        Padding(
          padding: const EdgeInsets.all(defaultMargin),
          child: Row(
            children: [
              Expanded(
                flex: 2,
                child: KelevatedButtonWidget(
                  backgroundColor: LightColors.kBackgroundColor,
                  textColor: LightColors.kPrimaryColor,
                  title: 'Back',
                  icon: Icons.chevron_left,
                  onPressed: () {
                    tabController.animateTo(tabController.previousIndex);
                  },
                ),
              ),
              const Spacer(),
              Expanded(
                flex: 2,
                child: KelevatedButtonWidget(
                  title: 'Submit',
                  onPressed: () {},
                  icon: Icons.file_upload,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: defaultMargin * 8,
        ),
      ],
    );
  }

  ListView observationTabBarViewWidget(
      TextStyle titleTextStyle, BuildContext context) {
    return ListView(
      physics: const BouncingScrollPhysics(),
      children: [
        uploadImagesSectionWidget(titleTextStyle, context),
        const KexpansionTileWidget(title: 'Report Category', children: [
          ReportCategoryGridWidget(),
          SizedBox(
            height: defaultMargin,
          )
        ]),
        const KexpansionTileWidget(title: 'Observation', children: [
          KdropdownWidget(title: 'Event'),
          SizedBox(
            height: defaultMargin,
          ),
          KdropdownWidget(title: 'Detail'),
          SizedBox(
            height: defaultMargin,
          ),
        ]),
        const KexpansionTileWidget(title: 'Report Category', children: [
          ReportCategoryGridWidget(),
          SizedBox(
            height: defaultMargin,
          )
        ]),
        const SizedBox(
          height: defaultMargin,
        ),
        riskLevelSectionWidget(titleTextStyle),
        const SizedBox(
          height: defaultMargin * 2,
        ),
        Padding(
          padding: const EdgeInsets.all(defaultMargin),
          child: Row(
            children: [
              Expanded(
                flex: 2,
                child: KelevatedButtonWidget(
                  backgroundColor: LightColors.kBackgroundColor,
                  textColor: LightColors.kPrimaryColor,
                  title: 'Draft',
                  onPressed: () {},
                ),
              ),
              const Spacer(),
              Expanded(
                flex: 2,
                child: KelevatedButtonWidget(
                  title: 'Next',
                  onPressed: () {
                    tabController.animateTo(1);
                  },
                  icon: Icons.chevron_right,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: defaultMargin * 8,
        ),
      ],
    );
  }

  Padding riskLevelSectionWidget(TextStyle titleTextStyle) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: defaultMargin),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Risk Level',
            style: titleTextStyle,
          ),
          const SizedBox(
            height: defaultMargin,
          ),
          ListTile(
            contentPadding: const EdgeInsets.all(defaultMargin),
            tileColor: LightColors.kPrimaryColor.withOpacity(0.1),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(defaultCircular)),
            leading: const Icon(
              Icons.sentiment_very_dissatisfied,
              size: 32,
            ),
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'High',
                  style: LightColors.blackTextStyle
                      .copyWith(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: defaultMargin / 4),
                Text(
                  'This report will be notify Supervisor & Manager',
                  style: LightColors.subTitle2TextStyle,
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Column uploadImagesSectionWidget(
      TextStyle titleTextStyle, BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(defaultMargin),
          child: Row(
            children: [
              Text(
                'Upload Images',
                style: titleTextStyle,
              ),
              const SizedBox(
                width: defaultMargin / 4,
              ),
              Text(
                '(max 4)',
                style: LightColors.subTitle3TextStyle,
              ),
            ],
          ),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width,
          height: 130,
          child: ListView(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            children: [
              const SizedBox(
                width: defaultMargin,
              ),
              cameraAddWidget(),
              const SizedBox(
                width: defaultMargin,
              ),
              uploadedImage(),
              uploadedImage(),
              uploadedImage()
            ],
          ),
        ),
        const SizedBox(
          height: defaultMargin,
        )
      ],
    );
  }

  Center uploadedImage() {
    return Center(
      child: Stack(
        children: [
          SizedBox(
            width: 120,
            height: 120,
            child: Center(
              child: Stack(children: [
                KcardWidget(
                    onTap: () {},
                    elevation: 0.0,
                    height: 100,
                    width: 100,
                    padding: const EdgeInsets.all(0.0),
                    child: Image.asset(
                      'assets/bg1.jpeg',
                      fit: BoxFit.cover,
                    ))
              ]),
            ),
          ),
          Positioned(
            right: 2,
            child: Container(
              width: 32,
              height: 32,
              decoration: const BoxDecoration(
                  color: LightColors.kDangerColor, shape: BoxShape.circle),
              child: IconButton(
                  alignment: Alignment.center,
                  onPressed: () {},
                  icon: const Icon(
                    Icons.delete,
                    color: LightColors.kWhiteColor,
                    size: 12,
                  )),
            ),
          )
        ],
      ),
    );
  }

  Center cameraAddWidget() {
    return Center(
      child: FittedBox(
        child: DottedBorder(
          borderType: BorderType.RRect,
          radius: const Radius.circular(defaultCircular),
          padding: const EdgeInsets.all(5),
          dashPattern: const [3, 3, 3, 3],
          color: LightColors.kDarkGreyColor,
          child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(12)),
            child: Container(
              height: 80,
              width: 80,
              color: LightColors.kGreyColor,
              child: const Icon(Icons.photo_camera),
            ),
          ),
        ),
      ),
    );
  }
}