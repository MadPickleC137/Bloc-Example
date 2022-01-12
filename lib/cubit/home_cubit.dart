import 'package:bloc_example/models/heroes.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<Map<int, String>> {
  HomeCubit() : super(heroes);

  void getHeroes() => emit(heroes);
}
