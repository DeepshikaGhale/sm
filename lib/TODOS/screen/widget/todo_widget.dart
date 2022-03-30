import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

import '../../entity/model.dart';
import '../../store/todos_store.dart';

class TodoListTile extends StatefulWidget {
  const TodoListTile({ Key? key, required this.todo }) : super(key: key);

  final Todos todo;

  @override
  State<TodoListTile> createState() => _TodoListTileState();
}

class _TodoListTileState extends State<TodoListTile> {
  TodosStore todosStore = TodosStore();

  @override
  void didChangeDependencies() {
    todosStore = Provider.of<TodosStore>(context, listen: false);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Text(widget.todo.id.toString()),
      title: Text(widget.todo.title),
      trailing: Observer(
        builder: (context) {
          return Checkbox(
            value: todosStore.addedTodoList.any((element) => element.id == widget.todo.id),
            onChanged: (bool? value) {
              if(value == true){
                todosStore.addToNewList(widget.todo);
                setState(() {
                });
              }else{
                todosStore.removeFromTodoList(widget.todo);
                setState(() {
                });
              }
            }
          );
        }
      ),
    );
  }
}