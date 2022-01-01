// ignore_for_file: public_member_api_docs, sort_constructors_first
abstract class MyEvent {}

abstract class MyState {}

class StateInitialized extends MyState {}

class StateLoading extends MyState {
  @override
  String toString() => 'Loading...';
}

class StateError extends MyState {
  final String message;
  StateError({required this.message});
  @override
  String toString() => message;
}
