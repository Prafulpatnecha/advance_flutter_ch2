# advance_flutter_ch2

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.


###
<h1></h1>
<h3 align="center"><i>Counting</i></h3>
<h1></h1>
<div align="center">
<img src="https://github.com/Prafulpatnecha/advance_flutter_ch2/blob/master/count_image.png" height=450px hspace=20>

</div>

<h1></h1>
<div align="center">
<a href="https://github.com/Prafulpatnecha/advance_flutter_ch2/blob/master/lib/view/counter_screen/counter_page.dart">-> Code File Link <-</a>
</div>
<h1></h1>


https://github.com/user-attachments/assets/61a54218-32e7-479b-ac5f-4416e2592b6c

###
<h1></h1>
<h3 align="center"><i>CRUD OPERATION FOR EMPLOYEE MANAGEMENT SYSTEM USING GETX</i></h3>
<h1></h1>
<div align="center">
<img src="https://github.com/Prafulpatnecha/advance_flutter_ch2/blob/master/img1.png" height=450px hspace=20>
<img src="https://github.com/Prafulpatnecha/advance_flutter_ch2/blob/master/img2.png" height=450px hspace=20>
<img src="https://github.com/Prafulpatnecha/advance_flutter_ch2/blob/master/img3.png" height=450px hspace=20>

</div>

<h1></h1>
<div align="center">
<a href="https://github.com/Prafulpatnecha/advance_flutter_ch2/tree/master/lib/view/management_system">-> Code File Link <-</a>
</div>
<h1></h1>


https://github.com/user-attachments/assets/e68c9a40-77cf-4ee2-9a98-f3384c1802cd

###
<h1></h1>
<h3 align="center"><i>18.1 SQL Queries</i></h3>


### • Field names: id, name, role, salary, age, address, phone. And Add a new employee with all the details.

```bash
INSERT INTO employee (name,age,role,salary,phone) VALUES ("admin",20,"Manager",50000,9635518229);
```

<h1></h1>
<div align="center">
<img src="https://github.com/user-attachments/assets/055ab43e-3b01-492a-a729-c47bd2c78672">
</div>

<h1></h1>

### • Add multiple employees with selective data:

```bash
INSERT INTO employee (name,age,role,salary,phone) VALUES ("admin",21,"Employee",40000,9635518222);
INSERT INTO employee (name,age,role,salary,phone) VALUES ("adom",23,"Employee",30000,1234567891);
INSERT INTO employee (name,age,role,salary,phone) VALUES ("sky",20,"Employee",20000,9876543210);
```
<h1></h1>
<div align="center">
<img src="https://github.com/user-attachments/assets/4d546c1f-0ace-438e-809e-7bc777d07a64">
</div>

<h1></h1>


### • Retrieve all employee information:

```bash
SELECT * FROM employee;
```

<h1></h1>
<div align="center">
<img src="https://github.com/user-attachments/assets/ed4ab14e-4e42-46b2-a937-c57eb35b8e70">
</div>

<h1></h1>

### • Get specific columns for all employees (e.g., name, salary).

```bash
SELECT * FROM employee WHERE name = "sky";
```
```bash
SELECT * FROM employee WHERE salary > 20000;
```

<h1></h1>
<div align="center">
<img src="https://github.com/user-attachments/assets/a1e832e4-0a75-45fe-a10f-765ed07a7631">
</div>

<h1></h1>


### • Find employees with a particular role (e.g., Manager).

```bash
SELECT * FROM employee WHERE role = "Manager"
```
```bash
SELECT * FROM employee WHERE role = "Employee"
```

<h1></h1>
<div align="center">
<img src="https://github.com/user-attachments/assets/e4e2c01c-f081-4cbd-b73e-4a8b6f9a1ec4">
</div>

<h1></h1>


### • Search for employees with names containing "An" (case-insensitive):

```bash
SELECT * FROM employee WHERE LOWER(name) like "%an%"
```


### • Find employees older than 30 and earning more than $70,000:

```bash
SELECT * FROM employee WHERE age > 30 AND salary > 70000
```

### • Change the salary of an employee with ID 100:

```bash
UPDATE employee SET salary = 20000 WHERE id = 100;
```

### • Update the address for employees in the 'Sales' role:

```bash
UPDATE employee SET address = "ANY Place" WHERE role = "Sales";
```

### • Remove an employee with ID 101:

```bash
DELETE FROM employees WHERE id = 101;
```

### • Delete all employees under 20 (assuming it's not a valid age).

```bash
DELETE FROM employees WHERE age < 20;
```

###
<h1></h1>
<div align="center">
<img src="https://github.com/Prafulpatnecha/advance_flutter_ch2/blob/master/imageSQL1.png" height=450px hspace=20>
<img src="https://github.com/user-attachments/assets/844f418a-4d48-495d-ac85-79996c5a6d83">

</div>

```bash
static DbHelper dbHelper = DbHelper._();
  DbHelper._();
  
  Database? _db;
  
  Future get database async => _db ?? await initDatabase();
  //Todo Create
  Future<Database?> initDatabase() async {
    final path = await getDatabasesPath();
    final dbPath = join(path, "finance.db");
    _db = await openDatabase(
      dbPath,
      version: 1,
      onCreate: (db, version) async {
        String sql = '''CREATE TABLE finance(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        amount REAL NOT NULL ,
        isIncome INTEGER NOT NULL,
        category TEXT
        );''';
        await db.execute(sql);
      },
    );
    return _db;
  }
  //Todo Insert
  Future<void> insertData({required double amount,required double isIncome,required String category})
  async {
    Database? db = await database;
    String sql='''
    INSERT INTO finance(
    amount ,isIncome,category
    ) VALUES ($amount,$isIncome,"$category");
    ''';
    await db!.rawInsert(sql);
  }
  // TODO Delete
  Future<void> deleteData()
  async {
    Database? db = await database;
    String sql='''
    DELETE FROM finance
    ''';
    await db!.rawDelete(sql);
  }
```





<h1></h1>
<div align="center">
<a href="https://github.com/Prafulpatnecha/advance_flutter_ch2/tree/master/lib/database_sql">-> Code File Link <-</a>
</div>
<h1></h1>

  
###
<h1></h1>
<h3 align="center"><i>18.2 CRUD Operation in Budget Tracker App</i></h3>
<h1></h1>
<div align="center">
<img src="https://github.com/Prafulpatnecha/advance_flutter_ch2/blob/master/finance1.png" height=450px hspace=20>
<img src="https://github.com/Prafulpatnecha/advance_flutter_ch2/blob/master/finance2.png" height=450px hspace=20>
<img src="https://github.com/Prafulpatnecha/advance_flutter_ch2/blob/master/finance3.png" height=450px hspace=20>
<img src="https://github.com/Prafulpatnecha/advance_flutter_ch2/blob/master/finance4.png" height=450px hspace=20>
<img src="https://github.com/Prafulpatnecha/advance_flutter_ch2/blob/master/finance5.png" height=450px hspace=20>
<img src="https://github.com/Prafulpatnecha/advance_flutter_ch2/blob/master/finance6.png" height=450px hspace=20>
<img src="https://github.com/Prafulpatnecha/advance_flutter_ch2/blob/master/finance7.png" height=450px hspace=20>
<img src="https://github.com/Prafulpatnecha/advance_flutter_ch2/blob/master/finance8.png" height=450px hspace=20>

</div>

<h1></h1>
<div align="center">
<a href="https://github.com/Prafulpatnecha/advance_flutter_ch2/tree/master/lib/database_sql">-> Code File Link <-</a>
</div>
<h1></h1>


https://github.com/user-attachments/assets/6326d07a-2aec-4f6e-815c-7151e9943a42


###
<h1></h1>
<h3 align="center"><i>18.2 CRUD Operation in Budget Tracker App Update Work</i></h3>
<h1></h1>
<div align="center">
<img src="https://github.com/Prafulpatnecha/advance_flutter_ch2/blob/master/imageUpdate1.png" height=450px hspace=20>
<img src="https://github.com/Prafulpatnecha/advance_flutter_ch2/blob/master/imageUpdate2.png" height=450px hspace=20>
<img src="https://github.com/Prafulpatnecha/advance_flutter_ch2/blob/master/imageUpdate3.png" height=450px hspace=20>
  
</div>

<h1></h1>
<div align="center">
<a href="https://github.com/Prafulpatnecha/advance_flutter_ch2/tree/master/lib/database_sql">-> Code File Link <-</a>
</div>
<h1></h1>



https://github.com/user-attachments/assets/6d84b689-2d2c-4dc7-8bb9-9881f0bf11b5

###
<h1></h1>
<h3 align="center"><i>18.2 CRUD Operation in Budget Tracker App Update Work 2</i></h3>
<h1></h1>
<div align="center">
<img src="https://github.com/Prafulpatnecha/advance_flutter_ch2/blob/master/imageUpdate.png" height=450px hspace=20>
  
</div>

<h1></h1>
<div align="center">
<a href="https://github.com/Prafulpatnecha/advance_flutter_ch2/tree/master/lib/database_sql">-> Code File Link <-</a>
</div>
<h1></h1>


https://github.com/user-attachments/assets/eb01d73f-8016-4d20-87db-56feb46ba6f0

