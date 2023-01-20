import '/res/theme/colors/light_colors.dart';
import '/res/widgets/kappbar_widget.dart';
import '/res/widgets/kcard_widget.dart';
import '/res/widgets/kdropdown_widget.dart';
import '/res/widgets/kelevated_button.dart';
import '/res/widgets/ktabbar_widget.dart';
import '/res/widgets/ktext_form_field.dart';
import 'package:flutter/material.dart';

class ImportExportPage extends StatefulWidget {
  static const String routeName = '/import-export';

  const ImportExportPage({super.key});

  @override
  State<ImportExportPage> createState() => _ImportExportPageState();
}

class _ImportExportPageState extends State<ImportExportPage>
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
    return Scaffold(
      backgroundColor: LightColors.kBackgroundColor,
      appBar: KappBarWidget(
        context: context,
        title: 'Import & Export Data',
        bottom: KtabBarWidget(
            controller: tabController, titles: ['Export', 'Import']),
      ),
      body: TabBarView(
        controller: tabController,
        children: [
          ListView(
            padding: const EdgeInsets.all(defaultMargin),
            children: [
              KcardWidget.tile(
                  leadingIcon: Icons.info,
                  title:
                      'Exported data format is XLS. Internet connection is required'),
              const SizedBox(
                height: defaultMargin,
              ),
              const KdropdownWidget(title: 'Export Data'),
              const SizedBox(
                height: defaultMargin,
              ),
              const KdropdownWidget(title: 'Export Condition'),
            ],
          ),
          ListView(
            padding: const EdgeInsets.all(defaultMargin),
            children: [
              KcardWidget.tile(
                  leadingIcon: Icons.info,
                  title:
                      'Import file as XLS. Please use below template to work the data. Your imported file will replace existing  data by its id'),
              const SizedBox(
                height: defaultMargin,
              ),
              Text(
                'Step 1',
                style: LightColors.blackTextStyle
                    .copyWith(fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: defaultMargin,
              ),
              Row(
                children: [
                  Text(
                    'Download XLS template.',
                    style: LightColors.subTitle2TextStyle,
                  ),
                  TextButton(
                    child: Text(
                      'click here',
                      style: LightColors.linkTextStyle,
                    ),
                    onPressed: () {},
                  )
                ],
              ),
              const SizedBox(
                height: defaultMargin,
              ),
              Text(
                'Step 2',
                style: LightColors.blackTextStyle
                    .copyWith(fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: defaultMargin,
              ),
              Text(
                'Pick the XLS file from your device',
                style: LightColors.subTitle2TextStyle,
              ),
              const SizedBox(
                height: defaultMargin,
              ),
              Row(
                children: [
                  const Expanded(
                    flex: 2,
                    child: KtextFormFieldWidget(
                        withEnterText: false,
                        withTitle: false,
                        title: 'Laporan-202..'),
                  ),
                  const SizedBox(
                    width: defaultMargin / 2,
                  ),
                  //TODO: Fix this button
                  Expanded(
                      flex: 1,
                      child: KelevatedButtonWidget(
                          onPressed: () {}, title: 'select file'))
                ],
              ),
            ],
          )
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: KelevatedButtonWidget.floating(
        icon: Icons.download,
        title: 'Download',
        onPressed: () {},
      ),
    );
  }
}
