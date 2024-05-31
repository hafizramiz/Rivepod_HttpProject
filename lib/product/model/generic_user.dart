// ignore_for_file: public_member_api_docs, sort_constructors_first
class UserManagement {
  void sayName(GenericUser user) {
    print(user.name);
  }

  int calculateMoney(List<GenericUser> users) {
    int sum = 0;
    for (var element in users) {
      sum += element.money;
    }
    return sum;
    // users.map((e) => e.money).fold(initialValue, (previousValue, element) => null)
  }
}

class GenericUser {
  final String name;
  final String id;
  final int money;
  GenericUser({
    required this.name,
    required this.id,
    required this.money,
  });
}
