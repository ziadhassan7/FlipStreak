class ScrollBehaviourController {

  static bool _rapidScroll = false;

  /// When user is scrolling using indicator
  /// This is a rapid scroll.

  static toggleRapidScroll(){
    _rapidScroll = true;
  }

  static disableRapidScroll(){
    _rapidScroll = false;
  }

  static bool isRapidScroll(){
    return _rapidScroll;
  }

}