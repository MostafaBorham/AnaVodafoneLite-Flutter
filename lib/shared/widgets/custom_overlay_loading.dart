import 'package:flutter/material.dart';
import 'package:loader_overlay/loader_overlay.dart';

class CustomOverlayLoading extends StatelessWidget {
  const CustomOverlayLoading({Key? key, required this.customChild}) : super(key: key);

  final Widget customChild;
  @override
  Widget build(BuildContext context) {
    return LoaderOverlay(useDefaultLoading: false,
      disableBackButton: true,
      overlayColor: Colors.black,
      overlayOpacity: 0.7,
      overlayWidget: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 50,
                width: 50,
                child: CircularProgressIndicator(color: Colors.white,strokeWidth: 5)),
            SizedBox(height: 30,),
            Text('Loading, please wait',style: Theme.of(context).textTheme.titleMedium?.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.w400
            ),)
          ],
        ),
      ),
      child: customChild,
    );
  }
}
