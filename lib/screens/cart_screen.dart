
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:badges/badges.dart' as badges;
import 'package:go_router/go_router.dart';
import 'package:mini_app/model/Items.dart';
import '../Cubits/initial_cubit.dart';

class CartScreen extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<InitialCubit>();

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.yellow[100],
        appBar: AppBar(
          title: const Text('Cart'),
        ),
        body: StreamBuilder<List<Items>>(
            stream: cubit.cartItems$.stream,
            builder: (context, snapshot) {
              if (!snapshot.hasData) return Center(
                child: CircularProgressIndicator(),
              );
              return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context,index){
                    final elements=snapshot.data![index];
                    return ListTile(
                      title: Text(elements.name),
                      subtitle: Text(elements.price.toString()),
                      trailing: ElevatedButton(
                        onPressed: () {
                          cubit.removeFromCart(elements);
                        },
                        child: Text('Remove item'),
                      ),
                    );
                  }
                  );
            }
        ),
                  ),
                );

  }

}