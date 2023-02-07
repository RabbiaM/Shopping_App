
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:badges/badges.dart' as badges;
import '../Cubits/initial_cubit.dart';

class CartScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.yellow[100],
        appBar: AppBar(
          title: const Text('Cart'),
          actions: [
            BlocConsumer<InitialCubit,int>(
                listener: (context,state){},
                builder: (context,state) {
                  return  Padding(
                    padding: const EdgeInsets.only(right: 15.0,top: 15.0),
                    child: badges.Badge(
                          position: badges.BadgePosition.bottomEnd(bottom: 4,end: -9),
                          badgeContent: Text(state.toString()),
                          child: Icon(Icons.shopping_cart),
                        ),
                  );
                }
            )
            //Icon(Icons.shopping_cart);
          ],
        ),
        body: BlocConsumer<InitialCubit, int>(
          listener: (context, state) {},
          builder: (context, state) {
            final cubit = context.read<InitialCubit>();
            return ListView.builder(
              itemCount: cubit.cartItems.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(cubit.cartItems[index].name,style: TextStyle(fontWeight: FontWeight.bold),),
                  subtitle: Text(cubit.cartItems[index].price.toString()),
                  trailing: ElevatedButton(
                    onPressed: () {
                      cubit.removeFromCart(cubit.cartItems[index]);
                    },
                    child: Text('Remove Item'),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }

}