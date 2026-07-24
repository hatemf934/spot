import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:spot/core/error/error_map_lacation.dart';
import 'package:spot/core/helpers/custom_snack_bar.dart';
import 'package:spot/feature/home/data/model/places_details_model/location.dart';
import 'package:spot/feature/home/data/model/places_details_model/places_details_model.dart';
import 'package:spot/core/services/location_service.dart';
import 'package:spot/core/utils/route_manager.dart';
import 'package:spot/feature/home/presentation/bloc/places_cubit/places_cubit.dart';
import 'package:spot/feature/home/presentation/view/widgets/changeMapViewWidgets/map_search_over_lay.dart';
import 'package:spot/feature/home/presentation/view/widgets/custom_google_map.dart';
import 'package:uuid/uuid.dart';

class ChangeMapLocationView extends StatefulWidget {
  const ChangeMapLocationView({super.key, required this.onLocationSelected});
  static const String id = RouteManager.changeMapLocationView;
  final void Function(String locationName) onLocationSelected;
  @override
  State<ChangeMapLocationView> createState() => _ChangeMapLocationViewState();
}

class _ChangeMapLocationViewState extends State<ChangeMapLocationView> {
  final textController = TextEditingController();
  final uuid = const Uuid();
  final locationService = LocationService();
  late GoogleMapController googleMapController;
  String? sessionToken;
  PlacesDetailsModel? selectedPlace;
  bool isMapReady = false;
  @override
  void initState() {
    fetchPredictions();
    getCurrentLocation();
    super.initState();
  }

  @override
  void dispose() {
    textController.dispose();
    googleMapController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<PlacesCubit, PlacesState>(
      listener: (context, state) {
        if (state is PlacesFaliure) {
          CustomSnackBar.showError(context, message: state.failure.userMessage);
        }
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: [
            CustomGoogleMap(
              placesDetailsModel: selectedPlace,
              onMapCreated: (controller) {
                googleMapController = controller;
                isMapReady = true;
                if (selectedPlace != null) {
                  animateToPlace(selectedPlace!);
                }
              },
            ),
            MapSearchOverlay(
              textEditingController: textController,
              onPlaceSelect: onPlaceSelected,
            ),
          ],
        ),
      ),
    );
  }

  void onPlaceSelected(PlacesDetailsModel place) {
    textController.clear();
    sessionToken = null;

    setState(() => selectedPlace = place);
    animateToPlace(place);

    widget.onLocationSelected(place.displayName?.text ?? '');
  }

  void animateToPlace(PlacesDetailsModel placeDetailsModel) {
    final location = placeDetailsModel.location;
    if (location?.latitude == null || location?.longitude == null) return;

    googleMapController.animateCamera(
      CameraUpdate.newLatLng(LatLng(location!.latitude!, location.longitude!)),
    );
  }

  Future<void> getCurrentLocation() async {
    try {
      final locationData = await locationService.getLocationData();
      if (locationData.latitude == null || locationData.longitude == null) {
        return;
      }
      final currentPlace = PlacesDetailsModel(
        location: Location(
          latitude: locationData.latitude,
          longitude: locationData.longitude,
        ),
      );
      setState(() {
        selectedPlace = currentPlace;
      });
      if (isMapReady) {
        animateToPlace(currentPlace);
      }
    } catch (e) {
      if (!mounted) return;
      CustomSnackBar.showError(context, message: mapLocationErrorToMessage(e));
    }
  }

  void fetchPredictions() {
    textController.addListener(() {
      sessionToken ??= uuid.v4();
      if (textController.text.isNotEmpty) {
        context.read<PlacesCubit>().getPredictions(
          input: textController.text,
          sesstionToken: sessionToken!,
        );
      } else {
        context.read<PlacesCubit>().clearPredictions();
      }
    });
  }
}
