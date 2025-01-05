import 'package:return_king/shared/usecases/command.dart';
import 'package:return_king/shared/usecases/response.dart';

abstract class Usecase<C extends Command, R extends Response> {
  Future<R> execute(C command);
}
