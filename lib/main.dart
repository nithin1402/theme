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
      darkTheme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.black,
          surface: Colors.black,
        ),
        textTheme : TextTheme(
          bodyLarge: TextStyle(fontSize: 25,color: Colors.green),
          bodyMedium: TextStyle(fontSize: 18,color: Colors.green),
          bodySmall: TextStyle(fontSize: 12,color: Colors.green),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.orange,
            minimumSize: Size(200, 50)
          )
        )
      ),
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
              seedColor: Colors.white,
              surface: Colors.white
          ),
          textTheme : TextTheme(
            bodyLarge: TextStyle(fontSize: 25,color: Colors.blue),
            bodyMedium: TextStyle(fontSize: 18,color: Colors.blue),
            bodySmall: TextStyle(fontSize: 12,color: Colors.blue),
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  minimumSize: Size(200, 50)
              )
          )
      ),
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
       //backgroundColor: Theme.of(context).colorScheme.inversePrimary,
       title: Text("Home",style: Theme.of(context).textTheme.bodyLarge,),
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
             Text(
              'You have pushed the button this many times:',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            ElevatedButton(onPressed: () {}, child: Text("Login"),style: Theme.of(context).elevatedButtonTheme.style,),
            SizedBox(height: 11,),
            ElevatedButton(onPressed: () {}, child: Text("Sign up"),style: Theme.of(context).elevatedButtonTheme.style!.copyWith(foregroundColor: WidgetStatePropertyAll(Colors.white)),)
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
