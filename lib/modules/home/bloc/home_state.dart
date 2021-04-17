part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState();
}

class HomeInitial extends HomeState {
  @override
  List<Object> get props => [];
}

class Loading extends HomeState {
  @override
  List<Object> get props => [];
}

class Errorinloading extends HomeState {
  final err;
  Errorinloading({this.err});
  Errorinloading copyWith({var err}) {
    return Errorinloading(err: err ?? this.err);
  }

  @override
  List<Object> get props => [err];
}

class FetchTrainingData extends HomeState {
  List<Trainings> obj;

  FetchTrainingData({this.obj});

  FetchTrainingData copyWith({var obj}) {
    return FetchTrainingData(obj: obj ?? this.obj);
  }

  @override
  List<Object> get props => [obj];
}
