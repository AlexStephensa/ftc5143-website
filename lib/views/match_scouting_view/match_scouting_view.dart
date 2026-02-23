import 'package:flutter/material.dart';
import 'package:myapp/widgets/navagation_Bar/navagation_bar.dart';

class MatchScoutingView extends StatelessWidget {
  const MatchScoutingView({super.key});
  //TODO: make match number and team number dropdown menus that pull from the backend, olny have 4 teams in team number after match number is selected
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          NavagationBar(),
          Center(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(0),
                  child: SizedBox(
                    height: 50,
                    width: 500,
                    child: TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Match Number',
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(0),
                  child: SizedBox(
                    height: 50,
                    width: 500,
                    child: TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Team Number',
                      ),
                    ),
                  ),
                ),
                Text('Auto'),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Counter(
                      title: 'Auto shots attempted',
                    ),
                    Counter(
                      title: 'Auto shots made',
                    ),
                  ],
                ),
                Text('Teleop'),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Counter(
                      title: 'Teleop shots attempted',
                    ),
                    Counter(
                      title: 'Teleop shots made',
                    ),
                  ],
                ),
                Text('Endgame'),
                Padding(
                  padding: const EdgeInsets.all(0.5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(0.5),
                        child: ElevatedButton(
                          onPressed: () {},
                          child: Text('Full Park'),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(0.5),
                        child: ElevatedButton(
                          onPressed: () {},
                          child: Text('Partial Park'),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(0.5),
                        child: ElevatedButton(
                          onPressed: () {},
                          child: Text('No Park'),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    height: 100,
                    width: 500,
                    child: TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Notes',
                      ),
                    ),
                  ),
                ),
                Padding(padding: EdgeInsets.all(0)),
                ElevatedButton(
                  onPressed: () {},
                  child: Text('Submit'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Counter extends StatelessWidget {
  final String title;
  Counter({super.key, this.title = 'Counter'});
  CounterModel counterNo = CounterModel();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8),
      child: Column(
        children: [
          Text(title),
          IconButton(
            onPressed: counterNo.increment,
            icon: Icon(Icons.arrow_drop_up),
          ),
          ListenableBuilder(
            listenable: counterNo,
            builder: (BuildContext context, Widget? child) {
              return Text(counterNo.count.toString());
            },
          ),
          IconButton(
            onPressed: counterNo.decrement,
            icon: Icon(Icons.arrow_drop_down),
          ),
        ],
      ),
    );
  }
}

class CounterModel with ChangeNotifier {
  int _count = 0;

  int get count => _count;

  void increment() {
    _count++;
    notifyListeners();
  }

  void decrement() {
    _count--;
    notifyListeners();
  }
}
