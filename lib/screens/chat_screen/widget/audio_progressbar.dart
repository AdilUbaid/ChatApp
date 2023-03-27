// import 'package:audio_waveforms/audio_waveforms.dart';
// import 'package:chitchat/screens/constants.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter/src/widgets/placeholder.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// // import 'package:audio_waveforms/audio_waveforms.dart';

// class AudioProgressbar extends StatefulWidget {
//   const AudioProgressbar({super.key});

//   @override
//   State<AudioProgressbar> createState() => _AudioProgressbarState();
// }

// class _AudioProgressbarState extends State<AudioProgressbar> {


//   final RecorderController recorderController = RecorderController()
//     ..androidEncoder = AndroidEncoder.aac
//     ..androidOutputFormat = AndroidOutputFormat.mpeg4
//     ..iosEncoder = IosEncoder.kAudioFormatMPEG4AAC
//     ..sampleRate = 44100;



//   @override
//   Widget build(BuildContext context) {
//     return AudioWaveforms(
//       shouldCalculateScrolledPosition: true,
//       enableGesture: true,
//       size: Size(MediaQuery.of(context).size.width / 2, 50),
//       recorderController: recorderController,
//       waveStyle: WaveStyle(
//         showDurationLabel: true,
//         waveColor: Colors.white,
//         extendWaveform: true,
//         showMiddleLine: false,
//       ),
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(15.r),
//         color: orangeColor,
//       ),
//       padding: const EdgeInsets.only(left: 18),
//       margin: const EdgeInsets.symmetric(horizontal: 15),
//     );
//   }
// }
