import 'package:bloc_example/api/api_response.dart';
import 'package:bloc_example/api/api_rest.dart';
import 'package:bloc_example/models/image_hero.dart';
import 'package:bloc_example/models/work_hero.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WorkHeroCubit extends Cubit<WorkHero?> {
  WorkHeroCubit(String heroId) : super(null) {
    _loadWorkHero(heroId);
  }

  void _loadWorkHero(String heroId) async {
    var response = await RestApi.getHeroWork(heroId);
    if (response.status == Status.Success && response.data != null) {
      if (!isClosed) {
        emit(response.data);
        print(response.data.toString());
      }
    }
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    super.onError(error, stackTrace);
  }
}
