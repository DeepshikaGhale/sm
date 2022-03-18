import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
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
          return todoItemWidget(
              id: todos[index].id.toString(),
              title: todos[index].title,
              completed: false,
              index: todos[index].id); // need to see
        });
  }

  Widget todoItemWidget(
      {required String id,
      required String title,
      required bool completed,
      required int index}) {
    return ListTile(
      leading: Text(id),
      title: Text(title),
      trailing: Checkbox(
        value: completed,
        onChanged: (bool? value) {
          setState(() {
            completed = !completed;
            print("this is $value");
          });
          if (completed) {
            todosStore.addToNewList(index);
            print(todosStore.addedTodoList.length);
          }else{
            todosStore.removeFromTodoList(index);
          }
        },
      ),
    );
  }

  Widget floatingActionButton() {
    return FloatingActionButton(
        child: const Icon(Icons.list),
        onPressed: () => Navigator.push(
            context, MaterialPageRoute(builder: (builder) => AddedToDoList())));
  }
}
