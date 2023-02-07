
import 'package:bloc/bloc.dart';
import '../model/Items.dart';

class InitialCubit extends Cubit<int>{
  final List<Items> items=[];
  final List<Items> cartItems=[];
  InitialCubit():super(0){
    initialize();
  }

  void initialize() {
    items.add(Items(name:'Apple', price:10.0));
    items.add(Items(name:'Banana', price:20.0));
    items.add(Items(name:'Mango', price:35.0));
    items.add(Items(name:'Orange', price:33.0));
    items.add(Items(name:'Strawberry', price:34.0));
    items.add(Items(name:'Peach', price:24.0));
    items.add(Items(name:'Guava', price:90.0));
    items.add(Items(name:'Pomegranate', price:33.0));
  }

  void addtoCart(Items item){
  cartItems.add(item);
  items.remove(item);
  emit(state+1);
  }

  void removeFromCart(Items item){
    cartItems.remove(item);
    items.add(item);
    emit(state-1);
  }

}