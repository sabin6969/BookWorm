// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_db.dart';

// ignore_for_file: type=lint
class $BookTableTable extends BookTable
    with TableInfo<$BookTableTable, BookTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $BookTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _bookTitleMeta =
      const VerificationMeta('bookTitle');
  @override
  late final GeneratedColumn<String> bookTitle = GeneratedColumn<String>(
      'book_title', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _imageUrlMeta =
      const VerificationMeta('imageUrl');
  @override
  late final GeneratedColumn<String> imageUrl = GeneratedColumn<String>(
      'image_url', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
      'status', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _authorsMeta =
      const VerificationMeta('authors');
  @override
  late final GeneratedColumnWithTypeConverter<List<String>, String> authors =
      GeneratedColumn<String>('authors', aliasedName, false,
              type: DriftSqlType.string, requiredDuringInsert: true)
          .withConverter<List<String>>($BookTableTable.$converterauthors);
  static const VerificationMeta _pagesMeta = const VerificationMeta('pages');
  @override
  late final GeneratedColumn<int> pages = GeneratedColumn<int>(
      'pages', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _languageMeta =
      const VerificationMeta('language');
  @override
  late final GeneratedColumn<String> language = GeneratedColumn<String>(
      'language', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant("en"));
  @override
  List<GeneratedColumn> get $columns =>
      [id, bookTitle, imageUrl, status, authors, pages, language];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'book_table';
  @override
  VerificationContext validateIntegrity(Insertable<BookTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('book_title')) {
      context.handle(_bookTitleMeta,
          bookTitle.isAcceptableOrUnknown(data['book_title']!, _bookTitleMeta));
    } else if (isInserting) {
      context.missing(_bookTitleMeta);
    }
    if (data.containsKey('image_url')) {
      context.handle(_imageUrlMeta,
          imageUrl.isAcceptableOrUnknown(data['image_url']!, _imageUrlMeta));
    } else if (isInserting) {
      context.missing(_imageUrlMeta);
    }
    if (data.containsKey('status')) {
      context.handle(_statusMeta,
          status.isAcceptableOrUnknown(data['status']!, _statusMeta));
    } else if (isInserting) {
      context.missing(_statusMeta);
    }
    context.handle(_authorsMeta, const VerificationResult.success());
    if (data.containsKey('pages')) {
      context.handle(
          _pagesMeta, pages.isAcceptableOrUnknown(data['pages']!, _pagesMeta));
    }
    if (data.containsKey('language')) {
      context.handle(_languageMeta,
          language.isAcceptableOrUnknown(data['language']!, _languageMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  BookTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return BookTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      bookTitle: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}book_title'])!,
      imageUrl: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}image_url'])!,
      status: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}status'])!,
      authors: $BookTableTable.$converterauthors.fromSql(attachedDatabase
          .typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}authors'])!),
      pages: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}pages'])!,
      language: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}language'])!,
    );
  }

  @override
  $BookTableTable createAlias(String alias) {
    return $BookTableTable(attachedDatabase, alias);
  }

  static TypeConverter<List<String>, String> $converterauthors =
      ListTypeConverter();
}

class BookTableData extends DataClass implements Insertable<BookTableData> {
  final String id;
  final String bookTitle;
  final String imageUrl;
  final String status;
  final List<String> authors;
  final int pages;
  final String language;
  const BookTableData(
      {required this.id,
      required this.bookTitle,
      required this.imageUrl,
      required this.status,
      required this.authors,
      required this.pages,
      required this.language});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['book_title'] = Variable<String>(bookTitle);
    map['image_url'] = Variable<String>(imageUrl);
    map['status'] = Variable<String>(status);
    {
      map['authors'] =
          Variable<String>($BookTableTable.$converterauthors.toSql(authors));
    }
    map['pages'] = Variable<int>(pages);
    map['language'] = Variable<String>(language);
    return map;
  }

  BookTableCompanion toCompanion(bool nullToAbsent) {
    return BookTableCompanion(
      id: Value(id),
      bookTitle: Value(bookTitle),
      imageUrl: Value(imageUrl),
      status: Value(status),
      authors: Value(authors),
      pages: Value(pages),
      language: Value(language),
    );
  }

  factory BookTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return BookTableData(
      id: serializer.fromJson<String>(json['id']),
      bookTitle: serializer.fromJson<String>(json['bookTitle']),
      imageUrl: serializer.fromJson<String>(json['imageUrl']),
      status: serializer.fromJson<String>(json['status']),
      authors: serializer.fromJson<List<String>>(json['authors']),
      pages: serializer.fromJson<int>(json['pages']),
      language: serializer.fromJson<String>(json['language']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'bookTitle': serializer.toJson<String>(bookTitle),
      'imageUrl': serializer.toJson<String>(imageUrl),
      'status': serializer.toJson<String>(status),
      'authors': serializer.toJson<List<String>>(authors),
      'pages': serializer.toJson<int>(pages),
      'language': serializer.toJson<String>(language),
    };
  }

  BookTableData copyWith(
          {String? id,
          String? bookTitle,
          String? imageUrl,
          String? status,
          List<String>? authors,
          int? pages,
          String? language}) =>
      BookTableData(
        id: id ?? this.id,
        bookTitle: bookTitle ?? this.bookTitle,
        imageUrl: imageUrl ?? this.imageUrl,
        status: status ?? this.status,
        authors: authors ?? this.authors,
        pages: pages ?? this.pages,
        language: language ?? this.language,
      );
  BookTableData copyWithCompanion(BookTableCompanion data) {
    return BookTableData(
      id: data.id.present ? data.id.value : this.id,
      bookTitle: data.bookTitle.present ? data.bookTitle.value : this.bookTitle,
      imageUrl: data.imageUrl.present ? data.imageUrl.value : this.imageUrl,
      status: data.status.present ? data.status.value : this.status,
      authors: data.authors.present ? data.authors.value : this.authors,
      pages: data.pages.present ? data.pages.value : this.pages,
      language: data.language.present ? data.language.value : this.language,
    );
  }

  @override
  String toString() {
    return (StringBuffer('BookTableData(')
          ..write('id: $id, ')
          ..write('bookTitle: $bookTitle, ')
          ..write('imageUrl: $imageUrl, ')
          ..write('status: $status, ')
          ..write('authors: $authors, ')
          ..write('pages: $pages, ')
          ..write('language: $language')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, bookTitle, imageUrl, status, authors, pages, language);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is BookTableData &&
          other.id == this.id &&
          other.bookTitle == this.bookTitle &&
          other.imageUrl == this.imageUrl &&
          other.status == this.status &&
          other.authors == this.authors &&
          other.pages == this.pages &&
          other.language == this.language);
}

class BookTableCompanion extends UpdateCompanion<BookTableData> {
  final Value<String> id;
  final Value<String> bookTitle;
  final Value<String> imageUrl;
  final Value<String> status;
  final Value<List<String>> authors;
  final Value<int> pages;
  final Value<String> language;
  final Value<int> rowid;
  const BookTableCompanion({
    this.id = const Value.absent(),
    this.bookTitle = const Value.absent(),
    this.imageUrl = const Value.absent(),
    this.status = const Value.absent(),
    this.authors = const Value.absent(),
    this.pages = const Value.absent(),
    this.language = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  BookTableCompanion.insert({
    required String id,
    required String bookTitle,
    required String imageUrl,
    required String status,
    required List<String> authors,
    this.pages = const Value.absent(),
    this.language = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        bookTitle = Value(bookTitle),
        imageUrl = Value(imageUrl),
        status = Value(status),
        authors = Value(authors);
  static Insertable<BookTableData> custom({
    Expression<String>? id,
    Expression<String>? bookTitle,
    Expression<String>? imageUrl,
    Expression<String>? status,
    Expression<String>? authors,
    Expression<int>? pages,
    Expression<String>? language,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (bookTitle != null) 'book_title': bookTitle,
      if (imageUrl != null) 'image_url': imageUrl,
      if (status != null) 'status': status,
      if (authors != null) 'authors': authors,
      if (pages != null) 'pages': pages,
      if (language != null) 'language': language,
      if (rowid != null) 'rowid': rowid,
    });
  }

  BookTableCompanion copyWith(
      {Value<String>? id,
      Value<String>? bookTitle,
      Value<String>? imageUrl,
      Value<String>? status,
      Value<List<String>>? authors,
      Value<int>? pages,
      Value<String>? language,
      Value<int>? rowid}) {
    return BookTableCompanion(
      id: id ?? this.id,
      bookTitle: bookTitle ?? this.bookTitle,
      imageUrl: imageUrl ?? this.imageUrl,
      status: status ?? this.status,
      authors: authors ?? this.authors,
      pages: pages ?? this.pages,
      language: language ?? this.language,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (bookTitle.present) {
      map['book_title'] = Variable<String>(bookTitle.value);
    }
    if (imageUrl.present) {
      map['image_url'] = Variable<String>(imageUrl.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (authors.present) {
      map['authors'] = Variable<String>(
          $BookTableTable.$converterauthors.toSql(authors.value));
    }
    if (pages.present) {
      map['pages'] = Variable<int>(pages.value);
    }
    if (language.present) {
      map['language'] = Variable<String>(language.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('BookTableCompanion(')
          ..write('id: $id, ')
          ..write('bookTitle: $bookTitle, ')
          ..write('imageUrl: $imageUrl, ')
          ..write('status: $status, ')
          ..write('authors: $authors, ')
          ..write('pages: $pages, ')
          ..write('language: $language, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$Database extends GeneratedDatabase {
  _$Database(QueryExecutor e) : super(e);
  $DatabaseManager get managers => $DatabaseManager(this);
  late final $BookTableTable bookTable = $BookTableTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [bookTable];
}

typedef $$BookTableTableCreateCompanionBuilder = BookTableCompanion Function({
  required String id,
  required String bookTitle,
  required String imageUrl,
  required String status,
  required List<String> authors,
  Value<int> pages,
  Value<String> language,
  Value<int> rowid,
});
typedef $$BookTableTableUpdateCompanionBuilder = BookTableCompanion Function({
  Value<String> id,
  Value<String> bookTitle,
  Value<String> imageUrl,
  Value<String> status,
  Value<List<String>> authors,
  Value<int> pages,
  Value<String> language,
  Value<int> rowid,
});

class $$BookTableTableFilterComposer
    extends Composer<_$Database, $BookTableTable> {
  $$BookTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get bookTitle => $composableBuilder(
      column: $table.bookTitle, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get imageUrl => $composableBuilder(
      column: $table.imageUrl, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get status => $composableBuilder(
      column: $table.status, builder: (column) => ColumnFilters(column));

  ColumnWithTypeConverterFilters<List<String>, List<String>, String>
      get authors => $composableBuilder(
          column: $table.authors,
          builder: (column) => ColumnWithTypeConverterFilters(column));

  ColumnFilters<int> get pages => $composableBuilder(
      column: $table.pages, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get language => $composableBuilder(
      column: $table.language, builder: (column) => ColumnFilters(column));
}

class $$BookTableTableOrderingComposer
    extends Composer<_$Database, $BookTableTable> {
  $$BookTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get bookTitle => $composableBuilder(
      column: $table.bookTitle, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get imageUrl => $composableBuilder(
      column: $table.imageUrl, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get status => $composableBuilder(
      column: $table.status, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get authors => $composableBuilder(
      column: $table.authors, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get pages => $composableBuilder(
      column: $table.pages, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get language => $composableBuilder(
      column: $table.language, builder: (column) => ColumnOrderings(column));
}

class $$BookTableTableAnnotationComposer
    extends Composer<_$Database, $BookTableTable> {
  $$BookTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get bookTitle =>
      $composableBuilder(column: $table.bookTitle, builder: (column) => column);

  GeneratedColumn<String> get imageUrl =>
      $composableBuilder(column: $table.imageUrl, builder: (column) => column);

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumnWithTypeConverter<List<String>, String> get authors =>
      $composableBuilder(column: $table.authors, builder: (column) => column);

  GeneratedColumn<int> get pages =>
      $composableBuilder(column: $table.pages, builder: (column) => column);

  GeneratedColumn<String> get language =>
      $composableBuilder(column: $table.language, builder: (column) => column);
}

class $$BookTableTableTableManager extends RootTableManager<
    _$Database,
    $BookTableTable,
    BookTableData,
    $$BookTableTableFilterComposer,
    $$BookTableTableOrderingComposer,
    $$BookTableTableAnnotationComposer,
    $$BookTableTableCreateCompanionBuilder,
    $$BookTableTableUpdateCompanionBuilder,
    (BookTableData, BaseReferences<_$Database, $BookTableTable, BookTableData>),
    BookTableData,
    PrefetchHooks Function()> {
  $$BookTableTableTableManager(_$Database db, $BookTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$BookTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$BookTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$BookTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> bookTitle = const Value.absent(),
            Value<String> imageUrl = const Value.absent(),
            Value<String> status = const Value.absent(),
            Value<List<String>> authors = const Value.absent(),
            Value<int> pages = const Value.absent(),
            Value<String> language = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              BookTableCompanion(
            id: id,
            bookTitle: bookTitle,
            imageUrl: imageUrl,
            status: status,
            authors: authors,
            pages: pages,
            language: language,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String bookTitle,
            required String imageUrl,
            required String status,
            required List<String> authors,
            Value<int> pages = const Value.absent(),
            Value<String> language = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              BookTableCompanion.insert(
            id: id,
            bookTitle: bookTitle,
            imageUrl: imageUrl,
            status: status,
            authors: authors,
            pages: pages,
            language: language,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$BookTableTableProcessedTableManager = ProcessedTableManager<
    _$Database,
    $BookTableTable,
    BookTableData,
    $$BookTableTableFilterComposer,
    $$BookTableTableOrderingComposer,
    $$BookTableTableAnnotationComposer,
    $$BookTableTableCreateCompanionBuilder,
    $$BookTableTableUpdateCompanionBuilder,
    (BookTableData, BaseReferences<_$Database, $BookTableTable, BookTableData>),
    BookTableData,
    PrefetchHooks Function()>;

class $DatabaseManager {
  final _$Database _db;
  $DatabaseManager(this._db);
  $$BookTableTableTableManager get bookTable =>
      $$BookTableTableTableManager(_db, _db.bookTable);
}
