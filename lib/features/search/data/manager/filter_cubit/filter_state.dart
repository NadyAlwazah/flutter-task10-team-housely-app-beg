part of 'filter_cubit.dart';

sealed class FilterState {}

final class FilterInitial extends FilterState {}

class FilterLoading extends FilterState {}

class FilterSuccess extends FilterState {
  final FilterRequest request;

  FilterSuccess(this.request);
}

class FilterError extends FilterState {
  final String message;

  FilterError(this.message);
}
