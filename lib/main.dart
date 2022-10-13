import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_example/cart_provider.dart';

void main() {
  runApp(MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => CartProvider())],
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  @override
  void didChangeDependencies() {
    print('didChangeDependencies');
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    print('build method ');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Provider Sample'),
      ),
      body:// Consumer<CartProvider>(
      //  builder: (context, cart, child) {

        //  print('Consumer Called ${cart.items}');

           ListView.builder(
            itemCount: context.watch<CartProvider>().items.length,
            itemBuilder: (context, index) {

              print('UPDATYED');
              return ListTile(
                title: Text(Provider.of<CartProvider>(context, listen: true).items[index]),
                onTap: () {
                  Provider.of<CartProvider>(context, listen: false).deleteItem(index);
                },
              );
            },
          ),
      //  },
     // ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<CartProvider>().addItem('A');
          //Provider.of<CartProvider>(context, listen: false).deleteItem(0);
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
