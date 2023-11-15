part of 'dashboard_bloc.dart';

class DashboardState extends Equatable {
  const DashboardState({
    this.bottomNavigationIndex = 0,
  });

  final int bottomNavigationIndex;

  DashboardState copyWith({
    int? bottomNavigationIndex,
  }) {
    return DashboardState(
      bottomNavigationIndex:
          bottomNavigationIndex ?? this.bottomNavigationIndex,
    );
  }

  @override
  String toString() {
    return '''DashboardState { 
      bottomNavigationIndex: $bottomNavigationIndex,
    }''';
  }

  @override
  List<Object> get props => [
        bottomNavigationIndex,
      ];
}
