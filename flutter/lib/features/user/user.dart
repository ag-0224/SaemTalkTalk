import 'package:saem_talk_talk/app/di/app_binding.dart';
import 'package:saem_talk_talk/features/user/data_source/remote/user_remote_data_source.dart';
import 'package:saem_talk_talk/features/user/repositories/user_repository.dart';
import 'package:saem_talk_talk/features/user/usecases/create_user_use_case.dart';
import 'package:saem_talk_talk/features/user/usecases/get_user_use_case.dart';

export 'package:saem_talk_talk/features/user/data_source/remote/user_remote_data_source.dart';
export 'package:saem_talk_talk/features/user/data_source/remote/user_remote_data_source_impl.dart';
export 'package:saem_talk_talk/features/user/repositories/user_repository.dart';
export 'package:saem_talk_talk/features/user/repositories/user_repository_impl.dart';
export 'package:saem_talk_talk/features/user/data_source/remote/models/user_model.dart';
export 'package:saem_talk_talk/features/user/repositories/entities/user_entity.dart';
export 'package:saem_talk_talk/features/user/usecases/create_user_use_case.dart';
export 'package:saem_talk_talk/features/user/usecases/get_user_use_case.dart';
export 'user.dart';

final userRemoteDataSource = locator<UserRemoteDataSource>();
final userRepository = locator<UserRepository>();
final getUserUseCase = locator<GetUserDataUseCase>();
final createUserUseCase = locator<CreateUserUseCase>();