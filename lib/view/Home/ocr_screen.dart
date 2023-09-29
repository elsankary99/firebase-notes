import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class OCRScreen extends ConsumerWidget {
  const OCRScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(child: const Center(child: Text("OcR")));
  }
}
