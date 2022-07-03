import '../common/EventBus.dart';

//1.创建eventbus
EventBus eventBus = EventBus(sync: true);

class BaseEvent {
  int eventVersion = 1;
}

class TextChangeEvent extends BaseEvent {
  String? msg;

  TextChangeEvent({this.msg});
}
