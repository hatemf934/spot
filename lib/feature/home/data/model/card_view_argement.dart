import 'package:spot/feature/home/data/model/catogery_model.dart';
import 'package:spot/feature/home/presentation/bloc/places_item_cubit/places_item_cubit.dart';

class CardViewArguments {
  final PlacesItemCubitCubit cubit;
  final CategoryModel categoryModel;

  const CardViewArguments({required this.cubit, required this.categoryModel});
}
