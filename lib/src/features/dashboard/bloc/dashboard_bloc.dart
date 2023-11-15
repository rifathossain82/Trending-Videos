import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'dashboard_event.dart';

part 'dashboard_state.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  DashboardBloc() : super(const DashboardState()) {
    on<ChangeBottomNavigationIndex>(_onChangeBottomNavigationIndex);
  }

  void _onChangeBottomNavigationIndex(
    ChangeBottomNavigationIndex event,
    Emitter<DashboardState> emit,
  ) {
    emit(
      state.copyWith(
        bottomNavigationIndex: event.index,
      ),
    );
  }
}
