import 'package:test/test.dart';

import 'package:test_fundamentals/cart.dart';
import 'package:test_fundamentals/item.dart';

void main() {
  group(
    'Tests total value calculate cart',
    () {
      test(
        'Calculate total value of cart',
        () {
          // preparing
          final items = [
            Item(name: 'Galaxy', price: 1000),
            Item(name: 'Iphone', price: 10000),
            Item(name: 'USB-C', price: 200),
          ];
          final cart = Cart(items: items);
          // Executing
          var totalValueCart = cart.totalCart();
          // Verifying
          // assert(totalValueCart == 11200);
          expect(totalValueCart, 11200);
        },
      );
      test(
        'Calculate total value of cart equals 0',
        () {
          // preparing
          final items = <Item>[];
          final cart = Cart(items: items);
          // Executing
          var totalValueCart = cart.totalCart();
          // Verifying
          expect(totalValueCart, 0);
        },
      );
    },
  );

  group(
    'Tests total value calculate cart with taxes',
    () {
      test(
        'Calculate total with 10% tax',
        () {
          // preparing
          final items = [
            Item(name: 'Galaxy', price: 1000),
            Item(name: 'Iphone', price: 10000),
            Item(name: 'USB-C', price: 200),
          ];
          final cart = Cart(items: items);
          // Executing
          var totalValueCartWithTaxes = cart.totalCartWithTaxes();
          // Verifying
          // assert(totalValueCart == 11200);
          expect(totalValueCartWithTaxes, 12320);
        },
      );

      // If value is < 500 hasn't taxes
      test(
        'Should return without tax if is < 5000',
        () {
          // preparing
          final items = [
            Item(name: 'Galaxy', price: 1000),
            Item(name: 'USB-C', price: 200),
          ];
          final cart = Cart(items: items);
          // Executing
          var totalValueCart = cart.totalCartWithTaxes();
          // Verifying
          expect(totalValueCart, 1200);
        },
      );

      test(
        'Should return without tax if is = 5000',
        () {
          // preparing
          final items = [
            Item(name: 'Galaxy', price: 1000),
            Item(name: 'iPad', price: 4000),
          ];
          final cart = Cart(items: items);
          // Executing
          var totalValueCart = cart.totalCartWithTaxes();
          // Verifying
          expect(totalValueCart, 5500);
        },
      );

      // If value is > 20000 has taxes with 20%
      test(
        'Should return with tax if is > 20000 | 20% tax',
        () {
          // preparing
          final items = [
            Item(name: 'Macbook', price: 22000),
          ];
          final cart = Cart(items: items);
          // Executing
          var totalValueCart = cart.totalCartWithTaxes();
          // Verifying
          expect(totalValueCart, 26400);
        },
      );

      // If value is = 20000 has taxes with 10%
      test(
        'Should return with tax if is = 20000 | 10% tax',
        () {
          // preparing
          final items = [
            Item(name: 'Macbook 2017', price: 20000),
          ];
          final cart = Cart(items: items);
          // Executing
          var totalValueCart = cart.totalCartWithTaxes();
          // Verifying
          expect(totalValueCart, 22000);
        },
      );
    },
  );

  group(
    'Equal test',
    () {
      test(
        'Equal test | 1',
        () {
          final iphone = Item(name: 'Iphone', price: 10000);
          final items = [
            Item(name: 'Galaxy', price: 1000),
            iphone,
            Item(name: 'USB-C', price: 200),
          ];
          final cart = Cart(items: items);
          expect(
            cart.items,
            contains(
              iphone,
            ),
          );
        },
      );

      test(
        'Equal test | 2',
        () {
          final items = [
            Item(name: 'Galaxy', price: 1000),
            Item(name: 'Iphone', price: 10000),
            Item(name: 'USB-C', price: 200),
          ];
          final cart = Cart(items: items);
          expect(
            cart.items,
            contains(
              Item(name: 'Iphone', price: 10000),
            ),
          );
        },
      );

      test(
        'Equal test by type',
        () {
          final items = [
            Item(name: 'Galaxy', price: 1000),
            Item(name: 'Iphone', price: 10000),
            Item(name: 'USB-C', price: 200),
          ];
          final cart = Cart(items: items);
          expect(
            // cart.items.length, 3,
            cart.items,
            isA<List<Item>>(),
          );
        },
      );

      test(
        'Exception test',
        () {
          final items = <Item>[];
          final cart = Cart(items: items);
          var call = cart.totalCart;
          expect(
            () => call(),
            throwsException,
          );
        },
      );

      test(
        'Custom Exception test',
        () {
          final items = <Item>[];
          final cart = Cart(items: items);
          var call = cart.totalCart;
          expect(
            () => call(),
            throwsA(
              isA<CartException>(),
            ),
          );
        },
      );

      test(
        'Custom Exception test 2', // isn't commum
        () {
          final items = <Item>[];
          final cart = Cart(items: items);
          try {
            cart.totalCart();
          } on CartException {
            print('Success');
          } catch (e) {
            fail('Exception returns other exception $e');
          }
        },
      );
    },
  );
}
