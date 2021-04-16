import 'package:bloc/bloc.dart';

class GlobalBlocObserver extends BlocObserver {
  // Pada method onEvent di muculkan ketika ada aksi event ke salah satu Bloc,
  // jadi untuk semua event di semua state management Bloc akan bisa dilihat disini.
  @override
  void onEvent(Bloc bloc, Object event) {
    print('onEvent $event');
    super.onEvent(bloc, event);
  }

  //Pada method onTransition dipanggil ketika ada perubahan state dari
  // Bloc lewat event trigger .add() dan di handle di mapEventToState pada Bloc.
  @override
  void onTransition(Bloc bloc, Transition transition) {
    print('onTransition $transition');
    super.onTransition(bloc, transition);
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    print('onError $error');
    super.onError(bloc, error, stackTrace);
  }
}
