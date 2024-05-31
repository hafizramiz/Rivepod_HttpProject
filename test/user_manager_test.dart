import 'package:flutter_test/flutter_test.dart';
import 'package:riverpod_http/product/model/generic_user.dart';

void main() {
  setUp(() => () {});
  test("User calculate", () {
    final users = [
      GenericUser(name: "Ali", id: "1", money: 10),
      GenericUser(name: "Ali", id: "2", money: 14),
      GenericUser(name: "Ali", id: "3", money: 23),
    ];
    final result = UserManagement().calculateMoney(users);
    expect(result, 100);
  });
}
