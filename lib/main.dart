import 'package:flutter/material.dart';
import 'package:flutter_application_1/notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(ProviderScope(child: const MainApp()));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Consumer(
          builder: (f, ref, c) {
            String name = ref.watch(userNameProvider);

            return Center(
              child: InkWell(
                onTap: () {
                  // Navigator.push(context, MaterialPageRoute(builder: (_) => const ));

                  ref.read(userNameProvider.notifier).updateName("test");
                },
                child: Text('Hello World!${name}'),
              ),
            );
          },
        ),
      ),
    );
  }
}
