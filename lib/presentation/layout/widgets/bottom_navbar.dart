import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mind_task_app/core/shared/customtext.dart';
import 'package:mind_task_app/core/shared/svgIcon.dart';
import '../../../core/themes/colors.dart';
import '../cubit/layout_cubit.dart';
import '../cubit/layout_states.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar(this.cubit, {super.key});

  final HomeLayoutCubit cubit;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeLayoutCubit, HomeLayoutStates>(
        listener: (context, state) {},
        builder: (context, state) {
          // var cubit = HomeLayoutCubit.get(context);
          return BottomAppBar(
            elevation: 5,
            // elevation: 1,
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
            ),
            surfaceTintColor: const Color(0xff6F4C5B),
            shape: const CircularNotchedRectangle(),

            height: 70,
            child: SizedBox(
              //     height: height,
              child: Row(
                children: <Widget>[
                  navBarItem(
                    'home',
                    'home'.tr(),
                    ontap: () {
                      cubit.changeTab("Home", context);
                    },
                    isSelected: cubit.tabController.index == 0,
                  ),
                  navBarItem(
                    'orders',
                    'orders'.tr(),
                    ontap: () {
                      cubit.changeTab("Orders", context);
                    },
                    isSelected: cubit.tabController.index == 1,
                  ),
                ],
              ),
            ),
          );
        });
  }

  Widget navBarItem(
    String icon,
    String title, {
    VoidCallback? ontap,
    bool isSelected = false,
  }) {
    return Expanded(
      child: Container(
        color: isSelected ? const Color(0xffFFE4F7) : Colors.transparent,
        margin: const EdgeInsets.symmetric(horizontal: 40),
        child: InkWell(
          onTap: ontap,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 15),
            child: Column(
              // mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Expanded(
                  child: SvgIcon(
                    svg: icon,
                    color: AppColors.primary,
                  ),
                ),
                const SizedBox(
                  height: 2,
                ),
                CustomText(
                  title,
                  textStyleEnum: TextStyleEnum.caption,
                  color: AppColors.primary,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
