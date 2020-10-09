import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mohammadi_shopping/models/slider/sliders_model.dart';
import 'package:mohammadi_shopping/repo/sliders_repo.dart';

class SlidersEvent extends Equatable {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class FetchSliders extends SlidersEvent {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class ResetSliders extends SlidersEvent {}

class SLidersState extends Equatable {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class SlidersReload extends SLidersState {}

class SlidersIsNotLoaded extends SLidersState {}

class SlidersIsLoading extends SLidersState {}

class SlidersIsLoaded extends SLidersState {
  final _sliders;
  SlidersIsLoaded(this._sliders);
  List<SlidersModel> get getSliders => _sliders;
  @override
  // TODO: implement props
  List<Object> get props => [_sliders];
}

class SlidersBloc extends Bloc<SlidersEvent, SLidersState> {
  SlidersRepo _slidersRepo;
  SlidersBloc(this._slidersRepo);

  @override
  // TODO: implement initialState
  SLidersState get initialState => SlidersReload();

  @override
  Stream<SLidersState> mapEventToState(SlidersEvent event) async* {
    if (event is FetchSliders) {
      yield SlidersIsLoading();
      try {
        List<SlidersModel> slidersModel = await _slidersRepo.getSliders();
        yield SlidersIsLoaded(slidersModel);
      } catch (_) {
        yield SlidersIsNotLoaded();
      }
    } else if (event is ResetSliders) {
      yield SlidersReload();
    }
  }
}
