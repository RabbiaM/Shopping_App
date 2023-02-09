import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mini_app/Cubits/initial_cubit.dart';
import 'package:mini_app/screens/cart_screen.dart';
import 'package:badges/badges.dart' as badges;
import '../model/Items.dart';

class ItemScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<InitialCubit>();

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

         body: StreamBuilder<List<Items>>(
           stream: cubit.items$.stream,
           builder: (context, snapshot) {
             if (!snapshot.hasData) return Center(
               child: CircularProgressIndicator(),
             );
             return ListView.builder(
               itemCount: snapshot.data!.length,
                 itemBuilder: (context,index){
                 final elements=snapshot.data![index];
                 return ListTile(
                   title: GestureDetector(
                     onTap: (){
                       var id=Random().nextInt(100);
                       var name=elements.name;
                       context.go('/ItemDetail/$name/$id');
                       },
                       child: Text(elements.name)),
                   subtitle: Text(elements.price.toString()),
                   trailing: ElevatedButton(
                          onPressed: () {
                             cubit.addtoCart(elements);
                           },
                           child: Text('Add to Cart'),
                         ),
                 );
               });
           }
         ),
         ),
         );





  }

}