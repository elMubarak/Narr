import 'package:narr/core/services/service_exports.dart';

class ServiceInjector {
  //backend services
  ApiService apiService = ApiService();
  AuthService authService = AuthService();
  SocketService socketService = SocketService();
  UploadService uploadService = UploadService();

  //utils services
  DialogInfoService dialogInfoService = DialogInfoService();
  RouterService routerService = RouterService();
  InstitutionService institutionService = InstitutionService();
  UtilityService utilityService = UtilityService();
  PermissionService permissionService = PermissionService();
  //frontend services

  //storage
  PersistenceStorageService persistenceStorageService =
      PersistenceStorageService();
  //research
  ResearchService researchService = ResearchService();
}

ServiceInjector narrService = ServiceInjector();
