import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mind_task_app/core/shared/svgIcon.dart';
import '../../logic/cubit/layout_cubit.dart';
import '../../logic/cubit/layout_states.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar(this.cubit, {super.key});

  final HomeLayoutCubit cubit;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeLayoutCubit, HomeLayoutStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return BottomAppBar(
            elevation: 2,
            padding: const EdgeInsets.symmetric(
              horizontal: 0,
            ),
            surfaceTintColor: Colors.white,
            shape: const CircularNotchedRectangle(),
            color: Colors.white,
            height: 70,
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(12),
                  topLeft: Radius.circular(12),
                ),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    blurRadius: 3,
                    offset: const Offset(1, 1),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  navBarItem(
                    'home',
                    ontap: () {
                      cubit.changeTab("Home", context);
                    },
                    isSelected: cubit.tabController.index == 0,
                  ),
                  navBarItem(
                    'more',
                    ontap: () {},
                    isSelected: cubit.tabController.index == 1,
                  ),
                  navBarItem(
                    'wishlist',
                    ontap: () {},
                    isSelected: cubit.tabController.index == 2,
                  ),
                  navBarItem(
                    'account',
                    ontap: () {},
                    isSelected: cubit.tabController.index == 3,
                  ),
                ],
              ),
            ),
          );
        });
  }

  Widget navBarItem(
    String icon, {
    VoidCallback? ontap,
    bool isSelected = false,
  }) {
    return InkWell(
      onTap: ontap,
      child: Padding(
        padding: const EdgeInsets.only(top: 20, left: 25, right: 25, bottom: 8),
        child: SvgIcon(
          svg: icon,
          size: 22,
        ),
      ),
    );
  }
}
