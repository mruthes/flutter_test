import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mohammadi_shopping/models/product/product_model.dart';
import 'package:mohammadi_shopping/repo/product_repo.dart';

class ProductEvent extends Equatable {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class FetchProduct extends ProductEvent {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class ResetProduct extends ProductEvent {}

class ProductState extends Equatable {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class ProductReload extends ProductState {}

class ProductIsNotLoaded extends ProductState {}

class ProductIsLoading extends ProductState {}

class ProductIsLoaded extends ProductState {
  final _product;
  ProductIsLoaded(this._product);
  ProductModel get getProduct => _product;
  @override
  // TODO: implement props
  List<Object> get props => [_product];
}

class GetNewestProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductRepo _productRepo;
  GetNewestProductBloc(this._productRepo);

  @override
  // TODO: implement initialState
  ProductState get initialState => ProductReload();

  @override
  Stream<ProductState> mapEventToState(ProductEvent event) async* {
    if (event is FetchProduct) {
      yield ProductIsLoading();
      try {
        ProductModel productModel = await _productRepo.getNewestProduct();
        yield ProductIsLoaded(productModel);
      } catch (_) {
        yield ProductIsNotLoaded();
      }
    } else if (event is ResetProduct) {
      yield ProductReload();
    }
  }
}
