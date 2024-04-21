import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mind_task_app/features/login/data/models/user_model.dart';
import 'package:mind_task_app/features/login/data/repos/login_repo.dart';
import 'package:mind_task_app/features/login/data/requests/login_request.dart';
import 'package:mind_task_app/features/login/logic/cubit/login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  static LoginCubit get(context) => BlocProvider.of(context);

  UserModel? userModel;

  Future<void> login({
    required context,
    required LoginRequest loginRequest,
  }) async {
    emit(LoginLoadingState());
    final response = await LoginRepository.login(
      context: context,
      loginRequest: loginRequest,
    );
    if (response != null) {
      userModel = response;
      emit(LoginSuccessState());
    } else {
      emit(LoginErrorState());
    }
  }
}
