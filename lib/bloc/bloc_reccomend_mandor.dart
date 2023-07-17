import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quliku/model/response/Reccomend_mandor_response.dart';
import 'package:quliku/util/service_locator.dart';

///////////////////// EVENT /////////////////////
class ReccomendMandorEvent {}

class ReccomendMandorRequestEvent extends ReccomendMandorEvent {}

///////////////////// STATE ///////////////////
class ReccomendMandorState{}

class ReccomendMandorStateloading extends ReccomendMandorState {}

class ReccomendMandorStateError extends ReccomendMandorState {
  final String? msg;

  ReccomendMandorStateError({this.msg});
}

class ReccomendMandorStateSuccess extends ReccomendMandorState {
  final ReccomendMandorResponse data;

  ReccomendMandorStateSuccess({required this.data});
}

///////////////////// BLoC /////////////////////
class ReccomendMandorBloc extends Bloc<ReccomendMandorEvent, ReccomendMandorState> {
  final network = ServiceLocator.network;

  // final Function(RestaurantStateList) onStateChanged;

  ReccomendMandorBloc() : super(ReccomendMandorStateloading()) {
    on<ReccomendMandorEvent>((event, emit) async {
      emit(ReccomendMandorStateloading());
      try {
        final model = await network.getReccomendedMandor();
        emit(ReccomendMandorStateSuccess(data: model));
        // if (model.error) {
        //   emit(RestaurantStateListError(msg: model.message));
        // } else {
        //   emit(RestaurantStateListSuccess(data: model));
        // }
      } on Exception catch (e) {
        emit(ReccomendMandorStateError(msg: e.toString()));
      }
    });
  }
}
