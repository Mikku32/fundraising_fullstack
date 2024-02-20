import 'package:bloc/bloc.dart';
import 'package:fundraising_fullstack/home/models/projects.dart';
import 'package:meta/meta.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
}
