import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:fundraising_fullstack/auth/models/models.dart';

import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  void login(String email, String password) async {
    emit(AuthLoading());
    try {
      final user = await Dio()
          .post("https://stuverse.in/api/user/login/", //go to this page
              data: {'email': email, 'password': password});
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final userObj = User.fromJson(user.data);
      await prefs.setString('token', userObj.token.access);

      emit(AuthSuccess(user: userObj));
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }
}
