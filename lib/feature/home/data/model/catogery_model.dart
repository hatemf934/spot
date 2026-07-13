import 'package:flutter/material.dart';
import 'package:spot/core/utils/assets_manager.dart';
import 'package:spot/core/utils/color_manager.dart';
import 'package:spot/core/utils/text_manager.dart';

class CategoryModel {
  final Color color;
  final String image;
  final String name;

  const CategoryModel({
    required this.color,
    required this.image,
    required this.name,
  });
}

const List<CategoryModel> categories = [
  CategoryModel(
    color: ColorManager.restaurantsColor,
    image: AssetsManager.restaurant,
    name: TextManager.restaurants,
  ),
  CategoryModel(
    color: ColorManager.coffeeShopsColor,
    image: AssetsManager.coffeeCafe,
    name: TextManager.coffeeShops,
  ),
  CategoryModel(
    color: ColorManager.entertainmentColor,
    image: AssetsManager.theater,
    name: TextManager.entertainment,
  ),
  CategoryModel(
    color: ColorManager.parksNatureColor,
    image: AssetsManager.parksOutdoors,
    name: TextManager.parksNature,
  ),
  CategoryModel(
    color: ColorManager.eventsColor,
    image: AssetsManager.partyEvents,
    name: TextManager.events,
  ),
  CategoryModel(
    color: ColorManager.cultureColor,
    image: AssetsManager.natureParks,
    name: TextManager.culture,
  ),
  CategoryModel(
    color: ColorManager.shoppingRetailColor,
    image: AssetsManager.shopping,
    name: TextManager.shoppingRetail,
  ),
  CategoryModel(
    color: ColorManager.fitnessWellnessColor,
    image: AssetsManager.gymFitness,
    name: TextManager.fitnessWellness,
  ),
];
