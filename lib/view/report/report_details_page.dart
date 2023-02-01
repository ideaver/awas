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

  @override
  void initState() {
    super.initState();
    tabController = TabController(vsync: this, length: 3);
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
//TODO: add 5 whys close statement
    return Scaffold(
      backgroundColor: LightColors.kBackgroundColor,
      appBar: KappBarWidget(
        context: context,
        //TODO: Change to sliver background flexible one image
        centerTitle: true,
        title: 'Report',
        subTitle: '  ID663298450',
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.share,
                color: LightColors.kDarkGreyColor,
              ))
        ],
      ),
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverAppBar(
              systemOverlayStyle: const SystemUiOverlayStyle(
                  statusBarColor: LightColors.kBackgroundColor),
              elevation: 0.0,
              backgroundColor: LightColors.kBackgroundColor,
              toolbarHeight: 52,
              pinned: true,
              expandedHeight: 350,
              flexibleSpace: FlexibleSpaceBar(
                  stretchModes: const [StretchMode.blurBackground],
                  background: Padding(
                    padding: const EdgeInsets.only(
                        top: 120,
                        left: defaultMargin,
                        right: defaultMargin,
                        bottom: 80),
                    child: CarouselImageWithCustomIndicatorWidget(),
                  )),
              bottom: KtabBarWidget(
                  isScrollable: true,
                  controller: tabController,
                  titles: const ['Overview', 'Detail', 'Comments (20)']),
            )
          ];
        },
        body: ListView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.all(defaultMargin),
          children: [
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
              style: LightColors.blackTextStyle
                  .copyWith(fontWeight: FontWeight.bold),
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
            const SizedBox(height: defaultMargin),
            const KdividerWidget(
              horizontalMargin: 0.0,
            ),
            const SizedBox(height: defaultMargin),
            observerTileWidget(),
            const SizedBox(height: defaultMargin),
            const LocationAndDateTimeTileWidget(),
            const SizedBox(height: defaultMargin),
            const KdividerWidget(
              horizontalMargin: 0.0,
            ),
            const SizedBox(height: defaultMargin),
            Row(
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
            const SizedBox(height: defaultMargin),
            const KdividerWidget(
              horizontalMargin: 0.0,
            ),
            const SizedBox(height: defaultMargin),
            //TODO: implement comments
            const SizedBox(height: defaultMargin * 8),
          ],
        ),
      ),
    );
  }

  ListTile observerTileWidget() {
    return ListTile(
      onTap: () {
        Navigator.pushNamed(context, '/profile');
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
                .copyWith(fontWeight: FontWeight.bold),
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
                    .copyWith(fontWeight: FontWeight.bold),
              ),
            ],
          )
        ],
      ),
      trailing: Chip(
        backgroundColor: LightColors.kPrimaryColor.withOpacity(0.1),
        label: Text(
          'Observer',
          style: LightColors.linkTextStyle,
        ),
      ),
    );
  }
}

class CarouselImageWithCustomIndicatorWidget extends StatefulWidget {
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
      body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
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
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: listPaths.map((url) {
            int index = listPaths.indexOf(url);
            return Container(
              width: 8.0,
              height: 8.0,
              margin:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: currentPos == index
                    ? const Color.fromRGBO(0, 0, 0, 0.9)
                    : const Color.fromRGBO(0, 0, 0, 0.4),
              ),
            );
          }).toList(),
        ),
      ])),
    );
  }
}

class MyImageView extends StatelessWidget {
  String imgPath;

  MyImageView(this.imgPath);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
        margin: const EdgeInsets.symmetric(horizontal: 5),
        child: FittedBox(
          fit: BoxFit.fill,
          child: Image.asset(imgPath),
        ));
  }
}
