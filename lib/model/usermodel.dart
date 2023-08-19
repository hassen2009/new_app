class UserModel{
  String name;
  String bio;
  String profilePic;
  String createdAt;
  String phoneNumber;
  String uid;


  UserModel({
    required this.name,
    required this.bio,
    required this.profilePic,
    required this.createdAt,
    required this.phoneNumber,
    required this.uid,
      }
      );
  factory UserModel.fromMap(Map<String,dynamic>map){
    return UserModel
      (name: map["name"] ??"",
        bio: map["bio"]?? "",
        profilePic:map["profilePic"] ?? "",
        createdAt: map["createdAt"]?? "",
        phoneNumber:map["phoneNumber"] ??"",
      uid: map["uid"]?? "",
    );
  }
  Map<String,dynamic> toMap(){
    return{
      "name":name,
      "bio":bio,
      "profilePic":profilePic,
     "createdAt":createdAt,
     "phoneNumber":phoneNumber,
      "uid":uid,
    };
  }
}