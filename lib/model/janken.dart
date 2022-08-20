class JankenSystem {
  String result(String myHand, String computerHand) {
    final myHandNumber = jankenNumber(myHand);
    final computerHandNumber = jankenNumber(computerHand);
    if (myHandNumber == computerHandNumber) {
      return 'あいこ';
    } else if ((myHandNumber + 1) % 3 == computerHandNumber) {
      return 'かち';
    } else {
      return 'まけ';
    }
  }

  int jankenNumber(String hand) {
    if (hand == '✊') {
      return 0;
    } else if ( hand == '✌️') {
      return 1;
    } else {
      return 2;
    }
  }
}