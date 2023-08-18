class TaskModel {
  final int id;
  final int reqUserID;
  final int respUserID;
  final DateTime recTime;
  final DateTime compTime;
  final DateTime respTime;
  final bool isRespOnTime;
  final bool isDone;
  final bool isInDeadline;
  final String description;
  TaskModel(
      {required this.id,
      required this.reqUserID,
      required this.respUserID,
      required this.recTime,
      required this.respTime,
      required this.compTime,
      required this.isRespOnTime,
      required this.isDone,
      required this.isInDeadline,
      required this.description});
}
