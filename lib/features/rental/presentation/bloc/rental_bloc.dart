import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'rental_event.dart';
part 'rental_state.dart';

class RentalBloc extends Bloc<RentalEvent, RentalState> {
  RentalBloc() : super(RentalInitial()) {
    on<RentalEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
