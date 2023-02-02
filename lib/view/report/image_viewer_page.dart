import '/res/theme/colors/light_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ImageViewerPage extends StatefulWidget {
  //TODO: implement hero when opening
  static const String routeName = '/image-viewer';

  final ImageProvider? imageProvider;

  final double minScale;

  final double maxScale;

  final bool doubleTapZoomable;

  final void Function(double)? onScaleChanged;

  /// Create a new instance
  /// The optional [doubleTapZoomable] boolean defaults to false and allows double tap to zoom.
  const ImageViewerPage({
    Key? key,
    this.imageProvider,
    this.minScale = 1.0,
    this.maxScale = 5.0,
    this.doubleTapZoomable = false,
    this.onScaleChanged,
  }) : super(key: key);

  @override
  _ImageViewerPageState createState() => _ImageViewerPageState();
}

class _ImageViewerPageState extends State<ImageViewerPage>
    with SingleTickerProviderStateMixin {
  final TransformationController _transformationController =
      TransformationController();

  TapDownDetails _doubleTapDetails = TapDownDetails();
  late AnimationController _animationController;
  Animation<Matrix4>? _doubleTapAnimation;

  @override
  void initState() {
    _animationController = AnimationController(
        duration: const Duration(milliseconds: 200), vsync: this);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    const Image image = Image(image: AssetImage('assets/image3.jpeg'));
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          SizedBox.expand(
              key: const Key('easy_image_sized_box'),
              child: InteractiveViewer(
                key: const Key('easy_image_interactive_viewer'),
                transformationController: _transformationController,
                minScale: widget.minScale,
                maxScale: widget.maxScale,
                child: widget.doubleTapZoomable
                    ? GestureDetector(
                        onDoubleTapDown: _handleDoubleTapDown,
                        onDoubleTap: _handleDoubleTap,
                        child: image)
                    : image,
                onInteractionEnd: (scaleEndDetails) {
                  double scale =
                      _transformationController.value.getMaxScaleOnAxis();

                  if (widget.onScaleChanged != null) {
                    widget.onScaleChanged!(scale);
                  }
                },
              )),
          Padding(
            padding: const EdgeInsets.all(defaultMargin),
            child: Row(
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.close,
                      color: LightColors.kWhiteColor,
                    )),
                const Spacer(),
                IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.share,
                      color: LightColors.kWhiteColor,
                    )),
              ],
            ),
          ),
          Align(
              alignment: Alignment.bottomCenter,
              child: FittedBox(
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: defaultMargin / 4),
                  width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(
                      color: LightColors.kBackgroundColor,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(defaultMargin),
                          topRight: Radius.circular(defaultMargin))),
                  child: Column(
                    children: [
                      ListTile(
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: defaultMargin),
                        leading: const Icon(
                          Icons.schedule,
                          color: LightColors.kPrimaryColor,
                        ),
                        title: Text(
                          'Date Time',
                          style: LightColors.subTitle2TextStyle,
                        ),
                        subtitle: Text(
                          '23 Desember 2024  -  10:38',
                          style: LightColors.blackTextStyle,
                        ),
                      ),
                      Material(
                        child: ListTile(
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: defaultMargin),
                          onTap: () {},
                          leading: const Icon(
                            Icons.near_me,
                            color: LightColors.kPrimaryColor,
                          ),
                          title: Text(
                            'Longitude & Latitude',
                            style: LightColors.subTitle2TextStyle,
                          ),
                          subtitle: Text(
                            '(48.276791, 13.161050)',
                            style: LightColors.blackTextStyle,
                          ),
                          trailing: Icon(Icons.chevron_right),
                        ),
                      ),
                    ],
                  ),
                ),
              ))
        ],
      ),
    );
  }

  void _handleDoubleTapDown(TapDownDetails details) {
    _doubleTapDetails = details;
  }

  void _handleDoubleTap() {
    _doubleTapAnimation?.removeListener(_animationListener);
    _doubleTapAnimation?.removeStatusListener(_animationStatusListener);

    double scale = _transformationController.value.getMaxScaleOnAxis();

    if (scale < 2.0) {
      // If we are not at a 2x scale yet, zoom in all the way to 2x.
      final position = _doubleTapDetails.localPosition;
      final begin = _transformationController.value;
      final end = Matrix4.identity()
        ..translate(-position.dx, -position.dy)
        ..scale(2.0);

      _updateDoubleTapAnimation(begin, end);
      _animationController.forward(from: 0.0);
    } else {
      // If we are zoomed in at 2x or more, zoom all the way out
      final begin = Matrix4.identity();
      final end = _transformationController.value;

      _updateDoubleTapAnimation(begin, end);

      _animationController.reverse(from: scale - 1.0);
    }
  }

  void _updateDoubleTapAnimation(Matrix4 begin, Matrix4 end) {
    _doubleTapAnimation = Matrix4Tween(begin: begin, end: end).animate(
        CurveTween(curve: Curves.easeInOut).animate(_animationController));
    _doubleTapAnimation?.addListener(_animationListener);
    _doubleTapAnimation?.addStatusListener(_animationStatusListener);
  }

  void _animationListener() {
    _transformationController.value =
        _doubleTapAnimation?.value ?? Matrix4.identity();
  }

  void _animationStatusListener(AnimationStatus status) {
    if (status == AnimationStatus.completed ||
        status == AnimationStatus.dismissed) {
      double scale = _transformationController.value.getMaxScaleOnAxis();

      if (widget.onScaleChanged != null) {
        widget.onScaleChanged!(scale);
      }
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
