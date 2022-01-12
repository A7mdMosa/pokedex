part of 'favourite_bloc.dart';

abstract class FavouriteEvent extends Equatable {
  const FavouriteEvent();

  @override
  List<Object> get props => [];
}

class FavouriteLoadingEvent extends FavouriteEvent {}

class FavouriteToggleEvent extends FavouriteEvent {
  final Pokemon pokemon;
  const FavouriteToggleEvent(this.pokemon);
}
