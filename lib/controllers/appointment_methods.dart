import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mahad_s_application3/models/appointment_model.dart';

class AppointmentMethods extends ChangeNotifier {
  final CollectionReference _appointmentsCollection =
      FirebaseFirestore.instance.collection('appointments');

  List<AppointmentModel> _appointments = [];

  Future<AppointmentModel> getAppointmentById(String appointmentId) async {
    try {
      final doc = await _appointmentsCollection.doc(appointmentId).get();
      AppointmentModel appointment = AppointmentModel.fromDoc(doc);
      return appointment;
    } catch (e) {
      print('Error getting appointment by id: $e');
    }
    notifyListeners();
    return AppointmentModel();
  }

  Future<void> createAppointment(AppointmentModel appointment) async {
    try {
      final docRef = await _appointmentsCollection.add(appointment.toJson());
      final appointmentId = docRef.id;
      appointment.id = appointmentId;
    } catch (e) {
      print('Error creating appointment: $e');
    }
    notifyListeners();
  }

  Future<void> updateAppointment(
      String appointmentId, AppointmentModel appointment) async {
    try {
      await _appointmentsCollection
          .doc(appointmentId)
          .update(appointment.toJson());
    } catch (e) {
      print('Error updating appointment: $e');
    }
    notifyListeners();
  }

  Future<void> deleteAppointment(String appointmentId) async {
    try {
      await _appointmentsCollection.doc(appointmentId).delete();

      for (var appointment in _appointments) {
        if (appointment.id == appointmentId) {
          _appointments.remove(appointment);
          break;
        }
      }
    } catch (e) {
      print('Error deleting appointment: $e');
    }
    notifyListeners();
  }

  Stream<List<AppointmentModel>> getAppointments() {
    return _appointmentsCollection.snapshots().map((snapshot) {
      return snapshot.docs.map((doc) => AppointmentModel.fromDoc(doc)).toList();
    });
  }

  Future<List<AppointmentModel>> getAppointmentsByUserId(String userId) async {
    try {
      final snapshot = await _appointmentsCollection
          .where('userId', isEqualTo: userId)
          .get() as QuerySnapshot<Map<String, dynamic>>;
      _appointments = snapshot.docs
          .map((doc) => AppointmentModel.fromMap(doc.data()))
          .toList();
    } catch (e) {
      print('Error getting appointments by user id: $e');
    }
    notifyListeners();
    return _appointments;
  }

  Future<List<AppointmentModel>> getAppointmentsByShopId(String shopId) async {
    try {
      final snapshot = await _appointmentsCollection
          .where('shopId', isEqualTo: shopId)
          .get() as QuerySnapshot<Map<String, dynamic>>;
      _appointments = snapshot.docs
          .map((doc) => AppointmentModel.fromMap(doc.data()))
          .toList();
    } catch (e) {
      print('Error getting appointments by shop id: $e');
    }
    notifyListeners();
    return _appointments;
  }
}
