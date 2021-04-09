class Contact {
  final int id;
  final String fName;
  final String lName;
  final String phone;

  Contact({this.id,this.fName, this.lName, this.phone});

  Map<String, dynamic> toMap() =>{
    'fName':fName,
    'lName':lName,
    'phone':phone,
  };

  factory Contact.fromMap(Map<String, dynamic> json) => new Contact(
    id: json['id'],
    fName:  json['fName'],
    lName: json['lName'],
    phone: json['phone']
  );
}