class Task{
  int ? id;
  String? title;
  String? nom;
  String? salle;
  int? isCompleted;
  int? isTP;
  String? date;
  String? debut;
  String? fin;
  int? couleur;
  String? repeat;

  Task({
    this.id,
  this.title,
  this.nom,
    this.salle,
  this.isCompleted,
  this.date,
  this.debut,
  this.fin,
  this.couleur,
  this.repeat,
    this.isTP
}
);
  Task.formJson(Map<String, dynamic> json){
    id = json['id'];
    title= json['title'];
    nom =json['nom'];
    salle = json['salle'];
    isCompleted =json['isCompleted'];
    date=json['date'];
   debut =json['debut'];
   fin =json['fin'];
   repeat = json['repeat'];
    couleur =json['couleur'];
    isTP= json['isTP'];

  }
  Map<String, dynamic> toJson(){
    final Map<String,dynamic> data = new Map<String, dynamic>();
    data['id']=this.id;
    data['title']=this.title;
    data['nom']=this.nom;
    data['salle']=this.salle;
    data['date']=this.date;
    data['debut']=this.debut;
    data['fin']=this.fin;
    data['repeat']=this.repeat;
    data['couleur']=this.couleur;
    data['isTP']=this.isTP;
    return data;
  }

}