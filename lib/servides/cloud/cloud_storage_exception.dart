import 'package:flutter/material.dart';

@immutable
class CloudStorageException implements Exception {
  const CloudStorageException();
}

//C in CURD
class CouldNotCreateNoteException extends CloudStorageException {}

// R in CURD
class CouldNotGetAllNotesException extends CloudStorageException {}

//U in CURD
class CouldNotUpdateNoteException extends CloudStorageException {}

//D in CURD
class CouldNotDeleteNoteException extends CloudStorageException {}
