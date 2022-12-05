part of 'utilities.dart';

mixin routeName {
  static const login = '/login';
  static const splash = '/splash';
  static const register = '/register';
  static const home = '/home';
  static const admin = 'admin';
  static const adminPath = '/home/admin';
  static const cart = 'cart';
  static const cartPath = '/home/cart';
  static const detail = 'detail';
  static const detailPath = '/home/detail';
  static const myOrder = 'myOrder';
  static const myOrderPath = '/home/myOrder';
  static const search = 'search';
  static const searchPath = '/home/search';
}

final GoRouter router = GoRouter(initialLocation: routeName.splash, routes: [
  GoRoute(
    path: routeName.splash,
    redirect: (context, state) {
      if (FirebaseAuth.instance.currentUser != null) {
        BlocProvider.of<UserBloc>(context).add(LoadUserData());
        return routeName.home;
      } else {
        return routeName.login;
      }
    },
    builder: (context, state) {
      return const SplashScreen();
    },
  ),
  GoRoute(
    path: routeName.register,
    builder: (context, state) {
      return const RegisterScreen();
    },
  ),
  GoRoute(
    path: routeName.login,
    builder: (context, state) {
      return const AnakBagong();
    },
  ),
  GoRoute(
      path: routeName.home,
      builder: (context, state) {
        BlocProvider.of<UserBloc>(context).add(LoadUserData());
        BlocProvider.of<CartCountCubit>(context).getCartCount();
        BlocProvider.of<ListProductBloc>(context).add(FetchListProduct());
        BlocProvider.of<ListProductDagingBloc>(context)
            .add(FetchListProductDaging());
        BlocProvider.of<ListProductSayurBloc>(context)
            .add(FetchListProductSayur());
        BlocProvider.of<ListProductBuahBloc>(context)
            .add(FetchListProductBuah());
        BlocProvider.of<ListProductIkanBloc>(context)
            .add(FetchListProductIkan());
        BlocProvider.of<ListCartBloc>(context).add(FetchListCart());
        BlocProvider.of<ListOrderBloc>(context).add(FetchListOrder());
        return const HomeScreen();
      },
      routes: [
        GoRoute(
          path: routeName.cart,
          builder: (context, state) {
            BlocProvider.of<ListCartBloc>(context).add(FetchListCart());
            return const CartScreen();
          },
        ),
        GoRoute(
          path: routeName.admin,
          builder: (context, state) {
            return const AdminScreen();
          },
        ),
        GoRoute(
          path: routeName.detail,
          builder: (context, state) {
            String id = state.extra as String;
            BlocProvider.of<DetailProductBloc>(context)
                .add(FetchDetailProduct(id));
            BlocProvider.of<CheckSavedCubit>(context).checkWishList(id);
            return const DetailScreen();
          },
        ),
        GoRoute(
          path: routeName.search,
          builder: (context, state) {
            return const SearchView();
          },
        ),
        GoRoute(
          path: routeName.myOrder,
          builder: (context, state) {
            return const MyOrderScreen();
          },
        )
      ]),
]);
