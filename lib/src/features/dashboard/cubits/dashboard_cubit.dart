import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'dashboard_state.dart';

class DashboardCubit extends Cubit<DashboardState> {
  DashboardCubit() : super(DashboardInitial());

  int _bottomNavigationIndex = 0;

  int get bottomNavigationIndex => _bottomNavigationIndex;

  void changeBottomNavigationIndex(int index) {
    emit(DashboardLoading());
    _bottomNavigationIndex = index;
    emit(DashboardSuccess());
  }
}
