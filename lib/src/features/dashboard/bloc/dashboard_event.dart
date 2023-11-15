part of 'dashboard_bloc.dart';

abstract class DashboardEvent extends Equatable {
  const DashboardEvent();
}

class ChangeBottomNavigationIndex extends DashboardEvent {
  final int index;

  const ChangeBottomNavigationIndex(this.index);

  @override
  List<Object?> get props => [index];
}
