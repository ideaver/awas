import 'package:awas/res/utils/enums.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../state_management/global_states.dart';
import '/res/widgets/kgridview_count_widget.dart';
import 'package:flutter/material.dart';

import '../theme/colors/light_colors.dart';
import 'grid_tile_widget.dart';

class ReportCategoryGridWidget extends ConsumerStatefulWidget {
  const ReportCategoryGridWidget({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ReportCategoryGridWidgetState();
}

class _ReportCategoryGridWidgetState
    extends ConsumerState<ReportCategoryGridWidget> {
  //TODO: change index to enums
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        KgridviewCountWidget(
          children: [
            GridTileWidget(
                selected: selectedIndex == 1,
                title: 'Safe Observation',
                icon: Icons.policy,
                onTap: () {
                  ref
                      .read(selectedReportCategoryOnReportFormProvider.notifier)
                      .state = ReportCategoryEnum.safeObservation;
                  setState(() {
                    selectedIndex = 1;
                  });
                }),
            GridTileWidget(
                selected: selectedIndex == 2,
                title: 'Unsafe Observation',
                icon: Icons.error,
                onTap: () {
                  ref
                      .read(selectedReportCategoryOnReportFormProvider.notifier)
                      .state = ReportCategoryEnum.unSafeObservation;
                  setState(() {
                    selectedIndex = 2;
                  });
                }),
            GridTileWidget(
                selected: selectedIndex == 3,
                title: 'Near Miss',
                icon: Icons.healing,
                onTap: () {
                  ref
                      .read(selectedReportCategoryOnReportFormProvider.notifier)
                      .state = ReportCategoryEnum.nearMiss;

                  setState(() {
                    selectedIndex = 3;
                  });
                }),
            GridTileWidget(
                selected: selectedIndex == 4,
                title: 'HIPO',
                icon: Icons.person_outline,
                onTap: () {
                  ref
                      .read(selectedReportCategoryOnReportFormProvider.notifier)
                      .state = ReportCategoryEnum.hipo;
                  setState(() {
                    selectedIndex = 4;
                  });
                })
          ],
        ),
        const SizedBox(
          height: defaultMargin,
        ),
        Visibility(
          visible: selectedIndex == 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Unsafe sub-Category',
                style: LightColors.black2TextStyle
                    .copyWith(fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: defaultMargin,
              ),
              KgridviewCountWidget(
                children: [
                  GridTileWidget(
                      selected: selectedIndex == 1,
                      title: 'Human Behavior',
                      icon: Icons.directions_run_rounded,
                      onTap: () {
                        setState(() {
                          selectedIndex = 1;
                        });
                      }),
                  GridTileWidget(
                      selected: selectedIndex == 2,
                      title: 'Environment',
                      icon: Icons.nature_rounded,
                      onTap: () {
                        setState(() {
                          selectedIndex = 2;
                        });
                      }),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}
