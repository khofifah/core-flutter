class Employee {
  final String nama;
  final int umur;
  final bool fulltime;
  final String foto;
  final String cv;

  Employee({
    this.nama,
    this.umur,
    this.fulltime,
    this.foto,
    this.cv,
  });

  factory Employee.fromJson(Map<String, dynamic> json) {
    return Employee(
      nama: json['nama'],
      umur: json['umur'],
      fulltime: json['fulltime'] == 1 ? true : false,
      foto: json['foto'],
      cv: json['cv'],
    );
  }
}
