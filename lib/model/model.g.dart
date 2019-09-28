// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model.dart';

// **************************************************************************
// SqfEntityGenerator
// **************************************************************************

//  These classes was generated by SqfEntity
//  Copyright (c) 2019, All rights reserved. Use of this source code is governed by a
//  Apache license that can be found in the LICENSE file.

//  To use these SqfEntity classes do following:
//  - import model.dart into where to use
//  - start typing ex:Expense.select()... (add a few filters with fluent methods)...(add orderBy/orderBydesc if you want)...
//  - and then just put end of filters / or end of only select()  toSingle() / or toList()
//  - you can select one or return List<yourObject> by your filters and orders
//  - also you can batch update or batch delete by using delete/update methods instead of tosingle/tolist methods
//    Enjoy.. Huseyin Tokpunar

// BEGIN TABLES
// Expense TABLE
class TableExpense extends SqfEntityTableBase {
  TableExpense() {
    // declare properties of EntityTable
    tableName = 'expense';
    primaryKeyName = 'id';
    primaryKeyType = PrimaryKeyType.integer_auto_incremental;
    useSoftDeleting = true;
    // when useSoftDeleting is true, creates a field named 'isDeleted' on the table, and set to '1' this field when item deleted (does not hard delete)

    // declare fields
    fields = [
      SqfEntityFieldBase('amount', DbType.real),
      SqfEntityFieldBase('description', DbType.text),
      SqfEntityFieldBase('total', DbType.real),
    ];
    super.init();
  }
  static SqfEntityTableBase _instance;
  static SqfEntityTableBase get getInstance {
    return _instance = _instance ?? TableExpense();
  }
}
// END TABLES

// BEGIN SEQUENCES
// identity SEQUENCE
class SequenceIdentitySequence extends SqfEntitySequenceBase {
  SequenceIdentitySequence() {
    sequenceName = 'identity';
    maxValue =
        9223372036854775807; /* optional. default is max int (9.223.372.036.854.775.807) */
    cycle = false; /* optional. default is false; */
    minValue = 0; /* optional. default is 0 */
    incrementBy = 1; /* optional. default is 1 */
    startWith = 0; /* optional. default is 0 */
    super.init();
  }
  static SequenceIdentitySequence _instance;
  static SequenceIdentitySequence get getInstance {
    return _instance = _instance ?? SequenceIdentitySequence();
  }
}
// END SEQUENCES

// BEGIN DATABASE MODEL
class ExpenseModal extends SqfEntityModelProvider {
  ExpenseModal() {
    databaseName = 'expenseORM.db';
    databaseTables = [
      TableExpense.getInstance,
    ];

    sequences = [
      SequenceIdentitySequence.getInstance,
    ];

    bundledDatabasePath =
        null; //'assets/sample.db'; // This value is optional. When bundledDatabasePath is empty then EntityBase creats a new database when initializing the database
  }
}
// END DATABASE MODEL

// BEGIN ENTITIES
// region Expense
class Expense {
  Expense(
      {this.id, this.amount, this.description, this.total, this.isDeleted}) {
    setDefaultValues();
  }
  Expense.withFields(
      this.amount, this.description, this.total, this.isDeleted) {
    setDefaultValues();
  }
  Expense.withId(
      this.id, this.amount, this.description, this.total, this.isDeleted) {
    setDefaultValues();
  }
  Expense.fromMap(Map<String, dynamic> o) {
    id = o['id'] as int;
    amount = o['amount'] as double;

    description = o['description'] as String;

    total = o['total'] as double;

    isDeleted = o['isDeleted'] != null ? o['isDeleted'] == 1 : null;
  }
  // FIELDS
  int id;
  double amount;
  String description;
  double total;
  bool isDeleted;
  // end FIELDS

  static const bool _softDeleteActivated = true;
  ExpenseManager __mnExpense;

  ExpenseManager get _mnExpense {
    return __mnExpense = __mnExpense ?? ExpenseManager();
  }

  // methods
  Map<String, dynamic> toMap({bool forQuery = false}) {
    final map = Map<String, dynamic>();
    if (id != null) {
      map['id'] = id;
    }
    if (amount != null) {
      map['amount'] = amount;
    }

    if (description != null) {
      map['description'] = description;
    }

    if (total != null) {
      map['total'] = total;
    }

    if (isDeleted != null) {
      map['isDeleted'] = forQuery ? (isDeleted ? 1 : 0) : isDeleted;
    }

    return map;
  }

  // methods
  Future<Map<String, dynamic>> toMapWithChilds([bool forQuery = false]) async {
    final map = Map<String, dynamic>();
    if (id != null) {
      map['id'] = id;
    }
    if (amount != null) {
      map['amount'] = amount;
    }

    if (description != null) {
      map['description'] = description;
    }

    if (total != null) {
      map['total'] = total;
    }

    if (isDeleted != null) {
      map['isDeleted'] = forQuery ? (isDeleted ? 1 : 0) : isDeleted;
    }

    return map;
  }

  /// This method always returns Json String
  String toJson() {
    return json.encode(toMap());
  }

  /// This method always returns Json String
  Future<String> toJsonWithChilds() async {
    return json.encode(await toMapWithChilds());
  }

  List<dynamic> toArgs() {
    return [id, amount, description, total, isDeleted];
  }

  static Future<List<Expense>> fromWebUrl(String url) async {
    try {
      final response = await http.get(url);
      return await fromJson(response.body);
    } catch (e) {
      print(
          'SQFENTITY ERROR Expense.fromWebUrl: ErrorMessage: ${e.toString()}');
      return null;
    }
  }

  static Future<List<Expense>> fromJson(String jsonBody) async {
    final Iterable list = await json.decode(jsonBody) as Iterable;
    var objList = List<Expense>();
    try {
      objList = list
          .map((expense) => Expense.fromMap(expense as Map<String, dynamic>))
          .toList();
    } catch (e) {
      print('SQFENTITY ERROR Expense.fromJson: ErrorMessage: ${e.toString()}');
    }
    return objList;
  }

  static Future<List<Expense>> fromObjectList(Future<List<dynamic>> o) async {
    final expensesList = List<Expense>();
    final data = await o;
    for (int i = 0; i < data.length; i++) {
      expensesList.add(Expense.fromMap(data[i] as Map<String, dynamic>));
    }
    return expensesList;
  }

  static List<Expense> fromMapList(List<Map<String, dynamic>> query) {
    final List<Expense> expenses = List<Expense>();
    for (Map map in query) {
      expenses.add(Expense.fromMap(map as Map<String, dynamic>));
    }
    return expenses;
  }

  /// returns Expense by ID if exist, otherwise returns null
  /// <param name='id'>Primary Key Value</param>
  /// <returns>returns Expense if exist, otherwise returns null
  Future<Expense> getById(int id) async {
    Expense expenseObj;
    final data = await _mnExpense.getById(id);
    if (data.length != 0) {
      expenseObj = Expense.fromMap(data[0] as Map<String, dynamic>);
    } else {
      expenseObj = null;
    }
    return expenseObj;
  }

  /// Saves the object. If the id field is null, saves as a new record and returns new id, if id is not null then updates record

  /// <returns>Returns id
  Future<int> save() async {
    if (id == null || id == 0) {
      id = await _mnExpense.insert(this);
    } else {
      id = await _upsert();
    }
    return id;
  }

  /// saveAs Expense. Returns a new Primary Key value of Expense

  /// <returns>Returns a new Primary Key value of Expense
  Future<int> saveAs() async {
    id = null;
    return save();
  }

  /// saveAll method saves the sent List<Expense> as a batch in one transaction
  /// Returns a <List<BoolResult>>
  Future<List<BoolResult>> saveAll(List<Expense> expenses) async {
    final results = _mnExpense.saveAll(
        'INSERT OR REPLACE INTO expense (id,  amount, description, total,isDeleted)  VALUES (?,?,?,?,?)',
        expenses);
    return results;
  }

  /// Updates if the record exists, otherwise adds a new row

  /// <returns>Returns id
  Future<int> _upsert() async {
    return id = await _mnExpense.rawInsert(
        'INSERT OR REPLACE INTO expense (id,  amount, description, total,isDeleted)  VALUES (?,?,?,?,?)',
        [id, amount, description, total, isDeleted]);
  }

  /// inserts or replaces the sent List<Todo> as a batch in one transaction.
  /// upsertAll() method is faster then saveAll() method. upsertAll() should be used when you are sure that the primary key is greater than zero
  /// Returns a <List<BoolResult>>
  Future<List<BoolResult>> upsertAll(List<Expense> expenses) async {
    final results = await _mnExpense.rawInsertAll(
        'INSERT OR REPLACE INTO expense (id,  amount, description, total,isDeleted)  VALUES (?,?,?,?,?)',
        expenses);
    return results;
  }

  /// Deletes Expense

  /// <returns>BoolResult res.success=Deleted, not res.success=Can not deleted
  Future<BoolResult> delete([bool hardDelete = false]) async {
    print('SQFENTITIY: delete Expense invoked (id=$id)');
    if (!_softDeleteActivated || hardDelete || isDeleted) {
      return _mnExpense
          .delete(QueryParams(whereString: 'id=?', whereArguments: [id]));
    } else {
      return _mnExpense.updateBatch(
          QueryParams(whereString: 'id=?', whereArguments: [id]),
          {'isDeleted': 1});
    }
  }

  /// Recover Expense>

  /// <returns>BoolResult res.success=Recovered, not res.success=Can not recovered
  Future<BoolResult> recover([bool recoverChilds = true]) async {
    print('SQFENTITIY: recover Expense invoked (id=$id)');
    {
      return _mnExpense.updateBatch(
          QueryParams(whereString: 'id=?', whereArguments: [id]),
          {'isDeleted': 0});
    }
  }

  //private ExpenseFilterBuilder _Select;
  ExpenseFilterBuilder select(
      {List<String> columnsToSelect, bool getIsDeleted}) {
    return ExpenseFilterBuilder(this)
      .._getIsDeleted = getIsDeleted == true
      ..qparams.selectColumns = columnsToSelect;
  }

  ExpenseFilterBuilder distinct(
      {List<String> columnsToSelect, bool getIsDeleted}) {
    return ExpenseFilterBuilder(this)
      .._getIsDeleted = getIsDeleted == true
      ..qparams.selectColumns = columnsToSelect
      ..qparams.distinct = true;
  }

  void setDefaultValues() {
    isDeleted = isDeleted ?? false;
  }
  //end methods
}
// endregion expense

// region ExpenseField
class ExpenseField extends SearchCriteria {
  ExpenseField(this.expenseFB) {
    param = DbParameter();
  }
  DbParameter param;
  String _waitingNot = '';
  ExpenseFilterBuilder expenseFB;

  ExpenseField get not {
    _waitingNot = ' NOT ';
    return this;
  }

  ExpenseFilterBuilder equals(var pValue) {
    param.expression = '=';
    expenseFB._addedBlocks = _waitingNot == ''
        ? setCriteria(pValue, expenseFB.parameters, param, SqlSyntax.EQuals,
            expenseFB._addedBlocks)
        : setCriteria(pValue, expenseFB.parameters, param, SqlSyntax.NotEQuals,
            expenseFB._addedBlocks);
    _waitingNot = '';
    expenseFB._addedBlocks.needEndBlock[expenseFB._blockIndex] =
        expenseFB._addedBlocks.retVal;
    return expenseFB;
  }

  ExpenseFilterBuilder isNull() {
    expenseFB._addedBlocks = setCriteria(
        0,
        expenseFB.parameters,
        param,
        SqlSyntax.IsNULL.replaceAll(SqlSyntax.notKeyword, _waitingNot),
        expenseFB._addedBlocks);
    _waitingNot = '';
    expenseFB._addedBlocks.needEndBlock[expenseFB._blockIndex] =
        expenseFB._addedBlocks.retVal;
    return expenseFB;
  }

  ExpenseFilterBuilder contains(dynamic pValue) {
    if (pValue != null) {
      expenseFB._addedBlocks = setCriteria(
          '%${pValue.toString()}%',
          expenseFB.parameters,
          param,
          SqlSyntax.Contains.replaceAll(SqlSyntax.notKeyword, _waitingNot),
          expenseFB._addedBlocks);
      _waitingNot = '';
      expenseFB._addedBlocks.needEndBlock[expenseFB._blockIndex] =
          expenseFB._addedBlocks.retVal;
    }
    return expenseFB;
  }

  ExpenseFilterBuilder startsWith(dynamic pValue) {
    if (pValue != null) {
      expenseFB._addedBlocks = setCriteria(
          '${pValue.toString()}%',
          expenseFB.parameters,
          param,
          SqlSyntax.Contains.replaceAll(SqlSyntax.notKeyword, _waitingNot),
          expenseFB._addedBlocks);
      _waitingNot = '';
      expenseFB._addedBlocks.needEndBlock[expenseFB._blockIndex] =
          expenseFB._addedBlocks.retVal;
      expenseFB._addedBlocks.needEndBlock[expenseFB._blockIndex] =
          expenseFB._addedBlocks.retVal;
    }
    return expenseFB;
  }

  ExpenseFilterBuilder endsWith(dynamic pValue) {
    if (pValue != null) {
      expenseFB._addedBlocks = setCriteria(
          '%${pValue.toString()}',
          expenseFB.parameters,
          param,
          SqlSyntax.Contains.replaceAll(SqlSyntax.notKeyword, _waitingNot),
          expenseFB._addedBlocks);
      _waitingNot = '';
      expenseFB._addedBlocks.needEndBlock[expenseFB._blockIndex] =
          expenseFB._addedBlocks.retVal;
    }
    return expenseFB;
  }

  ExpenseFilterBuilder between(dynamic pFirst, dynamic pLast) {
    if (pFirst != null && pLast != null) {
      expenseFB._addedBlocks = setCriteria(
          pFirst,
          expenseFB.parameters,
          param,
          SqlSyntax.Between.replaceAll(SqlSyntax.notKeyword, _waitingNot),
          expenseFB._addedBlocks,
          pLast);
    } else if (pFirst != null) {
      if (_waitingNot != '') {
        expenseFB._addedBlocks = setCriteria(pFirst, expenseFB.parameters,
            param, SqlSyntax.LessThan, expenseFB._addedBlocks);
      } else {
        expenseFB._addedBlocks = setCriteria(pFirst, expenseFB.parameters,
            param, SqlSyntax.GreaterThanOrEquals, expenseFB._addedBlocks);
      }
    } else if (pLast != null) {
      if (_waitingNot != '') {
        expenseFB._addedBlocks = setCriteria(pLast, expenseFB.parameters, param,
            SqlSyntax.GreaterThan, expenseFB._addedBlocks);
      } else {
        expenseFB._addedBlocks = setCriteria(pLast, expenseFB.parameters, param,
            SqlSyntax.LessThanOrEquals, expenseFB._addedBlocks);
      }
    }
    _waitingNot = '';
    expenseFB._addedBlocks.needEndBlock[expenseFB._blockIndex] =
        expenseFB._addedBlocks.retVal;
    return expenseFB;
  }

  ExpenseFilterBuilder greaterThan(dynamic pValue) {
    param.expression = '>';
    expenseFB._addedBlocks = _waitingNot == ''
        ? setCriteria(pValue, expenseFB.parameters, param,
            SqlSyntax.GreaterThan, expenseFB._addedBlocks)
        : setCriteria(pValue, expenseFB.parameters, param,
            SqlSyntax.LessThanOrEquals, expenseFB._addedBlocks);
    _waitingNot = '';
    expenseFB._addedBlocks.needEndBlock[expenseFB._blockIndex] =
        expenseFB._addedBlocks.retVal;
    return expenseFB;
  }

  ExpenseFilterBuilder lessThan(dynamic pValue) {
    param.expression = '<';
    expenseFB._addedBlocks = _waitingNot == ''
        ? setCriteria(pValue, expenseFB.parameters, param, SqlSyntax.LessThan,
            expenseFB._addedBlocks)
        : setCriteria(pValue, expenseFB.parameters, param,
            SqlSyntax.GreaterThanOrEquals, expenseFB._addedBlocks);
    _waitingNot = '';
    expenseFB._addedBlocks.needEndBlock[expenseFB._blockIndex] =
        expenseFB._addedBlocks.retVal;
    return expenseFB;
  }

  ExpenseFilterBuilder greaterThanOrEquals(dynamic pValue) {
    param.expression = '>=';
    expenseFB._addedBlocks = _waitingNot == ''
        ? setCriteria(pValue, expenseFB.parameters, param,
            SqlSyntax.GreaterThanOrEquals, expenseFB._addedBlocks)
        : setCriteria(pValue, expenseFB.parameters, param, SqlSyntax.LessThan,
            expenseFB._addedBlocks);
    _waitingNot = '';
    expenseFB._addedBlocks.needEndBlock[expenseFB._blockIndex] =
        expenseFB._addedBlocks.retVal;
    return expenseFB;
  }

  ExpenseFilterBuilder lessThanOrEquals(dynamic pValue) {
    param.expression = '<=';
    expenseFB._addedBlocks = _waitingNot == ''
        ? setCriteria(pValue, expenseFB.parameters, param,
            SqlSyntax.LessThanOrEquals, expenseFB._addedBlocks)
        : setCriteria(pValue, expenseFB.parameters, param,
            SqlSyntax.GreaterThan, expenseFB._addedBlocks);
    _waitingNot = '';
    expenseFB._addedBlocks.needEndBlock[expenseFB._blockIndex] =
        expenseFB._addedBlocks.retVal;
    return expenseFB;
  }

  ExpenseFilterBuilder inValues(var pValue) {
    expenseFB._addedBlocks = setCriteria(
        pValue,
        expenseFB.parameters,
        param,
        SqlSyntax.IN.replaceAll(SqlSyntax.notKeyword, _waitingNot),
        expenseFB._addedBlocks);
    _waitingNot = '';
    expenseFB._addedBlocks.needEndBlock[expenseFB._blockIndex] =
        expenseFB._addedBlocks.retVal;
    return expenseFB;
  }
}
// endregion ExpenseField

// region ExpenseFilterBuilder
class ExpenseFilterBuilder extends SearchCriteria {
  ExpenseFilterBuilder(Expense obj) {
    whereString = '';
    qparams = QueryParams();
    parameters = List<DbParameter>();
    orderByList = List<String>();
    groupByList = List<String>();
    _addedBlocks = AddedBlocks(List<bool>(), List<bool>());
    _addedBlocks.needEndBlock.add(false);
    _addedBlocks.waitingStartBlock.add(false);
    _pagesize = 0;
    _page = 0;
    _obj = obj;
  }
  AddedBlocks _addedBlocks;
  int _blockIndex = 0;
  List<DbParameter> parameters;
  List<String> orderByList;
  Expense _obj;
  QueryParams qparams;
  int _pagesize;
  int _page;

  ExpenseFilterBuilder get and {
    if (parameters.isNotEmpty) {
      parameters[parameters.length - 1].wOperator = ' AND ';
    }
    return this;
  }

  ExpenseFilterBuilder get or {
    if (parameters.isNotEmpty) {
      parameters[parameters.length - 1].wOperator = ' OR ';
    }
    return this;
  }

  ExpenseFilterBuilder get startBlock {
    _addedBlocks.waitingStartBlock.add(true);
    _addedBlocks.needEndBlock.add(false);
    _blockIndex++;
    if (_blockIndex > 1) _addedBlocks.needEndBlock[_blockIndex - 1] = true;
    return this;
  }

  ExpenseFilterBuilder where(String whereCriteria) {
    if (whereCriteria != null && whereCriteria != '') {
      final DbParameter param = DbParameter();
      _addedBlocks =
          setCriteria(0, parameters, param, '($whereCriteria)', _addedBlocks);
      _addedBlocks.needEndBlock[_blockIndex] = _addedBlocks.retVal;
    }
    return this;
  }

  ExpenseFilterBuilder page(int page, int pagesize) {
    if (page > 0) _page = page;
    if (pagesize > 0) _pagesize = pagesize;
    return this;
  }

  ExpenseFilterBuilder top(int count) {
    if (count > 0) {
      _pagesize = count;
    }
    return this;
  }

  ExpenseFilterBuilder get endBlock {
    if (_addedBlocks.needEndBlock[_blockIndex]) {
      parameters[parameters.length - 1].whereString += ' ) ';
    }
    _addedBlocks.needEndBlock.removeAt(_blockIndex);
    _addedBlocks.waitingStartBlock.removeAt(_blockIndex);
    _blockIndex--;
    return this;
  }

  ExpenseFilterBuilder orderBy(var argFields) {
    if (argFields != null) {
      if (argFields is String) {
        orderByList.add(argFields);
      } else {
        for (String s in argFields) {
          if (s != null && s != '') orderByList.add(' $s ');
        }
      }
    }
    return this;
  }

  ExpenseFilterBuilder orderByDesc(var argFields) {
    if (argFields != null) {
      if (argFields is String) {
        orderByList.add('$argFields desc ');
      } else {
        for (String s in argFields) {
          if (s != null && s != '') orderByList.add(' $s desc ');
        }
      }
    }
    return this;
  }

  ExpenseFilterBuilder groupBy(var argFields) {
    if (argFields != null) {
      if (argFields is String) {
        groupByList.add(' $argFields ');
      } else {
        for (String s in argFields) {
          if (s != null && s != '') groupByList.add(' $s ');
        }
      }
    }
    return this;
  }

  ExpenseField setField(ExpenseField field, String colName, DbType dbtype) {
    return ExpenseField(this)
      ..param = DbParameter(
          dbType: dbtype,
          columnName: colName,
          wStartBlock: _addedBlocks.waitingStartBlock[_blockIndex]);
  }

  ExpenseField _id;
  ExpenseField get id {
    return _id = setField(_id, 'id', DbType.integer);
  }

  ExpenseField _amount;
  ExpenseField get amount {
    return _amount = setField(_amount, 'amount', DbType.real);
  }

  ExpenseField _description;
  ExpenseField get description {
    return _description = setField(_description, 'description', DbType.text);
  }

  ExpenseField _total;
  ExpenseField get total {
    return _total = setField(_total, 'total', DbType.real);
  }

  ExpenseField _isDeleted;
  ExpenseField get isDeleted {
    return _isDeleted = setField(_isDeleted, 'isDeleted', DbType.bool);
  }

  bool _getIsDeleted;

  void _buildParameters() {
    if (_page > 0 && _pagesize > 0) {
      qparams
        ..limit = _pagesize
        ..offset = (_page - 1) * _pagesize;
    } else {
      qparams
        ..limit = _pagesize
        ..offset = _page;
    }
    for (DbParameter param in parameters) {
      if (param.columnName != null) {
        if (param.value is List) {
          param.value = param.value
              .toString()
              .replaceAll('[', '')
              .replaceAll(']', '')
              .toString();
          whereString += param.whereString
              .replaceAll('{field}', param.columnName)
              .replaceAll('?', param.value.toString());
          param.value = null;
        } else {
          whereString +=
              param.whereString.replaceAll('{field}', param.columnName);
        }
        switch (param.dbType) {
          case DbType.bool:
            if (param.value != null) param.value = param.value == true ? 1 : 0;
            break;
          default:
        }

        if (param.value != null) whereArguments.add(param.value);
        if (param.value2 != null) whereArguments.add(param.value2);
      } else {
        whereString += param.whereString;
      }
    }
    if (Expense._softDeleteActivated) {
      if (whereString != '') {
        whereString =
            '${!_getIsDeleted ? 'ifnull(isDeleted,0)=0 AND' : ''} ($whereString)';
      } else if (!_getIsDeleted) {
        whereString = 'ifnull(isDeleted,0)=0';
      }
    }

    if (whereString != '') {
      qparams.whereString = whereString;
    }
    qparams
      ..whereArguments = whereArguments
      ..groupBy = groupByList.join(',')
      ..orderBy = orderByList.join(',');
  }

  /// <summary>
  /// Deletes List<Expense> batch by query

  /// <returns>BoolResult res.success=Deleted, not res.success=Can not deleted
  Future<BoolResult> delete([bool hardDelete = false]) async {
    _buildParameters();
    var r = BoolResult();
    if (Expense._softDeleteActivated && !hardDelete) {
      r = await _obj._mnExpense.updateBatch(qparams, {'isDeleted': 1});
    } else {
      r = await _obj._mnExpense.delete(qparams);
    }
    return r;
  }

  Future<BoolResult> recover() async {
    _getIsDeleted = true;
    _buildParameters();
    print('SQFENTITIY: recover Expense batch invoked');
    return _obj._mnExpense.updateBatch(qparams, {'isDeleted': 0});
  }

  Future<BoolResult> update(Map<String, dynamic> values) {
    _buildParameters();
    return _obj._mnExpense.updateBatch(qparams, values);
  }

  /// This method always returns ExpenseObj if exist, otherwise returns null
  /// <returns>List<Expense>
  Future<Expense> toSingle([VoidCallback expense(Expense o)]) async {
    _pagesize = 1;
    _buildParameters();
    final objFuture = _obj._mnExpense.toList(qparams);
    final data = await objFuture;
    Expense retVal;
    if (data.isNotEmpty) {
      retVal = Expense.fromMap(data[0] as Map<String, dynamic>);
    } else {
      retVal = null;
    }
    if (expense != null) {
      expense(retVal);
    }
    return retVal;
  }

  /// This method always returns int.
  /// <returns>int
  Future<int> toCount([VoidCallback expenseCount(int c)]) async {
    _buildParameters();
    qparams.selectColumns = ['COUNT(1) AS CNT'];
    final expensesFuture = await _obj._mnExpense.toList(qparams);
    final int count = expensesFuture[0]['CNT'] as int;
    if (expenseCount != null) {
      expenseCount(count);
    }
    return count;
  }

  /// This method always returns List<Expense>.
  /// <returns>List<Expense>
  Future<List<Expense>> toList(
      [VoidCallback expenseList(List<Expense> o)]) async {
    final List<Expense> expensesData = List<Expense>();
    final data = await toMapList();
    final int count = data.length;
    for (int i = 0; i < count; i++) {
      expensesData.add(Expense.fromMap(data[i] as Map<String, dynamic>));
    }
    if (expenseList != null) expenseList(expensesData);
    return expensesData;
  }

  /// This method always returns Json String
  Future<String> toJson() async {
    final list = List<dynamic>();
    final data = await toList();
    for (var o in data) {
      list.add(o.toMap());
    }
    return json.encode(list);
  }

  /// This method always returns Json String.
  Future<String> toJsonWithChilds() async {
    final list = List<dynamic>();
    final data = await toList();
    for (var o in data) {
      list.add(await o.toMapWithChilds());
    }
    return json.encode(list);
  }

  /// This method always returns List<dynamic>.
  /// <returns>List<dynamic>
  Future<List<dynamic>> toMapList() async {
    _buildParameters();
    return await _obj._mnExpense.toList(qparams);
  }

  /// Returns List<DropdownMenuItem<Expense>>
  Future<List<DropdownMenuItem<Expense>>> toDropDownMenu(
      String displayTextColumn,
      [VoidCallback dropDownMenu(List<DropdownMenuItem<Expense>> o)]) async {
    _buildParameters();
    final expensesFuture = _obj._mnExpense.toList(qparams);

    final data = await expensesFuture;
    final int count = data.length;
    final List<DropdownMenuItem<Expense>> items = List()
      ..add(DropdownMenuItem(
        value: Expense(),
        child: Text('Select Expense'),
      ));
    for (int i = 0; i < count; i++) {
      items.add(
        DropdownMenuItem(
          value: Expense.fromMap(data[i] as Map<String, dynamic>),
          child: Text(data[i][displayTextColumn].toString()),
        ),
      );
    }
    if (dropDownMenu != null) {
      dropDownMenu(items);
    }
    return items;
  }

  /// Returns List<DropdownMenuItem<int>>
  Future<List<DropdownMenuItem<int>>> toDropDownMenuInt(
      String displayTextColumn,
      [VoidCallback dropDownMenu(List<DropdownMenuItem<int>> o)]) async {
    _buildParameters();
    qparams.selectColumns = ['id', displayTextColumn];
    final expensesFuture = _obj._mnExpense.toList(qparams);

    final data = await expensesFuture;
    final int count = data.length;
    final List<DropdownMenuItem<int>> items = List()
      ..add(DropdownMenuItem(
        value: 0,
        child: Text('Select Expense'),
      ));
    for (int i = 0; i < count; i++) {
      items.add(
        DropdownMenuItem(
          value: data[i]['id'] as int,
          child: Text(data[i][displayTextColumn].toString()),
        ),
      );
    }
    if (dropDownMenu != null) {
      dropDownMenu(items);
    }
    return items;
  }

  /// This method always returns Primary Key List<int>.
  /// <returns>List<int>
  Future<List<int>> toListPrimaryKey([bool buildParameters = true]) async {
    if (buildParameters) _buildParameters();
    final List<int> idData = List<int>();
    qparams.selectColumns = ['id'];
    final idFuture = await _obj._mnExpense.toList(qparams);

    final int count = idFuture.length;
    for (int i = 0; i < count; i++) {
      idData.add(idFuture[i]['id'] as int);
    }
    return idData;
  }

  /// Returns List<dynamic> for selected columns. Use this method for 'groupBy' with min,max,avg..
  /// Sample usage: (see EXAMPLE 4.2 at https://github.com/hhtokpinar/sqfEntity#group-by)
  Future<List<dynamic>> toListObject(
      [VoidCallback listObject(List<dynamic> o)]) async {
    _buildParameters();

    final objectFuture = _obj._mnExpense.toList(qparams);

    final List<dynamic> objectsData = List<dynamic>();
    final data = await objectFuture;
    final int count = data.length;
    for (int i = 0; i < count; i++) {
      objectsData.add(data[i]);
    }
    if (listObject != null) {
      listObject(objectsData);
    }
    return objectsData;
  }

  /// Returns List<String> for selected first column
  /// Sample usage: await Expense.select(columnsToSelect: ['columnName']).toListString()
  Future<List<String>> toListString(
      [VoidCallback listString(List<String> o)]) async {
    _buildParameters();

    final objectFuture = _obj._mnExpense.toList(qparams);

    final List<String> objectsData = List<String>();
    final data = await objectFuture;
    final int count = data.length;
    for (int i = 0; i < count; i++) {
      objectsData.add(data[i][qparams.selectColumns[0]].toString());
    }
    if (listString != null) {
      listString(objectsData);
    }
    return objectsData;
  }
}
// endregion ExpenseFilterBuilder

// region ExpenseFields
class ExpenseFields {
  static TableField _fId;
  static TableField get id {
    return _fId = _fId ?? SqlSyntax.setField(_fId, 'id', DbType.integer);
  }

  static TableField _fAmount;
  static TableField get amount {
    return _fAmount =
        _fAmount ?? SqlSyntax.setField(_fAmount, 'amount', DbType.real);
  }

  static TableField _fDescription;
  static TableField get description {
    return _fDescription = _fDescription ??
        SqlSyntax.setField(_fDescription, 'description', DbType.text);
  }

  static TableField _fTotal;
  static TableField get total {
    return _fTotal =
        _fTotal ?? SqlSyntax.setField(_fTotal, 'total', DbType.real);
  }

  static TableField _fIsDeleted;
  static TableField get isDeleted {
    return _fIsDeleted = _fIsDeleted ??
        SqlSyntax.setField(_fIsDeleted, 'isDeleted', DbType.integer);
  }
}
// endregion ExpenseFields

//region ExpenseManager
class ExpenseManager extends SqfEntityProvider {
  ExpenseManager()
      : super(ExpenseModal(), tableName: _tableName, colId: _colId);
  static String _tableName = 'expense';
  static String _colId = 'id';
}

//endregion ExpenseManager
/// Region SEQUENCE IdentitySequence
class IdentitySequence {
  /// Assigns a new value when it is triggered and returns the new value
  /// returns Future<int>
  Future<int> nextVal([VoidCallback nextval(int o)]) async {
    final val = await SequenceManager()
        .sequence(SequenceIdentitySequence.getInstance, true);
    if (nextval != null) {
      nextval(val);
    }
    return val;
  }

  /// Get the current value
  /// returns Future<int>
  Future<int> currentVal([VoidCallback currentval(int o)]) async {
    final val = await SequenceManager()
        .sequence(SequenceIdentitySequence.getInstance, false);
    if (currentval != null) {
      currentval(val);
    }
    return val;
  }

  /// Reset sequence to start value
  /// returns start value
  Future<int> reset([VoidCallback currentval(int o)]) async {
    final val = await SequenceManager()
        .sequence(SequenceIdentitySequence.getInstance, false, reset: true);
    if (currentval != null) {
      currentval(val);
    }
    return val;
  }
}

/// End Region SEQUENCE IdentitySequence

class SequenceManager extends SqfEntityProvider {
  SequenceManager() : super(ExpenseModal());
}
// END OF ENTITIES