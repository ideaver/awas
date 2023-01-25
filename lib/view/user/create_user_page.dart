import '../../res/widgets/profile_card_widget.dart';
import '/res/theme/colors/light_colors.dart';
import '/res/widgets/kappbar_widget.dart';
import '/res/widgets/user_form_widget.dart';
import 'package:flutter/material.dart';

class CreateUserPage extends StatelessWidget {
  static const String routeName = '/create-user';

  const CreateUserPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: LightColors.kBackgroundColor,
      appBar: KappBarWidget(
          centerTitle: false,
          title: 'Create Employee/Manager',
          context: context),
      body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return const [
              SliverAppBar(
                automaticallyImplyLeading: false,
                elevation: 0.0,
                backgroundColor: LightColors.kBackgroundColor,
                expandedHeight: 200,
                flexibleSpace: FlexibleSpaceBar(
                    stretchModes: [StretchMode.blurBackground],
                    background: Padding(
                      padding: EdgeInsets.only(
                        left: defaultMargin,
                        right: defaultMargin,
                      ),
                      child: ProfileCardWidget(),
                    )),
              )
            ];
          },
          body: const UserFormWidget()),
    );
  }
}
