import 'imports.dart';

void main() {
  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ToastificationWrapper(
      child: MaterialApp(
        title: Strings.appName,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: 'open_sans',
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        home: TransactionSummary(),
      ),
    );
  }
}