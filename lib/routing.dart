import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:mini_app/screens/cart_screen.dart';
import 'package:mini_app/screens/item_detail.dart';
import 'package:mini_app/screens/item_screen.dart';

class AppRoute {
  static final GoRouter router = GoRouter(routes: [
    GoRoute(
      name: "home",
        path: "/",
        builder: (BuildContext context, GoRouterState state) {
          return ItemScreen();
        },
        routes: [
          GoRoute(
            path: "ItemDetail/:name/:id",
            builder: (BuildContext context, GoRouterState state) {
              return ItemDetail(
                name:state.params["name"]!,
                id: state.params["id"]!
              );
            },
          ),
          GoRoute(
              path: "CartScreen",
              builder: (BuildContext context, GoRouterState state) {
                return CartScreen();
              }),
        ]),


  ]);
}
