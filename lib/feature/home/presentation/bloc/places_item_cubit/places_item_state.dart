part of 'places_item_cubit.dart';

@immutable
sealed class PlacesItemCubitState {}

final class PlacesItemCubitInitial extends PlacesItemCubitState {}

final class PlacesItemCubitLoading extends PlacesItemCubitState {}

final class PlacesItemCubitSuccses extends PlacesItemCubitState {
  final List<PlaceItemDetailsModel> places;

  PlacesItemCubitSuccses({required this.places});
}

final class PlacesItemCubitFaliure extends PlacesItemCubitState {
  final Failure failure;

  PlacesItemCubitFaliure({required this.failure});
}
