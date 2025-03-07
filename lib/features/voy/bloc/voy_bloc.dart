import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'voy_event.dart';
part 'voy_state.dart';

class VoyBloc extends Bloc<VoyEvent, VoyState> {
  VoyBloc() : super(VoyInitial()) {
    on<VoyEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
