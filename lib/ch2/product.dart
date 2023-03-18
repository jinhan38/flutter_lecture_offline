/// Product 클래스를 만들어주세요
/// int price
/// String name
/// String company
/// int count; => 몇 번 구매했는지, 직접 변경은 불가능, buy함수를 통해서만 변경
/// 함수 buy => buy 함수를 호출하면 count가 1씩 증가합니다.
/// 그래서 count가 5인 제품을 만들어주세요
/// 제품의 가격과 이름, 회사명은 아무렇게나 정해도 좋습니다.
class Product {
  int price;
  String name;
  String company;
  int count = 0;

  Product({
    required this.price,
    required this.name,
    required this.company,
  });

  void buy() {
    count++;
    print('$name의 구매 횟수 $count회');
  }
}
