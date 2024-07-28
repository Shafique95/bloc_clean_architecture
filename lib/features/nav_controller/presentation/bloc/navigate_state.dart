sealed class NavigateState{}
class NavigateInitState extends NavigateState{
  final int index;
  NavigateInitState(this.index);
}