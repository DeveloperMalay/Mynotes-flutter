import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mynotes/servides/cloud/cloud_note.dart';
import 'package:mynotes/servides/cloud/cloud_storage_exception.dart';
import 'package:mynotes/servides/cloud/cloud_stroage_constants.dart';

class FirebaseCloudStroage {
  final notes = FirebaseFirestore.instance.collection("notes");

  Future<void> deletenote({required String documentId}) async {
    try {
      notes.doc(documentId).delete();
    } catch (e) {
      throw CouldNotDeleteNoteException();
    }
  }

  Future<void> updateNote({
    required String documentId,
    required String text,
  }) async {
    try {
      await notes.doc(documentId).update({textFieldName: text});
    } catch (e) {
      throw CouldNotUpdateNoteException();
    }
  }

  Stream<Iterable<CloudNote>> allNotes({required String ownerUserId}) =>
      notes.snapshots().map((event) => event.docs
          .map((doc) => CloudNote.fromSnapshot(doc))
          .where((note) => note.ownerUserId == ownerUserId));

  Future<Iterable<CloudNote>> getNotes({required String ownerUserId}) async {
    try {
      return await notes
          .where(ownerUserIdFieldName, isEqualTo: ownerUserId)
          .get()
          .then(
            (value) => value.docs.map(
              (doc) {
                return CloudNote(
                  documentId: doc.id,
                  ownerUserId: doc.data()[ownerUserIdFieldName] as String,
                  text: doc.data()[textFieldName] as String,
                );
              },
            ),
          );
    } catch (e) {
      throw CouldNotGetAllNotesException();
    }
  }

  void createNewNote({required String ownerUserID}) async {
    await notes.add({
      ownerUserIdFieldName: ownerUserID,
      textFieldName: '',
    });
  }

  static final FirebaseCloudStroage _shared =
      FirebaseCloudStroage._sharedInstance();
  FirebaseCloudStroage._sharedInstance();
  factory FirebaseCloudStroage() => _shared;
}