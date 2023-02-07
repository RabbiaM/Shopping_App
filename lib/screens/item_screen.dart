import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_app/Cubits/initial_cubit.dart';
import 'package:mini_app/screens/cart_screen.dart';
import 'package:badges/badges.dart' as badges;

class ItemScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {


    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.yellow[100],
        appBar: AppBar(title: Text('Item List'),
          actions: [
            BlocConsumer<InitialCubit,int>(
                listener: (context,state){},
                builder: (context,state) {
                  return  Padding(
                    padding: const EdgeInsets.only(right: 15.0,top: 15.0),
                    child: InkWell(
                      onTap: (){Navigator.push(
                          context, MaterialPageRoute(builder: (context)=>CartScreen()));
                      },
                      child: badges.Badge(
                        position: badges.BadgePosition.bottomEnd(bottom: 4,end: -9),
                        badgeContent: Text(state.toString()),
                        child: Icon(Icons.shopping_cart),
                      ),
                    ),

                  );

                }
            )
            //Icon(Icons.shopping_cart);
          ],),
        body:BlocConsumer<InitialCubit, int>(
          listener: (context, state) {},
          builder: (context, state) {
            final cubit = context.read<InitialCubit>();
            return ListView.builder(
              itemCount: cubit.items.length,
              itemBuilder: (context, index) {
                return ListTile(
                    title: Text(cubit.items[index].name,style: TextStyle(fontWeight: FontWeight.bold)),
                    subtitle: Text(cubit.items[index].price.toString()),
                    trailing: ElevatedButton(
                      onPressed: () {
                      cubit.addtoCart(cubit.items[index]);
                      },
                      child: Text('Add to Cart'),
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