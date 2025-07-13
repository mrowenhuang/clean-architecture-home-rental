part of 'page_controller_cubit.dart';

sealed class PageControllerState extends Equatable {
  const PageControllerState();

  @override
  List<Object> get props => [];
}

final class PageControllerInitial extends PageControllerState {}

final class PageChanged extends PageControllerState {
  final int index;

  const PageChanged({required this.index});
  
}
