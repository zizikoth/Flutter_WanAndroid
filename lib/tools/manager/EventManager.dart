import 'package:dio/dio.dart';
import 'package:event_bus/event_bus.dart';
import 'package:wan/core/base/CoreState.dart';
import 'package:wan/entity/event/LoginEvent.dart';

class EventManager {
  static var _event = EventBus();

  static fireLogin() {
    _event.fire(LoginEvent());
  }

  static onLogin(CoreState state, VoidCallback onSubscribe) {
    var subscribe = _event.on<LoginEvent>().listen((event) {
      onSubscribe();
    });
    state.addEvent(subscribe);
  }

  static fireCollect() {
    _event.fire(CollectionEvent());
  }

  static onCollection(CoreState state, VoidCallback onSubscribe) {
    var subscribe = _event.on<CollectionEvent>().listen((event) {
      onSubscribe();
    });
    state.addEvent(subscribe);
  }
}
