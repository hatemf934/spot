import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:spot/core/api/dio_class.dart';
import 'package:spot/core/utils/color_manager.dart';
import 'package:spot/core/utils/height_manger.dart';
import 'package:spot/core/utils/padding_manager.dart';
import 'package:spot/core/utils/route_manager.dart';
import 'package:spot/feature/home/data/model/catogery_model.dart';
import 'package:spot/feature/home/data/repos/place_item_details_repo_implement.dart';
import 'package:spot/feature/home/presentation/bloc/places_cubit/places_cubit.dart';
import 'package:spot/feature/home/presentation/view/widgets/homewidgets/gird_view_catogery_card.dart';
import 'package:spot/feature/home/presentation/view/widgets/homewidgets/spots_title_row.dart';
import 'package:spot/feature/home/presentation/view/widgets/homewidgets/welcome_header.dart';

class SpotsScreen extends StatefulWidget {
  const SpotsScreen({super.key});
  static const String id = RouteManager.spotsView;

  @override
  State<SpotsScreen> createState() => _SpotsScreenState();
}

class _SpotsScreenState extends State<SpotsScreen> {
  late final List<PlacesCubit> cubits;

  @override
  void initState() {
    super.initState();
    cubits = categories.map((category) {
      final cubit = PlacesCubit(
        PlacesRepoImplement(dioClass: DioClass(dio: Dio())),
      );
      cubit.getPlaces(textQuery: category.name);
      return cubit;
    }).toList();
  }

  @override
  void dispose() {
    for (final cubit in cubits) {
      cubit.close();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.scaffoldColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(PaddingManager.p12),
          child: Column(
            children: [
              const WelcomeHeader(),
              SizedBox(height: HeightManager.h32),
              const SpotsTitleRow(),
              SizedBox(height: HeightManager.h8),
              Expanded(child: GridViewCatogeryCard(cubits: cubits)),
            ],
          ),
        ),
      ),
    );
  }
}
