import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:blog_app/infrastructure/repository/connectivity.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

part 'connectivity_event.dart';
part 'connectivity_state.dart';

class ConnectivityBloc extends Bloc<ConnectivityEvent, ConnectivityState> {
  StreamSubscription<List<ConnectivityResult>>? connectivityStream;

  ConnectivityBloc() : super(ConnectivityInitial()) {
    on<CheckConnectivity>((event, emit) async {
      final bool connection = await checkInternetConnection();
      if (connection) {
        emit(ConnectivityConnected());
      } else {
        emit(ConnectivityDisconnected());
      }
    });

    connectivityStream = Connectivity()
        .onConnectivityChanged
        .listen((List<ConnectivityResult> result) {
      add(CheckConnectivity());
    });
  }

  @override
  Future<void> close() {
    connectivityStream?.cancel();
    return super.close();
  }
}
