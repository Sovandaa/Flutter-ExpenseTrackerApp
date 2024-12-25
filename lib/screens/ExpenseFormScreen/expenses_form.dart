import 'package:expense_app/models/category.dart';
import 'package:expense_app/models/expense.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

enum FormMode {
  creating,
  editing,
}

class ExpensesForm extends StatefulWidget {
  const ExpensesForm({
    super.key,
    required this.mode,
    this.editedItem,
  });
  final FormMode mode;
  final Expense? editedItem;

  @override
  State<ExpensesForm> createState() => _ExpensesFormState();
}

class _ExpensesFormState extends State<ExpensesForm> {
  // create a key to access & control state of the form
  final _formkey = GlobalKey<FormState>();
  Uuid uuid = const Uuid();

  late Category _selectedCategory;
  late DateTime _selectedDate;
  late String _title;
  late double _amount;
  late String? _note;
  late TextEditingController _dateController;

  bool get creatingMode => widget.mode == FormMode.creating;
  bool get editingMode => widget.mode == FormMode.editing;

  String get headerLabel => creatingMode ? 'Add Expense' : 'Edit Expense';
  String get buttonLabel => creatingMode ? 'Save Expense' : 'Update Expense';

  @override
  void initState() {
    super.initState();
    if (creatingMode) {
      _selectedCategory = Category.food;
      _amount = 0;
      _title = '';
      _selectedDate = DateTime.now();
      _note = null;
    } else {
      // Check if widget.editedItem is not null
      if (widget.editedItem != null) {
        _amount = widget.editedItem!.amount;
        _title = widget.editedItem!.title;
        _selectedCategory = widget.editedItem!.category;
        _selectedDate = widget.editedItem!.date;
        _note = widget.editedItem!.note;
      }
    }
    _dateController =
        TextEditingController(text: DateFormat.yMd().format(_selectedDate));
  }

  @override
  void dispose() {
    _dateController.dispose();
    super.dispose();
  }

  void resetForm() {
    _formkey.currentState!.reset();
  }

  // validated form
  String? validatedAmount(String? value) {
    if (value == null || value.isEmpty) {
      return 'Amount cannot be null';
    }
    if (double.tryParse(value) == null || double.tryParse(value)! <= 0) {
      return 'Must be a valid, Positive Number.';
    }
    return null;
  }

  String? validatedTitle(String? value) {
    if (value == null || value.isEmpty || value.trim().length > 50) {
      return 'Title cannot be null or exceed 50 characters';
    }
    return null;
  }

  String? validatedNote(String? value) {
    if (value != null && value.length > 120) {
      return 'Note description cannot exceed 120 characters.';
    }
    return null;
  }

  // save item to list, passed data to home expense
  void saveItem() {
    bool valid = _formkey.currentState!.validate();

    if (valid) {
      _formkey.currentState!.save();
      String id = editingMode ? widget.editedItem!.id : uuid.v4();
      Navigator.of(context).pop(
        Expense(
          id: id,
          title: _title,
          amount: _amount.toDouble(),
          date: _selectedDate,
          category: _selectedCategory,
          note: _note,
        ),
      );

      // show msg add expense success
      if (creatingMode) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Expense Added successfully!"),
            backgroundColor: Colors.blue,
            duration: Duration(milliseconds: 850),
          ),
        );
      }

    }
  }

  // Method Date Picker
  void pickDate() async {
    final DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: _selectedDate,
        firstDate: DateTime(200),
        lastDate: DateTime(2040),
        // decorate date picker themes
        builder: (context, picker) {
          return Theme(
            data: ThemeData.light().copyWith(
              colorScheme: ColorScheme.light(
                primary: Colors.blue,
                onPrimary: Colors.white,
                surface: Colors.white,
                onSurface: Colors.blueAccent,
              ),
              dialogBackgroundColor: Colors.white,
            ),
            child: picker!,
          );
        });
    // check if user selected a date (trigger)
    if (pickedDate != null && pickedDate != _selectedDate) {
      setState(() {
        _selectedDate = pickedDate;
        _dateController.text = DateFormat.yMd()
            .format(_selectedDate); // Update the controller text
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(headerLabel, 
        style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
      ),
      backgroundColor: const Color(0xFFF2F2F8),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formkey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            // mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("How much?",
                      textAlign: TextAlign.left,
                      style: TextStyle(fontSize: 24)),
                  // Textfield Amount
                  TextFormField(
                    initialValue: _amount.toString(),
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w500,
                    ),
                    keyboardType:
                        TextInputType.numberWithOptions(decimal: true),
                    decoration: const InputDecoration(
                      prefix: Text("\$"),
                      hintText: ' ',
                      border: InputBorder.none,
                    ),
                    inputFormatters: <TextInputFormatter>[
                      LengthLimitingTextInputFormatter(12),
                      FilteringTextInputFormatter.allow(
                          RegExp(r'^\d*\.?\d{0,2}')), // only double number
                    ],
                    // handle error validated
                    validator: (value) => validatedAmount(value),
                    onSaved: (value) {
                      _amount = double.parse(value!);
                    },
                  )
                ],
              ),
              const SizedBox(height: 16),
              // Spacer(),
              Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          spreadRadius: 1,
                          blurRadius: 10,
                          offset: const Offset(3, 3),
                        ),
                      ],
                      borderRadius: BorderRadius.circular(15)),
                  padding: EdgeInsets.all(20),
                  child: Column(
                    children: <Widget>[
                      // Title input
                      TextFormField(
                        initialValue: _title,
                        maxLength: 50,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.blue, width: 2),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.grey, width: 1),
                          ),
                          hintText: 'Title',
                          counterText: '',
                        ),
                        // handle error validated
                        validator: (value) => validatedTitle(value),
                        onSaved: (value) {
                          _title = value!;
                        },
                      ),
                      const SizedBox(height: 16),

                      // Category dropdown list
                      DropdownButtonFormField<Category>(
                        value: _selectedCategory,
                        decoration: InputDecoration(
                            hintText: 'Category Expense',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.blue, width: 2),
                            ),
                        ),
                        icon: const Icon(Icons.keyboard_arrow_down),
                        borderRadius: BorderRadius.circular(20),
                        style: const TextStyle(color: Colors.black),
                        items: [
                          for (final category in Category.values)
                            DropdownMenuItem<Category>(
                              value: category,
                              child: Row(
                                children: [
                                  Icon(
                                    category.icon,
                                    color: category.color,
                                  ),
                                  const SizedBox(width: 8),
                                  Text(category.label),
                                ],
                              ),
                            ),
                        ],
                        onChanged: (Category? value) {
                          setState(() {
                            _selectedCategory = value!;
                          });
                        },
                      ),
                      const SizedBox(height: 16),

                      // Date Picker
                      TextFormField(
                        // initialValue: DateFormat.yMd().format(_selectedDate), // need to modify later
                        readOnly: true,
                        decoration: InputDecoration(
                          hintText: 'Pick Date',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.blue, width: 2),
                          ),
                          suffixIcon: Icon(
                            Icons.calendar_today,
                            color: Colors.black,
                          ),
                        ),
                        onTap: pickDate,
                        controller: _dateController,
                      ),
                      const SizedBox(
                        height: 16,
                      ),

                      // Optional Note
                      TextFormField(
                        initialValue: _note,
                        maxLength: 120,
                        maxLines: 3, // Set the height by increasing maxLines
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.blue, width: 2),
                          ),
                          hintText: 'Note',
                        ),
                        onChanged: (value) {
                          _note = value; // Update _note when the text changes
                        },
                      ),
                      const SizedBox(height: 16),

                      Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          // Button Add Expense
                          ElevatedButton(
                            onPressed: saveItem,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.lightBlue,
                            ),
                            child: Text(
                              buttonLabel,
                              style: TextStyle(
                                color: Colors.black87,
                              ),
                            ),
                          ),

                          // Divider Line
                          Row(
                            children: [
                              Expanded(
                                child: Divider(
                                  color: Colors.grey,
                                  height: 28,
                                  thickness: 0.5,
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8.0),
                                child: Text('Or'),
                              ),
                              Expanded(
                                child: Divider(
                                  color: Colors.grey,
                                  height: 28,
                                  thickness: 0.5,
                                ),
                              ),
                            ],
                          ),

                          // Button Reset Expense
                          ElevatedButton(
                            onPressed: resetForm,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.lightBlue[100],
                            ),
                            child: const Text(
                              "Reset",
                              style: TextStyle(
                                color: Colors.black87,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
