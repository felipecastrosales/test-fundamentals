import 'package:test/scaffolding.dart';

void main() {
  // test(description, body)
  test(
    'Test without group',
    () {},
  );

  group(
    'Group Test | 1',
    () {
      test(
        'Test inside group | 1',
        () {
          // throw Exception();
        },
      );
    },
  );
  group(
    'Group Test | 2',
    () {
      test(
        'Test inside group | 2',
        () {},
      );
    },
  );
  group(
    'Group Test | 3',
    () {
      test(
        'Test inside group | 3',
        () {},
      );
    },
  );
}
