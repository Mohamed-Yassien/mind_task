import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mind_task_app/presentation/layout/widgets/bottom_navbar.dart';
import 'package:mind_task_app/presentation/layout/widgets/floatactionbotton.dart';
import 'cubit/layout_cubit.dart';
import 'cubit/layout_states.dart';

class Layout extends StatefulWidget {
  const Layout({Key? key, required this.child}) : super(key: key);
  final Widget child;

  @override
  State<Layout> createState() => _LayoutState();
}

class _LayoutState extends State<Layout> with SingleTickerProviderStateMixin {
  @override
  void initState() {
    final cubit = HomeLayoutCubit.get(context);
    cubit.tabController =
        TabController(length: 2, vsync: this, initialIndex: 0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final cubit = HomeLayoutCubit.get(context);
    return Scaffold(
      // body: NotificationListener<ScrollNotification>(child: widget.child),
      body: TabBarView(
        controller: cubit.tabController,
        physics: const NeverScrollableScrollPhysics(),
        children: const [
          // HomeScreen(),
          // OrdersScreen(),
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
          }),
    );
  }
}

GlobalKey<NavigatorState> navKey = GlobalKey<NavigatorState>();
