class TaskModel {
  final int id;
  final int reqUserID;
  final int respUserID;
//  DateTime nn;
  final bool isRespOnTime;
  final bool isDone;
  final bool isInDeadline;
  final String description;
  TaskModel(
      {required this.id,
      //  this.nn =   DateTime.now(),
      required this.reqUserID,
      required this.respUserID,
      required this.isRespOnTime,
      required this.isDone,
      required this.isInDeadline,
      required this.description});

  static toTask(map) {
    return TaskModel(
        id: int.parse(map['cagriId']),
        reqUserID: map['musteriId'],
        respUserID: map['employee_Id'],
        isRespOnTime: true,
        isDone: map['isDone'],
        isInDeadline: map['isDeadline'],
        description: map['description']);
  }
}
