import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mynotes/servides/cloud/cloud_stroage_constants.dart';

class CloudNote {
  final String documentId;
  final String ownerUserId;
  final String text;

  CloudNote({
    required this.documentId,
    required this.ownerUserId,
    required this.text,
  });

  CloudNote.fromSnapshot(QueryDocumentSnapshot<Map<String, dynamic>> snapshot)
      : documentId = snapshot.id,
        ownerUserId = snapshot.data()[ownerUserIdFieldName],
        text = snapshot.data()[textFieldName] as String;
}