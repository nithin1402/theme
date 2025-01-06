import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:theme_app/theme_provider.dart';
import 'package:theme_app/theme_setting_page.dart';

void main() {
  runApp(ChangeNotifierProvider(create: (context) => ThemeProvider(),child: MyApp(),));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<ThemeProvider>().getValueFromPrefe();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      themeMode: context.watch<ThemeProvider>().getThemeValue() ? ThemeMode.dark : ThemeMode.light,
      darkTheme: ThemeData.dark(),
      //theme: ThemeData.dark(),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
     _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
  return Scaffold(
      appBar: AppBar(
       backgroundColor: Theme.of(context).colorScheme.inversePrimary,
       title: Text("Home"),
        actions: [
          PopupMenuButton(
            elevation: 11,
              shadowColor: Colors.purpleAccent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(21)
              ),
              itemBuilder: (_){
            return [
              PopupMenuItem(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>ThemeSettingPage()));
                },
                  child: Row(
                children: [
                  Icon(Icons.settings,color: Colors.black,),
                  SizedBox(width: 11,),
                  Text("Settings",style: TextStyle(color: Colors.black),)
                ],
              ))
            ];
  }),
        ],
      ),
      body: Center(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
