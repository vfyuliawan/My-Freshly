// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'cart_count_bloc.dart';

@immutable
abstract class CartCountState {}

class CartCountInitial extends CartCountState {}

class CartCountIsSuccess extends CartCountState {
  final int count;
  CartCountIsSuccess({
    required this.count,
  });
}

class CartCountIsFailed extends CartCountState {}

class CartCountIsLoading extends CartCountState {}
