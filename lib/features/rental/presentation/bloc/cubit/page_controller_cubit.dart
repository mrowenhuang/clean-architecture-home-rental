import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'page_controller_state.dart';

class PageControllerCubit extends Cubit<PageControllerState> {
  PageControllerCubit() : super(PageControllerInitial());

  void savePage(int index) {
    emit(PageControllerInitial());
    emit(PageChanged(index: index));
  }
}
