import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:todos/TODOS/screen/widget/todo_widget.dart';
import 'package:todos/TODOS/store/todos_store.dart';
import 'package:provider/provider.dart';

import '../entity/model.dart';
import 'addedTodo.dart';

class TodosScreen extends StatefulWidget {
  const TodosScreen({Key? key}) : super(key: key);

  get title => null;

  @override
  State<TodosScreen> createState() => _TodosScreenState();
}

class _TodosScreenState extends State<TodosScreen> {
  //import store
  TodosStore todosStore = TodosStore();

  bool isApiHit = false;

  @override
  void didChangeDependencies() async {
    todosStore = Provider.of<TodosStore>(context, listen: false);
    if (!isApiHit) {
      await todosStore.getData();
      isApiHit = true;
    }
    super.didChangeDependencies();
  }
  //call didchangedependency
  //if is hitapi is true or not

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo List'),
      ),
      body: Observer(
        builder: (BuildContext context) {
          return todosStore.isLoading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : createBody(todosStore.userResponse.reponse!);
        },
      ),
      floatingActionButton: floatingActionButton(),
    );
  }

  Widget createBody(List<Todos> todos) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: todos.length,
        itemBuilder: (context, index) {
          return TodoListTile(
              todo: todos[index]); // need to see
        });
  }

  Widget floatingActionButton() {
    return FloatingActionButton(
        child: const Icon(Icons.list),
        onPressed: () => Navigator.push(
            context, MaterialPageRoute(builder: (builder) => AddedToDoList())));
  }
}
