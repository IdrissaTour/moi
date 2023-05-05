
class Poste{
  String name;
  String _imagePath  = "";
  String desc;
  String time;
  int like;
  int commts;
  int partage;


  Poste({
    required this.name,
     this.commts=0,
     this.like = 0,
    this.partage = 0,
    required this.time,
    String imagePath = "" ,
    required this.desc,

}){
  this._imagePath=imagePath;
}
// je pourrais uniquement obtenir cette valeur via cette valeur (get)
  String get imagePath{
    return _imagePath;
  }

String setTime() => "il y'a $time ";
String setLike(){
  return "$like j'aime";
}

String setCommts(){
  if(commts > 1){
    return " $commts Commentaires";
  }else{
    return " $commts Commentaire";
  }
}
String setPartage() => "$partage Partager";
}


