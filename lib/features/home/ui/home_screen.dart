import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mind_task_app/features/home/logic/cubit/home_cubit.dart';
import 'package:mind_task_app/features/home/logic/cubit/home_state.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit()..getHomeData(context: context),
      child: Scaffold(
        body: BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            return state is GetHomeLoadingState
                ? const CircularProgressIndicator.adaptive()
                : const Center(
                    child: Text("Home Screen"),
                  );
          },
        ),
      ),
    );
  }
}
