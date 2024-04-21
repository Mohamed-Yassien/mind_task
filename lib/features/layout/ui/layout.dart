import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mind_task_app/features/home/ui/home_screen.dart';
import 'package:mind_task_app/features/layout/ui/widgets/bottom_navbar.dart';
import 'package:mind_task_app/features/layout/ui/widgets/floatactionbotton.dart';
import '../logic/cubit/layout_cubit.dart';
import '../logic/cubit/layout_states.dart';

class LayoutScreen extends StatefulWidget {
  const LayoutScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<LayoutScreen> createState() => _LayoutScreenState();
}

class _LayoutScreenState extends State<LayoutScreen>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    final cubit = HomeLayoutCubit.get(context);
    cubit.tabController =
        TabController(length: 4, vsync: this, initialIndex: 0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final cubit = HomeLayoutCubit.get(context);
    return Scaffold(
      body: TabBarView(
        controller: cubit.tabController,
        physics: const NeverScrollableScrollPhysics(),
        children: const [
          HomeScreen(),
          Scaffold(),
          Scaffold(),
          Scaffold(),
        ],
      ),
      floatingActionButton: const MyFloatActionButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      extendBody: true,
      bottomNavigationBar: BlocConsumer<HomeLayoutCubit, HomeLayoutStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return AnimatedContainer(
            duration: const Duration(milliseconds: 500),
            curve: Curves.fastLinearToSlowEaseIn,
            child: CustomBottomNavBar(
              cubit,
            ),
          );
        },
      ),
    );
  }
}
