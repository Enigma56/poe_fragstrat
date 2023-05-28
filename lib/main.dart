import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a blue toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const Home(),
    );
  }
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold( //Scrollable?
      appBar: AppBar(
        leading: const Icon(Icons.account_tree_outlined),
        actions: [
          ButtonBar(
            alignment: MainAxisAlignment.center,
            //TODO: Add button padding
            children: [
                //TODO: change onPressed to move selected portions to top of current screen
              TextButton(onPressed: (){}, child: const Text("Shaper")),
              TextButton(onPressed: (){}, child: const Text("Elder")),
              TextButton(onPressed: (){}, child: const Text("Guardian")),
              Padding(padding: EdgeInsets.only(right: MediaQuery.sizeOf(context).width /2))
            ],
          )
        ],
      ),
      body: const Row(
        //mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ColoredBox(
            color: Colors.orange,
            child:Column(
              children: [
                DropdownMenu(
                  //initialSelection: 1,
                  //label: Text("Select Fragment Set"),
                  hintText: "Select Frag Set",
                  dropdownMenuEntries: [
                      DropdownMenuEntry(value: 1, label: "Shaper"),
                      DropdownMenuEntry(value: 2, label: "Elder"),
                      DropdownMenuEntry(value: 3, label: "Guardian"),
                    ],
                )
              ],
            ),
          ),

          Expanded(
            child: SingleChildScrollView(
              child:
                ColoredBox(
                  color: Colors.greenAccent,
                  child: Column(
                    children: [
                      Text("Shaper Major Frag"),
                      Text("Shaper Minor Frag"),
                      Padding(padding: EdgeInsets.only(bottom: 600)),
                      Text("Shaper Major Frag"),
                      Text("Shaper Minor Frag"),
                      Padding(padding: EdgeInsets.only(bottom: 600)),
                      Text("Shaper Major Frag"),
                      Text("Shaper Minor Frag"),
                      Padding(padding: EdgeInsets.only(bottom: 600)),
                    ]
                  ),
                ),
              ),
          ),
            ],
          ),
      );
  }
}

