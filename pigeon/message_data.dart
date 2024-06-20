import 'package:pigeon/pigeon.dart';

@ConfigurePigeon(PigeonOptions(
  dartOut: 'lib/native_api/native_mobile_ui.g.dart',
kotlinOut: 'android/app/src/main/kotlin/com/hafizramiz/flowergame/native_api/NativeMobileUi.kt',
))

@HostApi()
abstract class NativeMobileHostApi {
  @async
  String getNativeUiResult();
}