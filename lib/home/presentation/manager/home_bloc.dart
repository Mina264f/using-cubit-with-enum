import 'package:flutter_bloc/flutter_bloc.dart';

import 'home_events.dart';
import 'home_state.dart';

class HomeCubit extends Bloc<HomeEvents, HomeState> {
  HomeCubit() : super(HomeState()) {
    on<OrdersEvents>((event, emit) async {
      await getOrders(emit);
    });

    on<UserEvents>((event, emit) async {
      await getUsers(emit);
    });
  }

  Future<void> getOrders(Emitter<HomeState> emit) async {
    emit(state.copyWith(orderStates: OrderStates.loading));
    await Future.delayed(const Duration(seconds: 3));
    emit(state.copyWith(orderStates: OrderStates.success));
  }

  Future<void> getUsers(Emitter<HomeState> emit) async {
    emit(state.copyWith(userStates: UserStates.loading));
    await Future.delayed(const Duration(seconds: 5));
    emit(state.copyWith(userStates: UserStates.success));
  }
}
