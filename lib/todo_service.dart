import 'package:cloud_firestore/cloud_firestore.dart';

class TodoService{
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Stream<QuerySnapshot> getTasks() {
    return _db.collection('tasks').snapshots();
  }

  Future<void> addTask(String title){
    return _db.collection('tasks').add({'title': title, "completed": false});
  }

  Future<void> updateTask(String taskId, bool completed){
    return _db.collection('tasks').doc(taskId).update({'completed': completed});
  }

  Future<void> deleteTask(String taskId){
    return _db.collection('tasks').doc(taskId).delete();
  }

  Future<void> restoreTask(String taskId, Map<String, dynamic> taskData)  {
    return _db.collection('tasks').doc(taskId).set(taskData);
  }
}