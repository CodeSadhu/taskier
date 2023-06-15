import 'package:appwrite_hack/models/task_model.dart';
import 'package:appwrite_hack/utils/colors.dart';
import 'package:appwrite_hack/utils/constants.dart';
import 'package:appwrite_hack/utils/strings.dart';
import 'package:appwrite_hack/utils/styles.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:normie/normie.dart';

class TaskForm extends StatefulWidget {
  const TaskForm({super.key});

  @override
  State<TaskForm> createState() => _TaskFormState();
}

class _TaskFormState extends State<TaskForm> {
  final _formKey = GlobalKey<FormState>();

  String _taskName = '';
  String _taskDescription = '';
  DateTime? _taskDeadline;

  // TextEditingController _taskNameController = TextEditingController();
  // TextEditingController _taskDescriptionController = TextEditingController();

  late Size size;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    // _taskNameController.dispose();
    // _taskDescriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    size = Constants.getSize(context);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'New Task',
          style: Styles.appbarStyle(fontSize: 32),
        ),
      ),
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: size.width * 0.04,
              vertical: size.height * 0.02,
            ),
            constraints: BoxConstraints(
              maxWidth: size.width,
            ),
            child: Column(
              children: [
                TextFormField(
                  // controller: _taskNameController,
                  textCapitalization: TextCapitalization.words,
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                  decoration: Styles.inputDecoration(
                    hintText: 'Task Name',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a task name.';
                    }
                    return null;
                  },
                  onSaved: (value) {},
                  onChanged: (val) {
                    setState(() {
                      _taskName = val;
                    });
                  },
                ),
                SizedBox(height: size.height * 0.02),
                TextFormField(
                  // controller: _taskDescriptionController,
                  textCapitalization: TextCapitalization.sentences,
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                  decoration: Styles.inputDecoration(
                    hintText: 'Task Description',
                  ),
                  onSaved: (value) {
                    _taskDescription = value!;
                  },
                  onChanged: (val) {
                    setState(() {
                      _taskDescription = val;
                    });
                  },
                ),
                SizedBox(height: size.height * 0.02),
                TextFormField(
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                  decoration: Styles.inputDecoration(
                    hintText: 'Task Deadline',
                  ),
                  onTap: () async {
                    final selectedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime.now(),
                      lastDate: DateTime(2100),
                    );
                    if (selectedDate != null) {
                      setState(() {
                        _taskDeadline = selectedDate;
                      });
                    }
                  },
                  readOnly: true,
                  controller: TextEditingController(
                    text: _taskDeadline != null
                        ? _taskDeadline!.toString().substring(0, 10)
                        : '',
                  ),
                ),
                SizedBox(height: size.height * 0.02),
                ElevatedButton(
                  onPressed: _taskName.isNotEmpty ? _saveTask : null,
                  style: ElevatedButton.styleFrom(
                    disabledBackgroundColor:
                        ColorPalette.primary.withOpacity(0.2),
                    padding: EdgeInsets.symmetric(
                      horizontal: size.width * 0.05,
                      vertical: size.height * 0.015,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text(
                    'Save Task',
                    style: Styles.bodyStyle(
                      color: _taskName.isNotEmpty ? Colors.white : Colors.grey,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _saveTask() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      TaskModel task = TaskModel(
        name: _taskName,
        description: _taskDescription,
        deadline: _taskDeadline != null
            ? Normie.formatDate(
                date: _taskDeadline.toString(),
                inputFormat: 'yyyy-MM-dd',
                outputFormat: 'dd-MM-yyyy',
              )
            : null,
      );
      Box<TaskModel> box = Hive.box(Strings.tasks);
      box.add(task);
      // Perform any desired operations with the form data
      // For example, save the task to a database
      if (kDebugMode) {
        print('Task Name: $_taskName');
        print('Task Description: $_taskDescription');
        print('Task Deadline: $_taskDeadline');
      }
      Navigator.pop(context);
    }
  }
}
