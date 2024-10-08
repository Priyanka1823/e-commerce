
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopnestfrontend/logic/cubits/product_cubit/product_state.dart';

import '../../../data/repositories/product_repository.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit() : super( ProductInitialState() ) {
    _initialize();
  }

  final _productRepository = ProductRepository();

  void _initialize() async {
    emit( ProductLoadingState(state.products) );
    try {
      final products = await _productRepository.fetchAllProducts();
      emit( ProductLoadedState(products) );
    }
    catch(ex) {
      emit( ProductErrorState(ex.toString(), state.products) );
    }
  }
  // void getProducts(String searchQuery) async {
  //   emit(ProductLoadingState(state.products));
  //   try {
  //     final products = await _productRepository.getProducts(searchQuery);
  //     emit(ProductLoadedState(products));
  //   } catch (ex) {
  //     emit(ProductErrorState(ex.toString(), state.products));
  //   }
  // }
}