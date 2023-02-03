import '../user/user_page.dart';
import '/view/report/image_viewer_page.dart';

import '../../res/widgets/kcard_widget.dart';
import '../../res/widgets/ktext_form_field.dart';
import '/res/utils/enums.dart';

import 'package:flutter/services.dart';
import 'package:carousel_slider/carousel_slider.dart';

import '../../res/widgets/location_and_datetime_widget.dart';
import '/res/widgets/kdivider_widget.dart';

import '../../res/widgets/status_chip_widget.dart';
import '/res/theme/colors/light_colors.dart';
import '/res/widgets/kappbar_widget.dart';
import '/res/widgets/ktabbar_widget.dart';
import 'package:flutter/material.dart';

class ReportDetailsPage extends StatefulWidget {
  static const String routeName = '/report-details';

  const ReportDetailsPage({super.key});

  @override
  State<ReportDetailsPage> createState() => _ReportDetailsPageState();
}

class _ReportDetailsPageState extends State<ReportDetailsPage>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  bool isCommentTextFieldVisible = true;

  @override
  void initState() {
    super.initState();
    tabController = TabController(vsync: this, length: 3);
    tabController.addListener(() {
      // FAB should be visible if and only if user has not scrolled to bottom
      if (tabController.index == 2) {
        setState(() {
          isCommentTextFieldVisible = false;
        });
      } else {
        setState(() {
          isCommentTextFieldVisible = true;
        });
      }
    });
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
    final TextStyle contentTextStyle = LightColors.subTitle2TextStyle;

    return Scaffold(
      backgroundColor: LightColors.kBackgroundColor,
      appBar: appBarWidget(context),
      body: bodyWidget(contentTextStyle, titleTextStyle),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndDocked,
      //TODO: Fix transparency gap
      //TODO: Convert to animated list
      floatingActionButton: commentTextFieldWidget(),
    );
  }

  AnimatedSlide commentTextFieldWidget() {
    return AnimatedSlide(
      duration: const Duration(milliseconds: 300),
      offset: isCommentTextFieldVisible ? const Offset(0, 2) : Offset.zero,
      child: Container(
          height: 100,
          padding: const EdgeInsets.symmetric(
            horizontal: defaultMargin / 4,
            vertical: defaultMargin / 2,
          ),
          decoration: const BoxDecoration(
            color: LightColors.kBackgroundColor,
            border: Border(
              top: BorderSide(
                color: LightColors.kGreyColor,
                width: 3.0,
              ),
            ),
          ),
          child: Row(
            children: [
              const SizedBox(
                width: defaultMargin / 2,
              ),
              // IconButton(
              //     onPressed: () {},
              //     icon: const Icon(
              //       Icons.emoji_emotions,
              //       color: LightColors.kPrimaryColor,
              //     )),
              const SizedBox(width: defaultMargin / 2),
              const Expanded(
                child: KtextFormFieldWidget(
                    withEnterText: false,
                    withTitle: false,
                    title: 'Type message...'),
              ),
              const SizedBox(width: defaultMargin / 2),
              KcardWidget(
                  elevation: 0.0,
                  padding: const EdgeInsets.all(15),
                  color: LightColors.kPrimaryColor,
                  onTap: () {},
                  child: const Icon(
                    Icons.send,
                    color: LightColors.kBackgroundColor,
                  )),
            ],
          )),
    );
  }

  NestedScrollView bodyWidget(
      TextStyle contentTextStyle, TextStyle titleTextStyle) {
    return NestedScrollView(
      floatHeaderSlivers: true,
      headerSliverBuilder: (context, innerBoxIsScrolled) {
        return [sliverAppBarWidget()];
      },
      body: TabBarView(
        controller: tabController,
        children: [
          overviewTabWidget(contentTextStyle, titleTextStyle),
          detailTabWidget(),
          commentTabWidget()
        ],
      ),
    );
  }

  KappBarWidget appBarWidget(BuildContext context) {
    return KappBarWidget(
      systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: LightColors.kBackgroundColor),
      context: context,
      centerTitle: true,
      title: 'Report',
      subTitle: 'ID663298450',
      actions: [
        IconButton(
            onPressed: () {
              //TODO: Implement share intent
            },
            icon: const Icon(
              Icons.share,
              color: LightColors.kDarkGreyColor,
            ))
      ],
    );
  }

  ListView commentTabWidget() {
    return ListView(
      physics:
          const NeverScrollableScrollPhysics(parent: BouncingScrollPhysics()),
      children: [
        const SizedBox(height: defaultMargin / 2),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: defaultMargin),
          child: Row(
            children: [
              const Icon(
                Icons.forum,
                color: LightColors.kDarkGreyColor,
                size: 16,
              ),
              const SizedBox(
                width: 5,
              ),
              Text(
                '0 Comments',
                style: LightColors.subTitle3TextStyle,
              ),
              const Spacer(),
              TextButton.icon(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.share,
                    color: LightColors.kDarkGreyColor,
                    size: 16,
                  ),
                  label: Text(
                    '0 Share',
                    style: LightColors.subTitle3TextStyle,
                  ))
            ],
          ),
        ),
        const SizedBox(height: defaultMargin / 2),
        const KdividerWidget(
          horizontalMargin: 0.0,
        ),
        const SizedBox(height: defaultMargin),
        ...List.generate(10, (index) {
          return commentTileWidget(index);
        }),
        const SizedBox(height: defaultMargin * 5),
      ],
    );
  }

  Widget commentTileWidget(int index) {
    return ListTile(
      contentPadding: EdgeInsets.only(
          top: index.isOdd ? 0 : defaultMargin,
          left: defaultMargin,
          right: defaultMargin),
      onTap: () {
        //TODO: if the id the same as login then view me
        Navigator.pushNamed(context, UserPage.viewAsOtherRouteName);
      },
      leading: Padding(
        padding: EdgeInsets.only(left: index.isOdd ? defaultMargin * 1 : 0),
        child: const CircleAvatar(
          backgroundImage: AssetImage('assets/avatar1.png'),
          radius: 20,
          backgroundColor: LightColors.kSecondaryColor,
        ),
      ),
      title: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RichText(
            text: TextSpan(
              text: 'Sally Rooney ',
              style: LightColors.black2TextStyle.copyWith(fontSize: 12),
              children: [
                index.isOdd
                    ? TextSpan(
                        text: '@John Smiths ',
                        style: LightColors.subTitle2TextStyle.copyWith(
                            fontSize: 12, color: LightColors.kPrimaryColor))
                    : TextSpan(),
                TextSpan(
                    text:
                        'Woahh 😍 which has an associated style that is used for that subtree. The text might break across multiple lines or might all be displayed on the same',
                    style:
                        LightColors.subTitle2TextStyle.copyWith(fontSize: 12)),
              ],
            ),
          ),
          Row(
            children: [
              Text(
                '17h',
                style: LightColors.subTitle3TextStyle.copyWith(fontSize: 10),
              ),
              TextButton(
                  onPressed: () {},
                  child: Text(
                    'Reply',
                    style:
                        LightColors.subTitle3TextStyle.copyWith(fontSize: 10),
                  ))
            ],
          ),
        ],
      ),
    );
  }

  ListView detailTabWidget() {
    return ListView(
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: defaultMargin),
      children: [
        const SizedBox(height: defaultMargin),
        reportRoleTileWidget(reportRole: ReportRole.observer),
        const SizedBox(height: defaultMargin),
        reportRoleTileWidget(reportRole: ReportRole.validator),
        const SizedBox(height: defaultMargin),
        const LocationAndDateTimeTileWidget(),
        const SizedBox(height: defaultMargin),
        const KdividerWidget(
          horizontalMargin: 0.0,
        ),
      ],
    );
  }

  ListView overviewTabWidget(
      TextStyle contentTextStyle, TextStyle titleTextStyle) {
    return ListView(
      physics:
          const NeverScrollableScrollPhysics(parent: BouncingScrollPhysics()),
      padding: const EdgeInsets.symmetric(horizontal: defaultMargin),
      children: [
        const SizedBox(height: defaultMargin),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const statusChipWidget(),
            Text(
              'Duration: 70 min',
              style: contentTextStyle,
            )
          ],
        ),
        const SizedBox(height: defaultMargin),
        Text(
          'Resiko Menumpahkan Masakan Panas',
          style:
              LightColors.blackTextStyle.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: defaultMargin / 2),
        Row(
          children: [
            const Icon(
              Icons.healing,
              color: LightColors.kDangerColor,
            ),
            const SizedBox(width: defaultMargin / 4),
            Text(
              'Near miss',
              style: contentTextStyle,
            ),
            const Spacer(),
            const Icon(
              Icons.sentiment_very_dissatisfied_rounded,
              color: LightColors.kDangerColor,
            ),
            const SizedBox(width: defaultMargin / 4),
            Text(
              'Risk Level: High',
              style: contentTextStyle,
            )
          ],
        ),
        const SizedBox(height: defaultMargin),
        const KdividerWidget(
          horizontalMargin: 0.0,
        ),
        const SizedBox(height: defaultMargin),
        Text(
          'Observation Event',
          style: titleTextStyle,
        ),
        const SizedBox(height: defaultMargin / 2),
        Text(
          'Reaksi Orang',
          style: contentTextStyle,
        ),
        const SizedBox(height: defaultMargin),
        Text(
          'Observation Detail',
          style: titleTextStyle,
        ),
        const SizedBox(height: defaultMargin / 2),
        Text(
          'Merubah Posisi',
          style: contentTextStyle,
        ),
        const SizedBox(height: defaultMargin),
        const KdividerWidget(
          horizontalMargin: 0.0,
        ),
        const SizedBox(height: defaultMargin),
        Text(
          'Observed Action/Condition',
          style: titleTextStyle,
        ),
        const SizedBox(height: defaultMargin / 2),
        Text(
          'Ullamco veniam culpa excepteur id duis aliquip enim esse veniam.',
          style: contentTextStyle,
        ),
        const SizedBox(height: defaultMargin),
        Text(
          'Impact observer believe will occur',
          style: titleTextStyle,
        ),
        const SizedBox(height: defaultMargin / 2),
        Text(
          'Ullamco veniam az excepteur id duis aliquip enim esse veniam.',
          style: contentTextStyle,
        ),
        const SizedBox(height: defaultMargin),
        Text(
          'Corrective & Preventive Actions',
          style: titleTextStyle,
        ),
        const SizedBox(height: defaultMargin / 2),
        Text(
          'Ullamco veniam az excepteur id duis aliquip enim esse veniam.',
          style: contentTextStyle,
        ),
        const SizedBox(height: defaultMargin * 2),
        ListTile(
          contentPadding: const EdgeInsets.all(defaultMargin),
          tileColor: LightColors.kPrimaryColor.withOpacity(0.1),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(defaultCircular)),
          leading: const CircleAvatar(
            backgroundImage: AssetImage('assets/avatar1.png'),
            radius: 25,
            backgroundColor: LightColors.kSecondaryColor,
          ),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Closing Statement',
                style: LightColors.blackTextStyle
                    .copyWith(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: defaultMargin / 4),
              Text(
                'Ullamco veniam az excepteur id duis aliquip enim esse veniam.',
                style: LightColors.subTitle2TextStyle,
              )
            ],
          ),
        ),
        const SizedBox(height: defaultMargin),
        const KdividerWidget(
          horizontalMargin: 0.0,
        ),
      ],
    );
  }

  SliverAppBar sliverAppBarWidget() {
    return SliverAppBar(
      automaticallyImplyLeading: false,
      systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: LightColors.kBackgroundColor),
      backgroundColor: LightColors.kBackgroundColor,
      pinned: true,
      elevation: 0.5,
      toolbarHeight: 0,
      collapsedHeight: 14,
      expandedHeight: 300,
      flexibleSpace: const FlexibleSpaceBar(
          background: CarouselImageWithCustomIndicatorWidget()),
      bottom: KtabBarWidget(
          isScrollable: true,
          controller: tabController,
          titles: const ['Overview', 'Detail', 'Comments (20)']),
    );
  }

  ListTile reportRoleTileWidget({required ReportRole reportRole}) {
    return ListTile(
      onTap: () {
        //TODO: if the id the same as login then view me
        Navigator.pushNamed(context, UserPage.viewAsOtherRouteName);
      },
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(defaultCircular)),
      contentPadding: const EdgeInsets.all(0.0),
      leading: const CircleAvatar(
        backgroundImage: AssetImage('assets/avatar1.png'),
        radius: 25,
        backgroundColor: LightColors.kSecondaryColor,
      ),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Budi - ID8982357',
            style: LightColors.blackTextStyle
                .copyWith(fontWeight: FontWeight.bold, fontSize: 14),
          ),
          const SizedBox(height: defaultMargin / 4),
          Row(
            children: [
              Text(
                'Masinis - ',
                style: LightColors.subTitle3TextStyle,
              ),
              Text(
                'Staff',
                style: LightColors.black2TextStyle
                    .copyWith(fontWeight: FontWeight.bold, fontSize: 12),
              ),
            ],
          )
        ],
      ),
      trailing: Chip(
        backgroundColor: reportRole == ReportRole.observer
            ? LightColors.kPrimaryColor.withOpacity(0.1)
            : LightColors.kTertiaryColor.withOpacity(0.5),
        label: Text(
          reportRole.name,
          style: LightColors.linkTextStyle,
        ),
      ),
    );
  }
}

class CarouselImageWithCustomIndicatorWidget extends StatefulWidget {
  const CarouselImageWithCustomIndicatorWidget({super.key});

  @override
  State<StatefulWidget> createState() {
    return CarouselImageWithCustomIndicatorWidgetState();
  }
}

class CarouselImageWithCustomIndicatorWidgetState
    extends State<CarouselImageWithCustomIndicatorWidget> {
  int currentPos = 0;
  List<String> listPaths = [
    'assets/image1.jpg',
    'assets/image2.jpeg',
    'assets/image3.jpeg',
    'assets/image4.jpeg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        CarouselSlider.builder(
          itemCount: listPaths.length,
          options: CarouselOptions(
              autoPlay: true,
              onPageChanged: (index, reason) {
                setState(() {
                  currentPos = index;
                });
              }),
          itemBuilder: (context, index, realIndex) {
            return MyImageView(listPaths[index]);
          },
        ),
        Positioned(
          left: 0,
          right: 0,
          bottom: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: listPaths.map((url) {
              int index = listPaths.indexOf(url);
              return Container(
                width: 8.0,
                height: 8.0,
                margin: const EdgeInsets.symmetric(
                    vertical: defaultMargin, horizontal: 2.0),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: currentPos == index
                      ? LightColors.kTertiaryColor
                      : LightColors.kWhiteColor,
                ),
              );
            }).toList(),
          ),
        ),
      ]),
    );
  }
}

class MyImageView extends StatelessWidget {
  final String imgPath;

  const MyImageView(this.imgPath, {super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, ImageViewerPage.routeName);
      },
      child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 2),
          child: Image.asset(
            imgPath,
            fit: BoxFit.fitHeight,
          )),
    );
  }
}
