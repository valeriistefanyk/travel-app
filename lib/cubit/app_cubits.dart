import 'package:bloc/bloc.dart';

import 'app_cubit_states.dart';
import '../model/data_model.dart';
import '../services/data_services.dart';

class AppCubits extends Cubit<CubitStates> {
  final DataServices data;
  late final places;

  AppCubits({required this.data}) : super(InitialState()) {
    emit(WelcomeState());
  }

  void getData() async {
    try {
      emit(LoadingState());
      places = await data.getDumbInfo();
      emit(LoadedState(places));
    } catch (e) {}
  }

  void detailPage(DataModel data) {
    emit(DetailState(data));
  }

  void goHome() {
    emit(LoadedState(places));
  }
}
