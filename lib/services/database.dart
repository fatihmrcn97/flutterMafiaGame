import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mafia/models/mafiaProperties.dart';

class DatabaseService{
  final String uid;
  DatabaseService({this.uid});
  // Collection reference
  final CollectionReference mafiaCollection = Firestore.instance.collection("mafias");
  
  Future updateUserData(String name, int power, int energy ) async {
    return await mafiaCollection.document(uid).setData({
      'name' : name,
      'power': power,
      'energy':energy
    });
  }
  // mafia list from snapshot
  List<Mafia> _mafiaListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc){
       return Mafia(name: doc.data['name'] ?? '',
                    power: doc.data['power'] ?? 0,
                    energy: doc.data['energy'] ?? 0,
       );
    }).toList();
  }

  // get mafia stream
  Stream<List<Mafia>> get mafias{
    return mafiaCollection.snapshots()
    .map(_mafiaListFromSnapshot);
  }

}