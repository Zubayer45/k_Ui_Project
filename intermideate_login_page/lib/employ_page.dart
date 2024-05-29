import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Employee {
  int employId;
  String name;
  String address;
  String? role;
  File? imageFile;

  Employee({
    required this.employId,
    required this.name,
    required this.address,
    this.role,
    this.imageFile,
  });
}

class AddEmployeeForm extends StatefulWidget {
  @override
  _AddEmployeeFormState createState() => _AddEmployeeFormState();
}

class _AddEmployeeFormState extends State<AddEmployeeForm> {
  final _formKey = GlobalKey<FormState>();

  int _employId = 0;
  String _name = '';
  String _address = '';
  String? _role;
  File? _imageFile;

  final picker = ImagePicker();

  Future<void> _pickImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
      });
    }
  }

  void _saveForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      // Auto-increment Employ ID
      _employId++;

      // Do something with the form data, like saving it to a database
      Employee newEmployee = Employee(
        employId: _employId,
        name: _name,
        address: _address,
        role: _role,
        imageFile: _imageFile,
      );

      // Print the new employee data
      print(newEmployee);

      // Clear the form
      _formKey.currentState!.reset();
      setState(() {
        _imageFile = null; // Clear the image after saving
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink[50],
        title: Title(
            color: Colors.black,
            child: Text(
              "Add Employ ",
              style: TextStyle(fontSize: 22),
            )),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  TextFormField(
                    readOnly: true,
                    initialValue: '$_employId',
                    decoration: InputDecoration(
                      labelText: 'Employee ID',
                    ),
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Name'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter name';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _name = value!;
                    },
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Address'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter address';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _address = value!;
                    },
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Role'),
                    onSaved: (value) {
                      _role = value;
                    },
                  ),
                  SizedBox(height: 30),
                  _imageFile == null
                      ? Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(colors: const [
                              Color.fromARGB(255, 141, 248, 250),
                              Color.fromARGB(255, 237, 168, 191),
                            ]),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: ElevatedButton(
                              onPressed: _pickImage,
                              child: Icon(
                                Icons.image_outlined,
                              )
                              //  Text('Add Image'),
                              ),
                        )
                      : Image.file(
                          _imageFile!,
                          height: 100,
                          width: 100,
                          fit: BoxFit.cover,
                        ),
                  SizedBox(height: 30),
                  Center(
                    child: GestureDetector(
                      onTap: _saveForm,
                      child: Container(
                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(colors: const [
                            Color.fromARGB(255, 141, 248, 250),
                            Color.fromARGB(255, 237, 168, 191),
                          ]),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          'Save',
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    /*
                     Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => check_all()),
                  );
                },
                child: Container(
                  padding: EdgeInsets.all(18),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(colors: const [
                      Color.fromARGB(255, 141, 248, 250),
                      Color.fromARGB(255, 237, 168, 191),
                    ]),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Center(
                      child: Text(
                    'Check All',
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  )),
                ),
              ),
            ),
                    */
                  ),
                  SizedBox(
                    height: 30,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
