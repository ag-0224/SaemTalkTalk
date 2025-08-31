import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:saem_talk_talk/features/company/data_source/remote/models/company_model.dart';
import 'package:saem_talk_talk/features/company/data_source/remote/models/department_model.dart';
import 'package:saem_talk_talk/features/company/data_source/remote/models/position_model.dart';

abstract class FirestoreCompaniesRef {
  static const String _collection = 'company';

  static CollectionReference<CompanyModel> collection() {
    return FirebaseFirestore.instance.collection(_collection).withConverter(
          fromFirestore: CompanyModel.fromFirestore,
          toFirestore: CompanyModel.toFirestore,
        );
  }

  static DocumentReference<CompanyModel> doc(String id) {
    return FirebaseFirestore.instance
        .collection(_collection)
        .doc(id)
        .withConverter(
          fromFirestore: CompanyModel.fromFirestore,
          toFirestore: CompanyModel.toFirestore,
        );
  }
}

abstract class FirestoreDepartmentsRef {
  static const String name = 'department';

  static CollectionReference<DepartmentModel> collection(String companyId) =>
      FirestoreCompaniesRef.doc(companyId).collection(name).withConverter(
            fromFirestore: DepartmentModel.fromFirestore,
            toFirestore: (value, options) => value.toJson(),
          );

  static DocumentReference<DepartmentModel> doc(String companyId, String id) =>
      FirestoreCompaniesRef.doc(companyId)
          .collection(name)
          .doc(id)
          .withConverter(
            fromFirestore: DepartmentModel.fromFirestore,
            toFirestore: (value, options) => value.toJson(),
          );
}

abstract class FirestorePositionsRef {
  static const String name = 'position';

  static CollectionReference<PositionModel> collection(String companyId) =>
      FirestoreCompaniesRef.doc(companyId).collection(name).withConverter(
        fromFirestore: PositionModel.fromFirestore,
        toFirestore: (value, options) => value.toJson(),
      );

  static DocumentReference<PositionModel> doc(String companyId, String id) =>
      FirestoreCompaniesRef.doc(companyId)
          .collection(name)
          .doc(id)
          .withConverter(
        fromFirestore: PositionModel.fromFirestore,
        toFirestore: (value, options) => value.toJson(),
      );
}
