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
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
   Home({Key? key}) : super(key: key);

  final shaperKey = GlobalKey();
  final elderKey = GlobalKey();
  final guardianKey = GlobalKey();


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
              TextButton(onPressed: () => Scrollable.ensureVisible(shaperKey.currentContext!), child: const Text("Shaper")),
              TextButton(onPressed: () => Scrollable.ensureVisible(elderKey.currentContext!), child: const Text("Elder")),
              TextButton(onPressed: () => Scrollable.ensureVisible(guardianKey.currentContext!), child: const Text("Guardian")),
              Padding(padding: EdgeInsets.only(right: MediaQuery.sizeOf(context).width /2.25))
            ],
          )
        ],
      ),
      body: Row(
        //mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ColoredBox(
            color: Colors.orange,
            //TODO: Use LayoutBuilder to build responsive size input
            child: LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints){
                return const Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    StrategyForm()
                  ],
                );
              }
            ),
          ),
            ScrollableBody(shaperKey: shaperKey, elderKey: elderKey, guardianKey: guardianKey,)
            ],
          ),
      );
  }
}

class ScrollableBody extends StatelessWidget {
   const ScrollableBody({Key? key, @required this.shaperKey, this.elderKey, this.guardianKey}) : super(key: key);

   final Key? shaperKey;
   final Key? elderKey;
   final Key? guardianKey;


  //final elderKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child:
        ColoredBox(
          color: Colors.greenAccent,
          child: Column(
              children: [
                Text(key: shaperKey,"Shaper Major Frag"),
                Text("Shaper Minor Frag"),
                Padding(padding: EdgeInsets.only(bottom: 875)),
                Text(key: elderKey, "Elder Major Frag"),
                Text("Elder Minor Frag"),
                Padding(padding: EdgeInsets.only(bottom: 875)),
                Text(key: guardianKey, "Guardian Major Frag"),
                Text("Guardian Minor Frag"),
                Padding(padding: EdgeInsets.only(bottom: 875)),
              ]
          ),
        ),
      ),
    );
  }
}


class StrategyForm extends StatefulWidget {
  const StrategyForm({Key? key}) : super(key: key);

  @override
  State<StrategyForm> createState() => _StrategyFormState();
}

class _StrategyFormState extends State<StrategyForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final double formWidth = 200;

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Container(
          //padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
            child:

              Column( //intrinsically limit height
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const DropdownMenu(
                    hintText: "Select Frag Set",
                    //TODO: Pass entry to a function that retrieves prices of set
                    dropdownMenuEntries: [
                      DropdownMenuEntry(value: 1, label: "Shaper"),
                      DropdownMenuEntry(value: 2, label: "Elder"),
                      DropdownMenuEntry(value: 3, label: "Guardian"),
                    ],
                  ),
                  SizedBox(
                      width: formWidth,
                      child: TextFormField(
                          decoration: const InputDecoration(
                          border: UnderlineInputBorder(),
                          labelText: 'Enter # of Runs*',
                        ),
                      )
                  ),
                  SizedBox(
                      width: formWidth,
                      child: TextFormField(
                        decoration: const InputDecoration(
                          border: UnderlineInputBorder(),
                          labelText: 'Enter time per run(min)*',
                        ),
                      )
                  ),
                  // TextFormField(),
                  ElevatedButton(onPressed: (){}, child: const Text("Calculate")),
                  const Text("Div per hour: 123 / hr")
                ].map((widget) => Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: widget,
                )).toList(),
              )
)    );
  }
}



