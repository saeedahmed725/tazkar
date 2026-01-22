// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $PrayerCacheEntriesTable extends PrayerCacheEntries
    with TableInfo<$PrayerCacheEntriesTable, PrayerCacheEntry> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PrayerCacheEntriesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _yearMeta = const VerificationMeta('year');
  @override
  late final GeneratedColumn<int> year = GeneratedColumn<int>(
    'year',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _addressMeta = const VerificationMeta(
    'address',
  );
  @override
  late final GeneratedColumn<String> address = GeneratedColumn<String>(
    'address',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _methodMeta = const VerificationMeta('method');
  @override
  late final GeneratedColumn<int> method = GeneratedColumn<int>(
    'method',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _schoolMeta = const VerificationMeta('school');
  @override
  late final GeneratedColumn<int> school = GeneratedColumn<int>(
    'school',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _midnightModeMeta = const VerificationMeta(
    'midnightMode',
  );
  @override
  late final GeneratedColumn<int> midnightMode = GeneratedColumn<int>(
    'midnight_mode',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _latitudeAdjustmentMethodMeta =
      const VerificationMeta('latitudeAdjustmentMethod');
  @override
  late final GeneratedColumn<int> latitudeAdjustmentMethod =
      GeneratedColumn<int>(
        'latitude_adjustment_method',
        aliasedName,
        true,
        type: DriftSqlType.int,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _calendarMethodMeta = const VerificationMeta(
    'calendarMethod',
  );
  @override
  late final GeneratedColumn<String> calendarMethod = GeneratedColumn<String>(
    'calendar_method',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _shafaqMeta = const VerificationMeta('shafaq');
  @override
  late final GeneratedColumn<String> shafaq = GeneratedColumn<String>(
    'shafaq',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _tuneMeta = const VerificationMeta('tune');
  @override
  late final GeneratedColumn<String> tune = GeneratedColumn<String>(
    'tune',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _payloadMeta = const VerificationMeta(
    'payload',
  );
  @override
  late final GeneratedColumn<String> payload = GeneratedColumn<String>(
    'payload',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    year,
    address,
    method,
    school,
    midnightMode,
    latitudeAdjustmentMethod,
    calendarMethod,
    shafaq,
    tune,
    payload,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'prayer_cache_entries';
  @override
  VerificationContext validateIntegrity(
    Insertable<PrayerCacheEntry> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('year')) {
      context.handle(
        _yearMeta,
        year.isAcceptableOrUnknown(data['year']!, _yearMeta),
      );
    } else if (isInserting) {
      context.missing(_yearMeta);
    }
    if (data.containsKey('address')) {
      context.handle(
        _addressMeta,
        address.isAcceptableOrUnknown(data['address']!, _addressMeta),
      );
    } else if (isInserting) {
      context.missing(_addressMeta);
    }
    if (data.containsKey('method')) {
      context.handle(
        _methodMeta,
        method.isAcceptableOrUnknown(data['method']!, _methodMeta),
      );
    } else if (isInserting) {
      context.missing(_methodMeta);
    }
    if (data.containsKey('school')) {
      context.handle(
        _schoolMeta,
        school.isAcceptableOrUnknown(data['school']!, _schoolMeta),
      );
    } else if (isInserting) {
      context.missing(_schoolMeta);
    }
    if (data.containsKey('midnight_mode')) {
      context.handle(
        _midnightModeMeta,
        midnightMode.isAcceptableOrUnknown(
          data['midnight_mode']!,
          _midnightModeMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_midnightModeMeta);
    }
    if (data.containsKey('latitude_adjustment_method')) {
      context.handle(
        _latitudeAdjustmentMethodMeta,
        latitudeAdjustmentMethod.isAcceptableOrUnknown(
          data['latitude_adjustment_method']!,
          _latitudeAdjustmentMethodMeta,
        ),
      );
    }
    if (data.containsKey('calendar_method')) {
      context.handle(
        _calendarMethodMeta,
        calendarMethod.isAcceptableOrUnknown(
          data['calendar_method']!,
          _calendarMethodMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_calendarMethodMeta);
    }
    if (data.containsKey('shafaq')) {
      context.handle(
        _shafaqMeta,
        shafaq.isAcceptableOrUnknown(data['shafaq']!, _shafaqMeta),
      );
    } else if (isInserting) {
      context.missing(_shafaqMeta);
    }
    if (data.containsKey('tune')) {
      context.handle(
        _tuneMeta,
        tune.isAcceptableOrUnknown(data['tune']!, _tuneMeta),
      );
    }
    if (data.containsKey('payload')) {
      context.handle(
        _payloadMeta,
        payload.isAcceptableOrUnknown(data['payload']!, _payloadMeta),
      );
    } else if (isInserting) {
      context.missing(_payloadMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  List<Set<GeneratedColumn>> get uniqueKeys => [
    {
      year,
      address,
      method,
      school,
      midnightMode,
      latitudeAdjustmentMethod,
      calendarMethod,
      shafaq,
      tune,
    },
  ];
  @override
  PrayerCacheEntry map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PrayerCacheEntry(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      year: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}year'],
      )!,
      address: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}address'],
      )!,
      method: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}method'],
      )!,
      school: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}school'],
      )!,
      midnightMode: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}midnight_mode'],
      )!,
      latitudeAdjustmentMethod: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}latitude_adjustment_method'],
      ),
      calendarMethod: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}calendar_method'],
      )!,
      shafaq: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}shafaq'],
      )!,
      tune: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}tune'],
      ),
      payload: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}payload'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $PrayerCacheEntriesTable createAlias(String alias) {
    return $PrayerCacheEntriesTable(attachedDatabase, alias);
  }
}

class PrayerCacheEntry extends DataClass
    implements Insertable<PrayerCacheEntry> {
  final int id;
  final int year;
  final String address;
  final int method;
  final int school;
  final int midnightMode;
  final int? latitudeAdjustmentMethod;
  final String calendarMethod;
  final String shafaq;
  final String? tune;

  /// Raw JSON payload for the full calendar response.
  final String payload;
  final DateTime updatedAt;
  const PrayerCacheEntry({
    required this.id,
    required this.year,
    required this.address,
    required this.method,
    required this.school,
    required this.midnightMode,
    this.latitudeAdjustmentMethod,
    required this.calendarMethod,
    required this.shafaq,
    this.tune,
    required this.payload,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['year'] = Variable<int>(year);
    map['address'] = Variable<String>(address);
    map['method'] = Variable<int>(method);
    map['school'] = Variable<int>(school);
    map['midnight_mode'] = Variable<int>(midnightMode);
    if (!nullToAbsent || latitudeAdjustmentMethod != null) {
      map['latitude_adjustment_method'] = Variable<int>(
        latitudeAdjustmentMethod,
      );
    }
    map['calendar_method'] = Variable<String>(calendarMethod);
    map['shafaq'] = Variable<String>(shafaq);
    if (!nullToAbsent || tune != null) {
      map['tune'] = Variable<String>(tune);
    }
    map['payload'] = Variable<String>(payload);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  PrayerCacheEntriesCompanion toCompanion(bool nullToAbsent) {
    return PrayerCacheEntriesCompanion(
      id: Value(id),
      year: Value(year),
      address: Value(address),
      method: Value(method),
      school: Value(school),
      midnightMode: Value(midnightMode),
      latitudeAdjustmentMethod: latitudeAdjustmentMethod == null && nullToAbsent
          ? const Value.absent()
          : Value(latitudeAdjustmentMethod),
      calendarMethod: Value(calendarMethod),
      shafaq: Value(shafaq),
      tune: tune == null && nullToAbsent ? const Value.absent() : Value(tune),
      payload: Value(payload),
      updatedAt: Value(updatedAt),
    );
  }

  factory PrayerCacheEntry.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PrayerCacheEntry(
      id: serializer.fromJson<int>(json['id']),
      year: serializer.fromJson<int>(json['year']),
      address: serializer.fromJson<String>(json['address']),
      method: serializer.fromJson<int>(json['method']),
      school: serializer.fromJson<int>(json['school']),
      midnightMode: serializer.fromJson<int>(json['midnightMode']),
      latitudeAdjustmentMethod: serializer.fromJson<int?>(
        json['latitudeAdjustmentMethod'],
      ),
      calendarMethod: serializer.fromJson<String>(json['calendarMethod']),
      shafaq: serializer.fromJson<String>(json['shafaq']),
      tune: serializer.fromJson<String?>(json['tune']),
      payload: serializer.fromJson<String>(json['payload']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'year': serializer.toJson<int>(year),
      'address': serializer.toJson<String>(address),
      'method': serializer.toJson<int>(method),
      'school': serializer.toJson<int>(school),
      'midnightMode': serializer.toJson<int>(midnightMode),
      'latitudeAdjustmentMethod': serializer.toJson<int?>(
        latitudeAdjustmentMethod,
      ),
      'calendarMethod': serializer.toJson<String>(calendarMethod),
      'shafaq': serializer.toJson<String>(shafaq),
      'tune': serializer.toJson<String?>(tune),
      'payload': serializer.toJson<String>(payload),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  PrayerCacheEntry copyWith({
    int? id,
    int? year,
    String? address,
    int? method,
    int? school,
    int? midnightMode,
    Value<int?> latitudeAdjustmentMethod = const Value.absent(),
    String? calendarMethod,
    String? shafaq,
    Value<String?> tune = const Value.absent(),
    String? payload,
    DateTime? updatedAt,
  }) => PrayerCacheEntry(
    id: id ?? this.id,
    year: year ?? this.year,
    address: address ?? this.address,
    method: method ?? this.method,
    school: school ?? this.school,
    midnightMode: midnightMode ?? this.midnightMode,
    latitudeAdjustmentMethod: latitudeAdjustmentMethod.present
        ? latitudeAdjustmentMethod.value
        : this.latitudeAdjustmentMethod,
    calendarMethod: calendarMethod ?? this.calendarMethod,
    shafaq: shafaq ?? this.shafaq,
    tune: tune.present ? tune.value : this.tune,
    payload: payload ?? this.payload,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  PrayerCacheEntry copyWithCompanion(PrayerCacheEntriesCompanion data) {
    return PrayerCacheEntry(
      id: data.id.present ? data.id.value : this.id,
      year: data.year.present ? data.year.value : this.year,
      address: data.address.present ? data.address.value : this.address,
      method: data.method.present ? data.method.value : this.method,
      school: data.school.present ? data.school.value : this.school,
      midnightMode: data.midnightMode.present
          ? data.midnightMode.value
          : this.midnightMode,
      latitudeAdjustmentMethod: data.latitudeAdjustmentMethod.present
          ? data.latitudeAdjustmentMethod.value
          : this.latitudeAdjustmentMethod,
      calendarMethod: data.calendarMethod.present
          ? data.calendarMethod.value
          : this.calendarMethod,
      shafaq: data.shafaq.present ? data.shafaq.value : this.shafaq,
      tune: data.tune.present ? data.tune.value : this.tune,
      payload: data.payload.present ? data.payload.value : this.payload,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('PrayerCacheEntry(')
          ..write('id: $id, ')
          ..write('year: $year, ')
          ..write('address: $address, ')
          ..write('method: $method, ')
          ..write('school: $school, ')
          ..write('midnightMode: $midnightMode, ')
          ..write('latitudeAdjustmentMethod: $latitudeAdjustmentMethod, ')
          ..write('calendarMethod: $calendarMethod, ')
          ..write('shafaq: $shafaq, ')
          ..write('tune: $tune, ')
          ..write('payload: $payload, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    year,
    address,
    method,
    school,
    midnightMode,
    latitudeAdjustmentMethod,
    calendarMethod,
    shafaq,
    tune,
    payload,
    updatedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PrayerCacheEntry &&
          other.id == this.id &&
          other.year == this.year &&
          other.address == this.address &&
          other.method == this.method &&
          other.school == this.school &&
          other.midnightMode == this.midnightMode &&
          other.latitudeAdjustmentMethod == this.latitudeAdjustmentMethod &&
          other.calendarMethod == this.calendarMethod &&
          other.shafaq == this.shafaq &&
          other.tune == this.tune &&
          other.payload == this.payload &&
          other.updatedAt == this.updatedAt);
}

class PrayerCacheEntriesCompanion extends UpdateCompanion<PrayerCacheEntry> {
  final Value<int> id;
  final Value<int> year;
  final Value<String> address;
  final Value<int> method;
  final Value<int> school;
  final Value<int> midnightMode;
  final Value<int?> latitudeAdjustmentMethod;
  final Value<String> calendarMethod;
  final Value<String> shafaq;
  final Value<String?> tune;
  final Value<String> payload;
  final Value<DateTime> updatedAt;
  const PrayerCacheEntriesCompanion({
    this.id = const Value.absent(),
    this.year = const Value.absent(),
    this.address = const Value.absent(),
    this.method = const Value.absent(),
    this.school = const Value.absent(),
    this.midnightMode = const Value.absent(),
    this.latitudeAdjustmentMethod = const Value.absent(),
    this.calendarMethod = const Value.absent(),
    this.shafaq = const Value.absent(),
    this.tune = const Value.absent(),
    this.payload = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  PrayerCacheEntriesCompanion.insert({
    this.id = const Value.absent(),
    required int year,
    required String address,
    required int method,
    required int school,
    required int midnightMode,
    this.latitudeAdjustmentMethod = const Value.absent(),
    required String calendarMethod,
    required String shafaq,
    this.tune = const Value.absent(),
    required String payload,
    this.updatedAt = const Value.absent(),
  }) : year = Value(year),
       address = Value(address),
       method = Value(method),
       school = Value(school),
       midnightMode = Value(midnightMode),
       calendarMethod = Value(calendarMethod),
       shafaq = Value(shafaq),
       payload = Value(payload);
  static Insertable<PrayerCacheEntry> custom({
    Expression<int>? id,
    Expression<int>? year,
    Expression<String>? address,
    Expression<int>? method,
    Expression<int>? school,
    Expression<int>? midnightMode,
    Expression<int>? latitudeAdjustmentMethod,
    Expression<String>? calendarMethod,
    Expression<String>? shafaq,
    Expression<String>? tune,
    Expression<String>? payload,
    Expression<DateTime>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (year != null) 'year': year,
      if (address != null) 'address': address,
      if (method != null) 'method': method,
      if (school != null) 'school': school,
      if (midnightMode != null) 'midnight_mode': midnightMode,
      if (latitudeAdjustmentMethod != null)
        'latitude_adjustment_method': latitudeAdjustmentMethod,
      if (calendarMethod != null) 'calendar_method': calendarMethod,
      if (shafaq != null) 'shafaq': shafaq,
      if (tune != null) 'tune': tune,
      if (payload != null) 'payload': payload,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  PrayerCacheEntriesCompanion copyWith({
    Value<int>? id,
    Value<int>? year,
    Value<String>? address,
    Value<int>? method,
    Value<int>? school,
    Value<int>? midnightMode,
    Value<int?>? latitudeAdjustmentMethod,
    Value<String>? calendarMethod,
    Value<String>? shafaq,
    Value<String?>? tune,
    Value<String>? payload,
    Value<DateTime>? updatedAt,
  }) {
    return PrayerCacheEntriesCompanion(
      id: id ?? this.id,
      year: year ?? this.year,
      address: address ?? this.address,
      method: method ?? this.method,
      school: school ?? this.school,
      midnightMode: midnightMode ?? this.midnightMode,
      latitudeAdjustmentMethod:
          latitudeAdjustmentMethod ?? this.latitudeAdjustmentMethod,
      calendarMethod: calendarMethod ?? this.calendarMethod,
      shafaq: shafaq ?? this.shafaq,
      tune: tune ?? this.tune,
      payload: payload ?? this.payload,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (year.present) {
      map['year'] = Variable<int>(year.value);
    }
    if (address.present) {
      map['address'] = Variable<String>(address.value);
    }
    if (method.present) {
      map['method'] = Variable<int>(method.value);
    }
    if (school.present) {
      map['school'] = Variable<int>(school.value);
    }
    if (midnightMode.present) {
      map['midnight_mode'] = Variable<int>(midnightMode.value);
    }
    if (latitudeAdjustmentMethod.present) {
      map['latitude_adjustment_method'] = Variable<int>(
        latitudeAdjustmentMethod.value,
      );
    }
    if (calendarMethod.present) {
      map['calendar_method'] = Variable<String>(calendarMethod.value);
    }
    if (shafaq.present) {
      map['shafaq'] = Variable<String>(shafaq.value);
    }
    if (tune.present) {
      map['tune'] = Variable<String>(tune.value);
    }
    if (payload.present) {
      map['payload'] = Variable<String>(payload.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PrayerCacheEntriesCompanion(')
          ..write('id: $id, ')
          ..write('year: $year, ')
          ..write('address: $address, ')
          ..write('method: $method, ')
          ..write('school: $school, ')
          ..write('midnightMode: $midnightMode, ')
          ..write('latitudeAdjustmentMethod: $latitudeAdjustmentMethod, ')
          ..write('calendarMethod: $calendarMethod, ')
          ..write('shafaq: $shafaq, ')
          ..write('tune: $tune, ')
          ..write('payload: $payload, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $PrayerCacheEntriesTable prayerCacheEntries =
      $PrayerCacheEntriesTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [prayerCacheEntries];
}

typedef $$PrayerCacheEntriesTableCreateCompanionBuilder =
    PrayerCacheEntriesCompanion Function({
      Value<int> id,
      required int year,
      required String address,
      required int method,
      required int school,
      required int midnightMode,
      Value<int?> latitudeAdjustmentMethod,
      required String calendarMethod,
      required String shafaq,
      Value<String?> tune,
      required String payload,
      Value<DateTime> updatedAt,
    });
typedef $$PrayerCacheEntriesTableUpdateCompanionBuilder =
    PrayerCacheEntriesCompanion Function({
      Value<int> id,
      Value<int> year,
      Value<String> address,
      Value<int> method,
      Value<int> school,
      Value<int> midnightMode,
      Value<int?> latitudeAdjustmentMethod,
      Value<String> calendarMethod,
      Value<String> shafaq,
      Value<String?> tune,
      Value<String> payload,
      Value<DateTime> updatedAt,
    });

class $$PrayerCacheEntriesTableFilterComposer
    extends Composer<_$AppDatabase, $PrayerCacheEntriesTable> {
  $$PrayerCacheEntriesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get year => $composableBuilder(
    column: $table.year,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get address => $composableBuilder(
    column: $table.address,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get method => $composableBuilder(
    column: $table.method,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get school => $composableBuilder(
    column: $table.school,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get midnightMode => $composableBuilder(
    column: $table.midnightMode,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get latitudeAdjustmentMethod => $composableBuilder(
    column: $table.latitudeAdjustmentMethod,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get calendarMethod => $composableBuilder(
    column: $table.calendarMethod,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get shafaq => $composableBuilder(
    column: $table.shafaq,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get tune => $composableBuilder(
    column: $table.tune,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get payload => $composableBuilder(
    column: $table.payload,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$PrayerCacheEntriesTableOrderingComposer
    extends Composer<_$AppDatabase, $PrayerCacheEntriesTable> {
  $$PrayerCacheEntriesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get year => $composableBuilder(
    column: $table.year,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get address => $composableBuilder(
    column: $table.address,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get method => $composableBuilder(
    column: $table.method,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get school => $composableBuilder(
    column: $table.school,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get midnightMode => $composableBuilder(
    column: $table.midnightMode,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get latitudeAdjustmentMethod => $composableBuilder(
    column: $table.latitudeAdjustmentMethod,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get calendarMethod => $composableBuilder(
    column: $table.calendarMethod,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get shafaq => $composableBuilder(
    column: $table.shafaq,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get tune => $composableBuilder(
    column: $table.tune,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get payload => $composableBuilder(
    column: $table.payload,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$PrayerCacheEntriesTableAnnotationComposer
    extends Composer<_$AppDatabase, $PrayerCacheEntriesTable> {
  $$PrayerCacheEntriesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get year =>
      $composableBuilder(column: $table.year, builder: (column) => column);

  GeneratedColumn<String> get address =>
      $composableBuilder(column: $table.address, builder: (column) => column);

  GeneratedColumn<int> get method =>
      $composableBuilder(column: $table.method, builder: (column) => column);

  GeneratedColumn<int> get school =>
      $composableBuilder(column: $table.school, builder: (column) => column);

  GeneratedColumn<int> get midnightMode => $composableBuilder(
    column: $table.midnightMode,
    builder: (column) => column,
  );

  GeneratedColumn<int> get latitudeAdjustmentMethod => $composableBuilder(
    column: $table.latitudeAdjustmentMethod,
    builder: (column) => column,
  );

  GeneratedColumn<String> get calendarMethod => $composableBuilder(
    column: $table.calendarMethod,
    builder: (column) => column,
  );

  GeneratedColumn<String> get shafaq =>
      $composableBuilder(column: $table.shafaq, builder: (column) => column);

  GeneratedColumn<String> get tune =>
      $composableBuilder(column: $table.tune, builder: (column) => column);

  GeneratedColumn<String> get payload =>
      $composableBuilder(column: $table.payload, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $$PrayerCacheEntriesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $PrayerCacheEntriesTable,
          PrayerCacheEntry,
          $$PrayerCacheEntriesTableFilterComposer,
          $$PrayerCacheEntriesTableOrderingComposer,
          $$PrayerCacheEntriesTableAnnotationComposer,
          $$PrayerCacheEntriesTableCreateCompanionBuilder,
          $$PrayerCacheEntriesTableUpdateCompanionBuilder,
          (
            PrayerCacheEntry,
            BaseReferences<
              _$AppDatabase,
              $PrayerCacheEntriesTable,
              PrayerCacheEntry
            >,
          ),
          PrayerCacheEntry,
          PrefetchHooks Function()
        > {
  $$PrayerCacheEntriesTableTableManager(
    _$AppDatabase db,
    $PrayerCacheEntriesTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PrayerCacheEntriesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PrayerCacheEntriesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$PrayerCacheEntriesTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> year = const Value.absent(),
                Value<String> address = const Value.absent(),
                Value<int> method = const Value.absent(),
                Value<int> school = const Value.absent(),
                Value<int> midnightMode = const Value.absent(),
                Value<int?> latitudeAdjustmentMethod = const Value.absent(),
                Value<String> calendarMethod = const Value.absent(),
                Value<String> shafaq = const Value.absent(),
                Value<String?> tune = const Value.absent(),
                Value<String> payload = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
              }) => PrayerCacheEntriesCompanion(
                id: id,
                year: year,
                address: address,
                method: method,
                school: school,
                midnightMode: midnightMode,
                latitudeAdjustmentMethod: latitudeAdjustmentMethod,
                calendarMethod: calendarMethod,
                shafaq: shafaq,
                tune: tune,
                payload: payload,
                updatedAt: updatedAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int year,
                required String address,
                required int method,
                required int school,
                required int midnightMode,
                Value<int?> latitudeAdjustmentMethod = const Value.absent(),
                required String calendarMethod,
                required String shafaq,
                Value<String?> tune = const Value.absent(),
                required String payload,
                Value<DateTime> updatedAt = const Value.absent(),
              }) => PrayerCacheEntriesCompanion.insert(
                id: id,
                year: year,
                address: address,
                method: method,
                school: school,
                midnightMode: midnightMode,
                latitudeAdjustmentMethod: latitudeAdjustmentMethod,
                calendarMethod: calendarMethod,
                shafaq: shafaq,
                tune: tune,
                payload: payload,
                updatedAt: updatedAt,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$PrayerCacheEntriesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $PrayerCacheEntriesTable,
      PrayerCacheEntry,
      $$PrayerCacheEntriesTableFilterComposer,
      $$PrayerCacheEntriesTableOrderingComposer,
      $$PrayerCacheEntriesTableAnnotationComposer,
      $$PrayerCacheEntriesTableCreateCompanionBuilder,
      $$PrayerCacheEntriesTableUpdateCompanionBuilder,
      (
        PrayerCacheEntry,
        BaseReferences<
          _$AppDatabase,
          $PrayerCacheEntriesTable,
          PrayerCacheEntry
        >,
      ),
      PrayerCacheEntry,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$PrayerCacheEntriesTableTableManager get prayerCacheEntries =>
      $$PrayerCacheEntriesTableTableManager(_db, _db.prayerCacheEntries);
}
