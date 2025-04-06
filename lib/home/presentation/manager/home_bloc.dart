import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:koi/home/presentation/manager/home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeState());

  void getOrders() async {
    emit(state.copyWith(orderStates: OrderStates.loading));
    await Future.delayed(const Duration(seconds: 3));
    emit(state.copyWith(orderStates: OrderStates.success));
  }


  void getUsers() async {
    emit(state.copyWith(userStates: UserStates.loading));
    await Future.delayed(const Duration(seconds: 5));
    emit(state.copyWith(userStates: UserStates.success));
  }

}
