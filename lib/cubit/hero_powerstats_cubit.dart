import 'package:bloc_example/api/api_response.dart';
import 'package:bloc_example/api/api_rest.dart';
import 'package:bloc_example/models/powerstats.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PowerstatsCubit extends Cubit<Powerstats?> {
  PowerstatsCubit(String heroId) : super(null) {
    _loadPowerstats(heroId);
  }

  void _loadPowerstats(String heroId) async {
    var response = await RestApi.getPowerstats(heroId);
    if (response.status == Status.Success && response.data != null) {
      if (!isClosed) {
        emit(response.data);
        print(response.data.toString());
      }
    }
  }
}
