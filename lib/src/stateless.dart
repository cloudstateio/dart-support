import 'dart:mirrors';

import 'package:cloudstate/src/services.dart';

class StatelessEntityService implements CloudstateService {
  static const String entity_type =
      'cloudstate.function.StatelessFunction';

  String service;
  Type userEntity;
  DeclarationMirror _mirror;

  StatelessEntityService(String service, Type userEntity){
    this.service = service;
    this.userEntity = userEntity;
    _mirror = reflectClass(userEntity);

    var statelessEntityAnnotationMirror = reflectClass(StatelessEntity);
    final statelessEntityAnnotationInstanceMirror = _mirror.metadata.firstWhere(
            (d) => d.type == statelessEntityAnnotationMirror,
        orElse: () => null);

    if (statelessEntityAnnotationInstanceMirror == null) {
      throw Exception('Entity ${_mirror.simpleName} does not contain the annotation StatelessEntity');
    }
  }

  @override
  Type entity() {
    return userEntity;
  }

  @override
  String entityType() {
    return entity_type;
  }

  @override
  String persistenceId() {
    return null;
  }

  @override
  String serviceName() {
    return service;
  }
}

class StatelessEntityHandler {
}

class StatelessEntityHandlerFactory {
  static StatelessEntityHandler getOrCreate(StatelessEntityService service) {

  }
}

class StatelessEntity {}

class StatelessCommandHandler {
  final String name;
  final bool unary;
  final bool streamed;
  final bool stream_in;
  final bool stream_out;
  const StatelessCommandHandler(
      [
        this.name = '',
        this.unary = true,
        this.streamed = false,
        this.stream_in = false,
        this.stream_out = false
      ]);
}