import 'package:spot/feature/home/data/model/catogery_model.dart';
import 'package:spot/feature/home/presentation/bloc/places_cubit/places_cubit.dart';

class CardViewArguments {
  final PlacesCubit cubit;
  final CategoryModel categoryModel;

  const CardViewArguments({required this.cubit, required this.categoryModel});
}
