import 'package:cloudstate/src/services.dart';

class StatelessEntityService implements CloudstateService {

  String service;
  Type userEntity;

  StatelessEntityService(String service, Type userEntity){
    this.service = service;
    this.userEntity = userEntity;
  }

  @override
  Type entity() {
    // TODO: implement entity
    return null;
  }

  @override
  String entityType() {
    // TODO: implement entityType
    return null;
  }

  @override
  String persistenceId() {
    // TODO: implement persistenceId
    return null;
  }

  @override
  String serviceName() {
    // TODO: implement serviceName
    return null;
  }
}
