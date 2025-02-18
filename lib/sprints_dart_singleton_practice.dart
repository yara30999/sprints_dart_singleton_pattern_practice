class Database {
  final int id;
  final String name;
  String? description = '';
  Database._internal(this.id, this.name);

  static Database? _instance;

  factory Database() {
    if (_instance == null) {
      _instance = Database._internal(1, 'yara');
      return _instance!;
    } else {
      return _instance!;
    }
  }

  void printDatabaseInfo({String? descriptionLabel}) {
    description = descriptionLabel;
    print(
      "$description database with id= $id and name= $name has been created!",
    );
  }
}

class Client {
  void checkSingleton() {
    Database db1 = Database();
    Database db2 = Database();

    db1.printDatabaseInfo(descriptionLabel: 'first object');
    db2.printDatabaseInfo(
      descriptionLabel: 'second object is the same as the first',
    );

    if (db1.description == db2.description) {
      print("Both instances are the same. Singleton applied successfully!");
    } else {
      print("Instances are different. Singleton implementation failed!");
    }
  }
}

void main() {
  Client client = Client();
  client.checkSingleton();
}
