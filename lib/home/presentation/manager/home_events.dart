class HomeEvents {}

class OrdersEvents extends HomeEvents {}

class UserEvents extends HomeEvents {}



class SearchEvents extends HomeEvents {
  final String name;
  SearchEvents({required this.name});
}
