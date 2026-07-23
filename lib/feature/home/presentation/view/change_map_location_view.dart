import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:spot/core/helpers/custom_snack_bar.dart';
import 'package:spot/feature/home/data/model/places_details_model/location.dart';
import 'package:spot/feature/home/data/model/places_details_model/places_details_model.dart';
import 'package:spot/core/services/location_service.dart';
import 'package:spot/core/utils/height_manger.dart';
import 'package:spot/core/utils/padding_manager.dart';
import 'package:spot/core/utils/route_manager.dart';
import 'package:spot/feature/home/presentation/bloc/places_cubit/places_cubit.dart';
import 'package:spot/feature/home/presentation/view/widgets/custom_google_map.dart';
import 'package:spot/feature/home/presentation/view/widgets/custom_list_view_predictions.dart';
import 'package:spot/feature/home/presentation/view/widgets/custom_search_feild.dart';
import 'package:uuid/uuid.dart';

class ChangeMapLocationView extends StatefulWidget {
  const ChangeMapLocationView({super.key, required this.onLocationSelected});
  static const String id = RouteManager.changeMapLocationView;
  final void Function(String locationName) onLocationSelected;
  @override
  State<ChangeMapLocationView> createState() => _ChangeMapLocationViewState();
}

class _ChangeMapLocationViewState extends State<ChangeMapLocationView> {
  late TextEditingController textEditingController;
  late GoogleMapController googleMapController;
  late LocationService locationService;
  late Uuid uuid;
  String? sesstionToken;
  PlacesDetailsModel? selectedPlace;
  bool isMapReady = false;
  @override
  void initState() {
    uuid = const Uuid();
    textEditingController = TextEditingController();
    locationService = LocationService();
    fetchPredictions();
    getCurrentLocation();
    super.initState();
  }

  @override
  void dispose() {
    textEditingController.dispose();
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
            Positioned(
              top: 40,
              left: 0,
              right: 0,
              child: Padding(
                padding: EdgeInsets.all(PaddingManager.p16),
                child: Column(
                  children: [
                    CustomSearchField(
                      textEditingController: textEditingController,
                    ),
                    const SizedBox(height: HeightManager.h12),
                    CustomListViewPredictions(
                      onPlaceSelect: (placeDetailsModel) {
                        textEditingController.clear();
                        sesstionToken = null;
                        setState(() {
                          selectedPlace = placeDetailsModel;
                        });
                        animateToPlace(placeDetailsModel);
                        final selectedName =
                            placeDetailsModel.displayName?.text ?? '';
                        widget.onLocationSelected(selectedName);
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
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
    } on LocationServiceException catch (e) {
      // TODO:
    } on LocationPermissionException catch (e) {
      // TODO :
    } catch (e) {
      // TODO:
    }
  }

  void fetchPredictions() {
    textEditingController.addListener(() {
      sesstionToken ??= uuid.v4();
      if (textEditingController.text.isNotEmpty) {
        context.read<PlacesCubit>().getPredictions(
          input: textEditingController.text,
          sesstionToken: sesstionToken!,
        );
      } else {
        context.read<PlacesCubit>().clearPredictions();
      }
    });
  }
}
