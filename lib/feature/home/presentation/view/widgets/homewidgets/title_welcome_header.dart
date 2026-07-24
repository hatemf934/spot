import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spot/core/services/location_service.dart';
import 'package:spot/core/utils/font_manager.dart';
import 'package:spot/core/utils/styles.dart';
import 'package:spot/core/utils/text_manager.dart';
import 'package:spot/feature/home/presentation/bloc/places_cubit/places_cubit.dart';
import 'package:spot/feature/home/presentation/view/widgets/homewidgets/location_selector_row.dart';

class TitleWelcomeHeader extends StatefulWidget {
  const TitleWelcomeHeader({super.key});

  @override
  State<TitleWelcomeHeader> createState() => _TitleWelcomeHeaderState();
}

class _TitleWelcomeHeaderState extends State<TitleWelcomeHeader> {
  String currentLocation = TextManager.alexandria;
  late LocationService locationService;

  @override
  void initState() {
    super.initState();
    locationService = LocationService();
    fetchCurrentLocationName();
  }

  Future<void> fetchCurrentLocationName() async {
    try {
      final locationData = await locationService.getLocationData();
      if (locationData.latitude == null || locationData.longitude == null) {
        return;
      }
      if (!mounted) return;
      context.read<PlacesCubit>().getPlaceNameFromLatLng(
        latitude: locationData.latitude!,
        longitude: locationData.longitude!,
      );
    } on LocationServiceException {
      // TODO: تفضل القيمة الافتراضية زي ما هي
    } on LocationPermissionException {
      // TODO: تفضل القيمة الافتراضية زي ما هي
    } catch (e) {
      // TODO:
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<PlacesCubit, PlacesState>(
      listener: (context, state) {
        if (state is PlaceNameSuccess) {
          setState(() => currentLocation = state.namePlace);
        }
      },
      child: Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              TextManager.welcomeBack,
              style: Styles.textStyleBlack.copyWith(fontSize: FontManager.f24),
            ),
            LocationSelectorRow(
              currentLocation: currentLocation,
              onLocationChanged: (name) =>
                  setState(() => currentLocation = name),
            ),
          ],
        ),
      ),
    );
  }
}
