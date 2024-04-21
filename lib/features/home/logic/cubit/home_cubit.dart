import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mind_task_app/features/home/data/models/home_data_model.dart';
import 'package:mind_task_app/features/home/data/repos/home_repo.dart';
import 'package:mind_task_app/features/home/logic/cubit/home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  static HomeCubit get(context) => BlocProvider.of(context);

  HomeDataModel? homeDataModel;

  Future<void> getHomeData({
    required context,
  }) async {
    emit(GetHomeLoadingState());
    final response = await HomeRepository.getHomeData(
      context: context,
    );
    if (response != null) {
      homeDataModel = response;
      emit(GetHomeSuccessState());
    } else {
      emit(GetHomeErrorState());
    }
  }
}
