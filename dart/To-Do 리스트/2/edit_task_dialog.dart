import 'package:flutter/material.dart';
import 'task_model.dart';

class EditTaskDialog extends StatefulWidget {
  final Task task;
  final void Function(String, Priority, DateTime?) onSave;

  EditTaskDialog({required this.task, required this.onSave});

  @override
  _EditTaskDialogState createState() => _EditTaskDialogState();
}

class _EditTaskDialogState extends State<EditTaskDialog> {
  late TextEditingController _titleController;
  late Priority _selectedPriority;
  DateTime? _selectedDueDate;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(text: widget.task.title);
    _selectedPriority = widget.task.priority;
    _selectedDueDate = widget.task.dueDate;
  }

  Future<void> _pickDueDate() async {
    final now = DateTime.now();
    final picked = await showDatePicker(
      context: context,
      initialDate: _selectedDueDate ?? now,
      firstDate: now,
      lastDate: DateTime(now.year + 10),
    );
    if (picked != null) {
      setState(() {
        _selectedDueDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('할 일 수정'),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: _titleController,
              decoration: InputDecoration(labelText: '제목'),
            ),
            DropdownButton<Priority>(
              value: _selectedPriority,
              items: Priority.values.map((Priority priority) {
                return DropdownMenuItem<Priority>(
                  value: priority,
                  child: Text(priority.toString().split('.').last),
                );
              }).toList(),
              onChanged: (Priority? newPriority) {
                if (newPriority != null) {
                  setState(() {
                    _selectedPriority = newPriority;
                  });
                }
              },
            ),
            SizedBox(height: 12),
            Row(
              children: [
                Text(
                  _selectedDueDate == null
                      ? '마감일 선택 안함'
                      : '마감일: ${_selectedDueDate!.toLocal().toString().split(' ')[0]}',
                ),
                IconButton(
                  icon: Icon(Icons.calendar_today),
                  onPressed: _pickDueDate,
                ),
                if (_selectedDueDate != null)
                  IconButton(
                    icon: Icon(Icons.clear),
                    onPressed: () {
                      setState(() {
                        _selectedDueDate = null;
                      });
                    },
                  ),
              ],
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          child: Text('취소'),
          onPressed: () => Navigator.of(context).pop(),
        ),
        ElevatedButton(
          child: Text('저장'),
          onPressed: () {
            widget.onSave(
              _titleController.text,
              _selectedPriority,
              _selectedDueDate,
            );
          },
        ),
      ],
    );
  }
}

