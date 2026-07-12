import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:spot/core/api/dio_class.dart';
import 'package:spot/core/model/places_city_model/places_city_model.dart';
import 'package:spot/core/services/places_service.dart';
import 'package:spot/core/utils/height_manger.dart';
import 'package:spot/core/utils/padding_manager.dart';
import 'package:spot/core/utils/route_manager.dart';
import 'package:spot/feature/home/presentation/view/widgets/custom_google_map.dart';
import 'package:spot/feature/home/presentation/view/widgets/custom_list_view_predictions.dart';
import 'package:spot/feature/home/presentation/view/widgets/custom_search_feild.dart';

class ChangeMapLocationView extends StatefulWidget {
  const ChangeMapLocationView({super.key});
  static const String id = RouteManager.changeMapLocationView;

  @override
  State<ChangeMapLocationView> createState() => _ChangeMapLocationViewState();
}

class _ChangeMapLocationViewState extends State<ChangeMapLocationView> {
  late TextEditingController textEditingController;
  late GoogleMapsPlacesService googleMapsPlacesService;
  List<PlacesCityModel> places = [];
  @override
  void initState() {
    textEditingController = TextEditingController();
    googleMapsPlacesService = GoogleMapsPlacesService(
      dioClass: DioClass(dio: Dio()),
    );
    fetchPredictions();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    textEditingController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          CustomGoogleMap(),
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
                  CustomListViewPredictions(places: places),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void fetchPredictions() {
    textEditingController.addListener(() async {
      if (textEditingController.text.isNotEmpty) {
        var result = await googleMapsPlacesService.getPredictions(
          input: textEditingController.text,
        );
        places.clear();
        places.addAll(result);
        setState(() {});
      } else {
        places.clear();
      }
    });
  }
}
