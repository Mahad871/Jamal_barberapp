import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mahad_s_application3/models/services_model.dart';

class ServiceMethods with ChangeNotifier {
  List<ServiceModel> _services = [];

  List<ServiceModel> get services => _services;
  final db = FirebaseFirestore.instance;
  Future<ServiceModel> getService(String serviceId) async {
    try {
      final serviceSnapshot =
          await db.collection('services').doc(serviceId).get();
      final service = ServiceModel.fromJson(serviceSnapshot.data()!);
      return service;
    } catch (error) {
      // Handle error
      print(error); // Example: Print the error message
      rethrow;
    }
  }

  Future<List<ServiceModel>> getServicebyShopID(String shopID) async {
    List<ServiceModel> s = [];
    try {
      final serviceSnapshot = await db
          .collection('services')
          .where('shopID', isEqualTo: shopID)
          .get();
      s = serviceSnapshot.docs
          .map((doc) => ServiceModel.fromJson(doc.data()))
          .toList();
      notifyListeners();
    } catch (error) {}
    return s;
  }

  Future<List<ServiceModel>> getAllServices() async {
    try {
      final servicesSnapshot = await db.collection('services').get();
      _services = servicesSnapshot.docs
          .map((doc) => ServiceModel.fromJson(doc.data()))
          .toList();
      notifyListeners();
    } catch (error) {
      // Handle error
    }
    return _services;
  }

  Future<List<ServiceModel>> getServicesforShop(String shopId) async {
    try {
      final servicesSnapshot = await db
          .collection('services')
          .where('shopID', isEqualTo: shopId)
          .get();
      _services = servicesSnapshot.docs
          .map((doc) => ServiceModel.fromJson(doc.data()))
          .toList();
      notifyListeners();
    } catch (error) {
      // Handle error
    }
    return _services;
  }

  Future<void> addService(ServiceModel service) async {
    try {
      DocumentReference docRef =
          await db.collection('services').add(service.toJson());
      String serviceId = docRef.id;
      service.id = serviceId;
      updateService(service); // Assign the document ID to the id variable
      _services.add(service);
      notifyListeners();
    } catch (error) {
      // Handle error
    }
  }

  Future<void> updateService(ServiceModel service) async {
    try {
      await db.collection('services').doc(service.id).update(service.toJson());
      final serviceIndex = _services.indexWhere((s) => s.id == service.id);
      if (serviceIndex >= 0) {
        _services[serviceIndex] = service;
        notifyListeners();
      }
    } catch (error) {
      // Handle error
    }
  }

  Future<void> removeService(String serviceId) async {
    try {
      await db.collection('services').doc(serviceId).delete();
      _services.removeWhere((service) => service.id == serviceId);

      notifyListeners();
    } catch (error) {
      // Handle error
    }
  }
}
