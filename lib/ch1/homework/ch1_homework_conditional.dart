// 과제
//
// 1. if문 사용
// return타입은 String이고, 입력값은 int인 함수를 만들어주세요.
// 입력 값이 90 이상이면 A을 리턴해주세요
// 입력 값이 80 이상이면 B을 리턴해주세요
// 입력 값이 70 이상이면 C을 리턴해주세요
// 입력 값이 60 이상이면 D을 리턴해주세요
// 입력 값이 50 이상이면 E을 리턴해주세요
// 입력 값이 40 이상이면 F을 리턴해주세요
//
// 2. switch문 사용
// return타입은 String이고, 입력값은 int인 함수를 만들어주세요.
// 입력 값이 1인 경우 월요일을 리턴해주세요
// 입력 값이 2인 경우 화요일을 리턴해주세요
// 입력 값이 3인 경우 수요일을 리턴해주세요
// 입력 값이 4인 경우 목요일을 리턴해주세요
// 입력 값이 5인 경우 금요일을 리턴해주세요
// 입력 값이 6인 경우 토요일을 리턴해주세요
// 입력 값이 7인 경우 일요일을 리턴해주세요

class Ch1HomeworkConditional {
  Ch1HomeworkConditional() {
    String result = conditional(30);
    print('if문 결과값 : $result');
    var switchResult = switchTest(22);
    print('switch문 결과값 : $switchResult');
  }

  String conditional(int score) {
    String result = "";
    if (score >= 90) {
      result = "A";
    } else if (score >= 80) {
      result = "B";
    } else if (score >= 70) {
      result = "C";
    } else if (score >= 60) {
      result = "D";
    } else if (score >= 50) {
      result = "E";
    } else if (score >= 40) {
      result = "F";
    } else {
      result = "찾을 수 없음";
    }
    return result;
  }

  String switchTest(int score) {
    String result = "";
    switch (score) {
      case 1:
        result = "월";
        break;
      case 2:
        result = "화";
        break;
      case 3:
        result = "수";
        break;
      case 4:
        result = "목";
        break;
      case 5:
        result = "금";
        break;
      case 6:
        result = "토";
        break;
      case 7:
        result = "일";
        break;
      default:
        result = "찾을 수 없음";
        break;
    }
    return result;
  }
}
