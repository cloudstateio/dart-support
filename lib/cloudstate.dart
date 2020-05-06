/// More dartdocs go here.
library cloudstate;

export 'package:logger/logger.dart';
export 'src/base.dart';
export 'src/crdt.dart';
export 'src/event_sourced.dart';
export 'src/generated/protocol/google/protobuf/descriptor.pb.dart';

import 'package:cloudstate/src/base.dart';
import 'package:cloudstate/src/event_sourced.dart';
import 'package:cloudstate/src/stateless.dart';
import 'package:logger/logger.dart';
import 'package:cloudstate/src/services.dart';

class Cloudstate {
  final Map<String, CloudstateService> services = {};

  final _logger = Logger(
    filter: CloudstateLogFilter(Level.verbose),
    printer: LogfmtPrinter(),
    output: SimpleConsoleOutput(),
  );

  int port;
  String address;
  Config _config;

  Cloudstate registerStatelessEntity(String serviceName, Type entity) {
    _logger.d('Registering StatelessEntity...');

    if (entity == null) {
      throw ArgumentError('type: $entity');
    }

    _config = Config(port, address, Level.verbose);
    services[serviceName] = StatelessEntityService(serviceName, entity);
    return this;
  }

  Cloudstate registerEventSourcedEntity(String serviceName, Type entity) {
    _logger.d('Registering EventSourcedEntity...');

    if (entity == null) {
      throw ArgumentError('type: $entity');
    }

    _config = Config(port, address, Level.verbose);
    services[serviceName] = EventSourcedStatefulService(serviceName, entity, 1);
    return this;
  }

  Future<void> start([Config config]) {
    if (config == null) {
      return CloudstateRunner(_config, services).start();
    }
    return CloudstateRunner(config, services).start();
  }
}

