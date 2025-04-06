enum OrderStates { loading, success, failure }

enum UserStates { loading, success, failure }


extension HomeStauts  on HomeState {

  bool get isOrderLoading => orderStates==OrderStates.loading;
  bool get isOrderSuccess => orderStates==OrderStates.success;
  bool get isOrderFail => orderStates==OrderStates.failure;


  bool get isUserLoading =>userStates==UserStates.loading;
  bool get isUserSuccess =>userStates==UserStates.success;
  bool get isUserFail =>userStates==UserStates.failure;



}


class HomeState {
  OrderStates? orderStates;
  UserStates? userStates;

  HomeState({this.userStates, this.orderStates});

  HomeState copyWith({OrderStates? orderStates, UserStates? userStates}) {
    return HomeState(
      orderStates: orderStates ?? this.orderStates,
      userStates: userStates ?? this.userStates,
    );
  }
}
