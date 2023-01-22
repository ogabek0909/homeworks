class Student{
  final int id;
  final String fullname;
  final result;
  final int total;
  final int attempt;

  Student({required this.id,required this.fullname,required this.result,required this.total,required this.attempt});

  factory Student.getStudent(Map data){
    
    int a = 0;
    if(data['result'].runtimeType == List){
      for (int i = 0; i < data['result'].length; i++) {
        a += data['result'][i] as int;
      }
    }
    return Student(id: data['id'], fullname: data['fullname'], result: data['result'],total: a,attempt: data['attempt']);
  }
}