import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spot/core/services/location_service.dart';
import 'package:spot/core/utils/color_manager.dart';
import 'package:spot/core/utils/font_manager.dart';
import 'package:spot/core/utils/styles.dart';
import 'package:spot/core/utils/text_manager.dart';
import 'package:spot/feature/home/presentation/bloc/places_cubit/places_cubit.dart';
import 'package:spot/feature/home/presentation/view/change_map_location_view.dart';

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
    } on LocationServiceException catch (e) {
      // TODO: تفضل القيمة الافتراضية زي ما هي
    } on LocationPermissionException catch (e) {
      // TODO: تفضل القيمة الافتراضية زي ما هي
    } catch (e) {
      // TODO:
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PlacesCubit, PlacesState>(
      listener: (context, state) {
        if (state is PlaceNameSuccess) {
          setState(() {
            currentLocation = state.namePlace;
          });
        }
      },
      builder: (context, state) {
        return Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                TextManager.welcomeBack,
                style: Styles.textStyleBlack.copyWith(
                  fontSize: FontManager.f24,
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    TextManager.yourLocation,
                    style: Styles.textStyle14.copyWith(
                      color: ColorManager.greyColor400,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        ChangeMapLocationView.id,
                        arguments: (String locationName) {
                          setState(() {
                            currentLocation = locationName;
                          });
                        },
                      );
                    },
                    child: Text(
                      currentLocation,
                      style: Styles.textStyle14.copyWith(
                        color: ColorManager.orangeColor,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
