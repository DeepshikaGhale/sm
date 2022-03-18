import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todos/TODOS/store/todos_store.dart';

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
      
    );
  }

  _todoList(){
    print(todosStore.addedTodoList.length);

    if(todosStore.addedTodoList.isNotEmpty){
      return ListView.builder(
        shrinkWrap: true,
        itemCount: todosStore.addedTodoList.length,
        itemBuilder: (context, index) {
          return todoItemWidget(
              id: todosStore.addedTodoList[index].id.toString() as 
        });
    }
     
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
}