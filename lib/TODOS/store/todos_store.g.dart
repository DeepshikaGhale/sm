// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todos_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$TodosStore on _TodosStore, Store {
  final _$isLoadingAtom = Atom(name: '_TodosStore.isLoading');

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  final _$hasErrorAtom = Atom(name: '_TodosStore.hasError');

  @override
  bool get hasError {
    _$hasErrorAtom.reportRead();
    return super.hasError;
  }

  @override
  set hasError(bool value) {
    _$hasErrorAtom.reportWrite(value, super.hasError, () {
      super.hasError = value;
    });
  }

  final _$userResponseAtom = Atom(name: '_TodosStore.userResponse');

  @override
  UserResponse get userResponse {
    _$userResponseAtom.reportRead();
    return super.userResponse;
  }

  @override
  set userResponse(UserResponse value) {
    _$userResponseAtom.reportWrite(value, super.userResponse, () {
      super.userResponse = value;
    });
  }

  final _$addedTodoListAtom = Atom(name: '_TodosStore.addedTodoList');

  @override
  ObserverList<Todos> get addedTodoList {
    _$addedTodoListAtom.reportRead();
    return super.addedTodoList;
  }

  @override
  set addedTodoList(ObserverList<Todos> value) {
    _$addedTodoListAtom.reportWrite(value, super.addedTodoList, () {
      super.addedTodoList = value;
    });
  }

  final _$getDataAsyncAction = AsyncAction('_TodosStore.getData');

  @override
  Future<UserResponse> getData() {
    return _$getDataAsyncAction.run(() => super.getData());
  }

  final _$_TodosStoreActionController = ActionController(name: '_TodosStore');

  @override
  void addToNewList(Todos todos) {
    final _$actionInfo = _$_TodosStoreActionController.startAction(
        name: '_TodosStore.addToNewList');
    try {
      return super.addToNewList(todos);
    } finally {
      _$_TodosStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeFromTodoList(int id) {
    final _$actionInfo = _$_TodosStoreActionController.startAction(
        name: '_TodosStore.removeFromTodoList');
    try {
      return super.removeFromTodoList(id);
    } finally {
      _$_TodosStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
hasError: ${hasError},
userResponse: ${userResponse},
addedTodoList: ${addedTodoList}
    ''';
  }
}
