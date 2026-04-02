import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../models/bilhetes.dart';

class DatabaseService {
  // Padrão Singleton para ter apenas uma conexão aberta
  static final DatabaseService instance = DatabaseService._init();
  static Database? _database;

  DatabaseService._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('megasena.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    // cria a tabela
    await db.execute('''
      CREATE TABLE bilhetes (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        data_sorteio TEXT NOT NULL,
        numeros TEXT NOT NULL 
      )
    ''');
  }

  // salvar no banco de dados
  Future<int> inserirBilhete(bilhete novoBilhete) async {
    final db = await instance.database;
    
    return await db.insert('bilhetes', {
      'data_sorteio': novoBilhete.dataSorteio,
      //transforma uma lista em string
      'numeros': novoBilhete.numeros.join(','), 
    });
  }

  // ler o banco de dados
  Future<List<bilhete>> lerTodosBilhetes() async {
    final db = await instance.database;
    
    // busca tudo do banco, ordenando do mais novo pro mais velho
    final result = await db.query('bilhetes', orderBy: 'id DESC');

    return result.map((json) {
      //tranforma em uma lista
      String numerosString = json['numeros'] as String;
      List<int> listaNumeros = numerosString.split(',').map((e) => int.parse(e)).toList();

      return bilhete(
        dataSorteio: json['data_sorteio'] as String,
        numeros: listaNumeros,
      );
    }).toList();
  }
}