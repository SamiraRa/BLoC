import 'package:bloc_app/Model/task_data_model.dart';
import 'package:bloc_app/counterBloc.dart';
import 'package:bloc_app/next_page.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  CounterBloc counterBloc = CounterBloc();
  TextEditingController titleController = TextEditingController();

  List<Task> taskList = [
    Task(
      title: "Task1",
    ),
    Task(title: "Task2"),
    Task(title: "Task3"),
  ];

  @override
  void initState() {
    counterBloc = CounterBloc();
    super.initState();
  }

  void _addTask(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (context) => SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom,
                ),
                child: Column(
                  children: [
                    const Text(
                      "Add Task",
                      style: TextStyle(fontSize: 18),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        controller: titleController,
                        autofocus: false,
                        decoration: const InputDecoration(
                            label: Text('Title'), border: OutlineInputBorder()),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text("Cancel")),
                        const SizedBox(
                          width: 20,
                        ),
                        ElevatedButton(
                            onPressed: () {}, child: const Text("Add")),
                        IconButton(
                            onPressed: () => counterBloc.increment(),
                            icon: const Icon(Icons.add)),
                        const SizedBox(
                          width: 30,
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.title),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(
            // flex: 3,
            child: ListView.builder(
                itemCount: taskList.length,
                itemBuilder: (context, index) {
                  var task = taskList[index];
                  return ListTile(
                    title: Text(task.title),
                    trailing: Checkbox(
                      onChanged: (value) {},
                      value: task.isDone,
                    ),
                  );
                }),
          ),
          const SizedBox(
            height: 20,
          ),
          Column(
              // crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                StreamBuilder<int>(
                    stream: counterBloc.getStream(),
                    initialData: 0,
                    builder: (context, snapshot) {
                      return Text(
                        '${snapshot.data}',
                        style: Theme.of(context).textTheme.headline4,
                      );
                    }),
              ]),
          const SizedBox(
            height: 10,
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const NextPage()));
            },
            child: const Text("Next Page"),
          ),
          const SizedBox(
            height: 250,
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _addTask(context),
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
