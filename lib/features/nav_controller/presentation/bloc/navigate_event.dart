sealed class NavigateEvent {}
class NavigateControlEvent extends NavigateEvent{
  final int index;
  NavigateControlEvent(this.index);
}