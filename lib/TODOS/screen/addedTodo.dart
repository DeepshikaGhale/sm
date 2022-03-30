import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todos/TODOS/screen/widget/todo_widget.dart';
import 'package:todos/TODOS/store/todos_store.dart';
import 'todos.dart';

import '../entity/model.dart';

class AddedToDoList extends StatefulWidget {
  const AddedToDoList({ Key? key }) : super(key: key);

  @override
  State<AddedToDoList> createState() => _AddedToDoListState();
}

class _AddedToDoListState extends State<AddedToDoList> {

  TodosStore todosStore = TodosStore();

  @override
  void didChangeDependencies() {
    todosStore = Provider.of<TodosStore>(context, listen: false);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Added ToDo List')),
      body: createBody(todosStore.addedTodoList)
    );
  }

  Widget createBody(List<Todos> addedTodos) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: addedTodos.length,
        itemBuilder: (context, index) {
          return TodoListTile(
              todo: addedTodos[index]); // need to see
        });
  }

  
 
}