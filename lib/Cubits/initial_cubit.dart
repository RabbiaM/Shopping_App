
import 'package:bloc/bloc.dart';
import 'package:rxdart/rxdart.dart';
import '../model/Items.dart';

class InitialCubit extends Cubit<int>{

  final BehaviorSubject<List<Items>> items$= BehaviorSubject <List<Items>>();
  final BehaviorSubject<List<Items>> cartItems$=BehaviorSubject <List<Items>>();
  InitialCubit():super(0){
    initialize();
  }

  void initialize() {
    final List<Items> value=[];
    value.add(Items(name: 'Banana', price: 20.0));
    value.add(Items(name: 'Mango', price: 30.0));
    value.add(Items(name: 'Orange', price: 50.0));
    value.add(Items(name: 'Strawberry', price: 60.0));
    value.add(Items(name: 'Peach', price: 10.0));
    value.add(Items(name: 'Pomegranate', price: 10.0));
    items$.add(value);
  }

  void addtoCart(Items item){
    final items=items$.valueOrNull ?? [];
    final cart=cartItems$.valueOrNull??[];
    cart.add(item);
    items.remove(item);
    items$.add(items);
    cartItems$.add(cart);
    emit(state+1);
  }

   void removeFromCart(Items item){
     final items=items$.valueOrNull ?? [];
     final cart=cartItems$.valueOrNull??[];
     items.add(item);
     items$.add(items);
     cart.remove(item);
     cartItems$.add(cart);
      emit(state-1);
  }


}