part of 'places_cubit.dart';

@immutable
sealed class PlacesState {}

final class PlacesInitial extends PlacesState {}

final class PlacesLoading extends PlacesState {}

final class PlacesFaliure extends PlacesState {
  final Failure failure;

  PlacesFaliure({required this.failure});
}

final class PlacesItemSuccses extends PlacesState {
  final List<PlaceItemDetailsModel> places;

  PlacesItemSuccses({required this.places});
}

final class PlacesDetailsSuccses extends PlacesState {
  final PlacesDetailsModel placesDeatils;

  PlacesDetailsSuccses({required this.placesDeatils});
}

final class PredictionsSuccses extends PlacesState {
  final List<PlacesCityModel> prediction;

  PredictionsSuccses({required this.prediction});
}
