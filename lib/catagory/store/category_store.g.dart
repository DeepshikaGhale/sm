// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CategoryStore on _CategoryStore, Store {
  final _$isLoadingAtom = Atom(name: '_CategoryStore.isLoading');

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

  final _$hasErrorAtom = Atom(name: '_CategoryStore.hasError');

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

  final _$catagoryResponseAtom = Atom(name: '_CategoryStore.catagoryResponse');

  @override
  CategoryResponse get catagoryResponse {
    _$catagoryResponseAtom.reportRead();
    return super.catagoryResponse;
  }

  @override
  set catagoryResponse(CategoryResponse value) {
    _$catagoryResponseAtom.reportWrite(value, super.catagoryResponse, () {
      super.catagoryResponse = value;
    });
  }

  final _$getCatagoryDataAsyncAction =
      AsyncAction('_CategoryStore.getCatagoryData');

  @override
  Future<CategoryResponse> getCatagoryData() {
    return _$getCatagoryDataAsyncAction.run(() => super.getCatagoryData());
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
hasError: ${hasError},
catagoryResponse: ${catagoryResponse}
    ''';
  }
}
