import 'package:spot/core/services/location_service.dart';

String mapLocationErrorToMessage(Object error) {
  if (error is LocationServiceException) {
    return 'Location services are disabled, please enable them to continue';
  }
  if (error is LocationPermissionException) {
    return 'Location permission is required, please allow it from app settings';
  }
  return 'Something went wrong while getting your location, please try again';
}
