import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mohammadi_shopping/bloc/product_bloc.dart';
import 'package:mohammadi_shopping/bloc/sliders_bloc.dart';
import 'package:mohammadi_shopping/configs.dart';
import 'package:mohammadi_shopping/models/product/product_model.dart';
import 'package:mohammadi_shopping/models/slider/sliders_model.dart';
import 'package:mohammadi_shopping/repo/product_repo.dart';
import 'package:mohammadi_shopping/repo/sliders_repo.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<SlidersBloc>(context).add(FetchSliders());
    BlocProvider.of<GetNewestProductBloc>(context).add(FetchProduct());

    return Column(
      children: <Widget>[
        BlocBuilder<SlidersBloc, SLidersState>(
          builder: (context, state) {
            if (state is SlidersIsLoading)
              return Center(
                child: CircularProgressIndicator(),
              );
            else if (state is SlidersIsLoaded)
              return ShowSliders(state.getSliders);
            else
              return Container();
          },
        ),
        BlocBuilder<GetNewestProductBloc, ProductState>(
          builder: (context, state) {
            if (state is ProductIsLoading)
              return Center(
                child: CircularProgressIndicator(),
              );
            else if (state is ProductIsLoaded)
              return ShowNewestProduct(state.getProduct);
            else
              return Container();
          },
        ),
      ],
    );
  }
}

class ShowSliders extends StatelessWidget {
  List<SlidersModel> slidersModel;

  ShowSliders(this.slidersModel);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SlidersBloc(SlidersRepo()),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
        height: MediaQuery.of(context).size.height * 0.28,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: slidersModel.length,
          itemBuilder: (BuildContext Context, int index) {
            return Container(
              width: MediaQuery.of(context).size.width * 0.6,
              child: Card(
                child: Image.network(
                  Configs.BASE_URL_IMAGE + slidersModel[index].path,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class ShowNewestProduct extends StatelessWidget {
  ProductModel productModel;

  ShowNewestProduct(this.productModel);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetNewestProductBloc(ProductRepo()),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
        height: MediaQuery.of(context).size.height * 0.37,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: productModel.data.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              width: MediaQuery.of(context).size.width * 0.4,
              child: Card(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      child: Image.network(
                        Configs.BASE_URL_IMAGE + productModel.data[index].image,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
