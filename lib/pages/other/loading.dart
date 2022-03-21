import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:proflu/common/values/colors.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: SpinKitFadingCircle(
        color: ProfluC.themeColor,
        size: 80.0,
      ),
    );
  }
}

// SpinKitRotatingCircle(color: Colors.white)
// SpinKitRotatingPlain(color: Colors.white)
// SpinKitChasingDots(color: Colors.white)
// SpinKitPumpingHeart(color: Colors.white)
// SpinKitPulse(color: Colors.white)
// SpinKitDoubleBounce(color: Colors.white)
// SpinKitWave(color: Colors.white, type: SpinKitWaveType.start)
// SpinKitWave(color: Colors.white, type: SpinKitWaveType.center)
// SpinKitWave(color: Colors.white, type: SpinKitWaveType.end)
// SpinKitThreeBounce(color: Colors.white)
// SpinKitWanderingCubes(color: Colors.white)
// SpinKitWanderingCubes(color: Colors.white, shape: BoxShape.circle)
// SpinKitCircle(color: Colors.white)
// SpinKitFadingFour(color: Colors.white)
// SpinKitFadingFour(color: Colors.white, shape: BoxShape.rectangle)
// SpinKitFadingCube(color: Colors.white)
// SpinKitCubeGrid(size: 51.0, color: Colors.white)
// SpinKitFoldingCube(color: Colors.white)
// SpinKitRing(color: Colors.white)
// SpinKitDualRing(color: Colors.white)
// SpinKitRipple(color: Colors.white)
// SpinKitFadingGrid(color: Colors.white)
// SpinKitFadingGrid(color: Colors.white, shape: BoxShape.rectangle)
// SpinKitHourGlass(color: Colors.white)
// SpinKitSpinningCircle(color: Colors.white)
// SpinKitSpinningCircle(color: Colors.white, shape: BoxShape.rectangle)
// SpinKitFadingCircle(color: Colors.white)
// SpinKitPouringHourglass(color: Colors.white)

