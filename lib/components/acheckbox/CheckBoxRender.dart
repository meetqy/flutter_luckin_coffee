import 'package:flutter/material.dart';
import 'dart:math' as math;

class CheckBoxRender extends StatefulWidget {
  CheckBoxRender({
    Key key,
    @required this.value,
    this.tristate = false,
    @required this.onChanged,
    this.activeColor,
    this.checkColor,
    this.materialTapTargetSize,
    this.width = 18.0,
    this.strokeWidth = 2.0,
    this.radius
  }) : assert(tristate != null),
       assert(tristate || value != null),
       super(key: key);
  final bool value;
  final ValueChanged<bool> onChanged;
  final Color activeColor;

  final Color checkColor;

  final double width;
  final Radius radius;
  final double strokeWidth;

  final bool tristate;

  final MaterialTapTargetSize materialTapTargetSize;

  @override
  _CheckboxState createState() => _CheckboxState();
}

class _CheckboxState extends State<CheckBoxRender> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    assert(debugCheckHasMaterial(context));
    final ThemeData themeData = Theme.of(context);
    Size size;
    switch (widget.materialTapTargetSize ?? themeData.materialTapTargetSize) {
      case MaterialTapTargetSize.padded:
        size = const Size(2 * kRadialReactionRadius + 8.0, 2 * kRadialReactionRadius + 8.0);
        break;
      case MaterialTapTargetSize.shrinkWrap:
        size = const Size(2 * kRadialReactionRadius, 2 * kRadialReactionRadius);
        break;
    }
    final BoxConstraints additionalConstraints = BoxConstraints.tight(size);
    return _CheckboxRenderObjectWidget(
      value: widget.value,
      tristate: widget.tristate,
      activeColor: widget.activeColor ?? themeData.toggleableActiveColor,
      checkColor: widget.checkColor ?? const Color(0xFFFFFFFF),
      inactiveColor: widget.onChanged != null ? themeData.unselectedWidgetColor : themeData.disabledColor,
      onChanged: widget.onChanged,
      additionalConstraints: additionalConstraints,
      vsync: this,
      kEdgeRadius: widget.radius == null ? Radius.circular(2) : widget.radius,
      kStrokeWidth: widget.strokeWidth,
      kEdgeSize: widget.width
    );
  }
}

class _CheckboxRenderObjectWidget extends LeafRenderObjectWidget {
  const _CheckboxRenderObjectWidget({
    Key key,
    @required this.value,
    @required this.tristate,
    @required this.activeColor,
    @required this.checkColor,
    @required this.inactiveColor,
    @required this.onChanged,
    @required this.vsync,
    @required this.additionalConstraints,
    @required this.kEdgeSize,
    @required this.kEdgeRadius,
    @required this.kStrokeWidth,
  }) : assert(tristate != null),
       assert(tristate || value != null),
       assert(activeColor != null),
       assert(inactiveColor != null),
       assert(vsync != null),
       super(key: key);

  final bool value;
  final bool tristate;
  final Color activeColor;
  final Color checkColor;
  final Color inactiveColor;
  final ValueChanged<bool> onChanged;
  final TickerProvider vsync;
  final BoxConstraints additionalConstraints;
  final double kEdgeSize;
  final Radius kEdgeRadius;
  final double kStrokeWidth;

  @override
  _RenderCheckbox createRenderObject(BuildContext context) => _RenderCheckbox(
    value: value,
    tristate: tristate,
    activeColor: activeColor,
    checkColor: checkColor,
    inactiveColor: inactiveColor,
    onChanged: onChanged,
    vsync: vsync,
    additionalConstraints: additionalConstraints,
    kEdgeSize: kEdgeSize,
    kStrokeWidth: kStrokeWidth,
    kEdgeRadius: kEdgeRadius
  );

  @override
  void updateRenderObject(BuildContext context, _RenderCheckbox renderObject) {
    renderObject
      ..value = value
      ..tristate = tristate
      ..activeColor = activeColor
      ..checkColor = checkColor
      ..inactiveColor = inactiveColor
      ..onChanged = onChanged
      ..additionalConstraints = additionalConstraints
      ..vsync = vsync;
  }
}

class _RenderCheckbox extends RenderToggleable {
  _RenderCheckbox({
    bool value,
    bool tristate,
    Color activeColor,
    this.checkColor,
    Color inactiveColor,
    BoxConstraints additionalConstraints,
    ValueChanged<bool> onChanged,
    @required TickerProvider vsync,
    @required this.kEdgeSize,
    @required this.kEdgeRadius,
    @required this.kStrokeWidth
  }) : _oldValue = value,
       super(
         value: value,
         tristate: tristate,
         activeColor: activeColor,
         inactiveColor: inactiveColor,
         onChanged: onChanged,
         additionalConstraints: additionalConstraints,
         vsync: vsync,
       );

  final double kEdgeSize;   
  final Radius kEdgeRadius;   
  final double kStrokeWidth;   

  bool _oldValue;
  Color checkColor;

  @override
  set value(bool newValue) {
    if (newValue == value)
      return;
    _oldValue = value;
    super.value = newValue;
  }

  @override
  void describeSemanticsConfiguration( config) {
    super.describeSemanticsConfiguration(config);
    config.isChecked = value == true;
  }

  RRect _outerRectAt(Offset origin, double t) {
    final double inset = 1.0 - (t - 0.5).abs() * 2.0;
    final double size = kEdgeSize - inset * kStrokeWidth;
    final Rect rect = Rect.fromLTWH(origin.dx + inset, origin.dy + inset, size, size);
    return RRect.fromRectAndRadius(rect, kEdgeRadius);
  }

  // The checkbox's border color if value == false, or its fill color when
  // value == true or null.
  Color _colorAt(double t) {
    // As t goes from 0.0 to 0.25, animate from the inactiveColor to activeColor.
    return onChanged == null
      ? inactiveColor
      : (t >= 0.25 ? activeColor : Color.lerp(inactiveColor, activeColor, t * 4.0));
  }

  // White stroke used to paint the check and dash.
  void _initStrokePaint(Paint paint) {
    paint
      ..color = checkColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = kStrokeWidth;
  }

  void _drawBorder(Canvas canvas, RRect outer, double t, Paint paint) {
    assert(t >= 0.0 && t <= 0.5);
    final double size = outer.width;
    // As t goes from 0.0 to 1.0, gradually fill the outer RRect.
    final RRect inner = outer.deflate(math.min(size / 2.0, kStrokeWidth + size * t));
    canvas.drawDRRect(outer, inner, paint);
  }

  void _drawCheck(Canvas canvas, Offset origin, double t, Paint paint) {
    assert(t >= 0.0 && t <= 1.0);
    // As t goes from 0.0 to 1.0, animate the two check mark strokes from the
    // short side to the long side.
    final Path path = Path();
    final Offset start = Offset(kEdgeSize * 0.15, kEdgeSize * 0.45);
    final Offset mid = Offset(kEdgeSize * 0.4, kEdgeSize * 0.7);
    final Offset end = Offset(kEdgeSize * 0.85, kEdgeSize * 0.25);
    if (t < 0.5) {
      final double strokeT = t * 2.0;
      final Offset drawMid = Offset.lerp(start, mid, strokeT);
      path.moveTo(origin.dx + start.dx, origin.dy + start.dy);
      path.lineTo(origin.dx + drawMid.dx, origin.dy + drawMid.dy);
    } else {
      final double strokeT = (t - 0.5) * 2.0;
      final Offset drawEnd = Offset.lerp(mid, end, strokeT);
      path.moveTo(origin.dx + start.dx, origin.dy + start.dy);
      path.lineTo(origin.dx + mid.dx, origin.dy + mid.dy);
      path.lineTo(origin.dx + drawEnd.dx, origin.dy + drawEnd.dy);
    }
    canvas.drawPath(path, paint);
  }

  void _drawDash(Canvas canvas, Offset origin, double t, Paint paint) {
    assert(t >= 0.0 && t <= 1.0);
    // As t goes from 0.0 to 1.0, animate the horizontal line from the
    // mid point outwards.
    final Offset start = Offset(kEdgeSize * 0.2, kEdgeSize * 0.5);
    final Offset mid = Offset(kEdgeSize * 0.5, kEdgeSize * 0.5);
    final Offset end = Offset(kEdgeSize * 0.8, kEdgeSize * 0.5);
    final Offset drawStart = Offset.lerp(start, mid, 1.0 - t);
    final Offset drawEnd = Offset.lerp(mid, end, t);
    canvas.drawLine(origin + drawStart, origin + drawEnd, paint);
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    final Canvas canvas = context.canvas;
    paintRadialReaction(canvas, offset, size.center(Offset.zero));

    final Offset origin = offset + (size / 2.0 - Size.square(kEdgeSize) / 2.0);
    final AnimationStatus status = position.status;
    final double tNormalized = status == AnimationStatus.forward || status == AnimationStatus.completed
      ? position.value
      : 1.0 - position.value;

    // Four cases: false to null, false to true, null to false, true to false
    if (_oldValue == false || value == false) {
      final double t = value == false ? 1.0 - tNormalized : tNormalized;
      final RRect outer = _outerRectAt(origin, t);
      final Paint paint = Paint()..color = _colorAt(t);

      if (t <= 0.5) {
        _drawBorder(canvas, outer, t, paint);
      } else {
        canvas.drawRRect(outer, paint);

        _initStrokePaint(paint);
        final double tShrink = (t - 0.5) * 2.0;
        if (_oldValue == null || value == null)
          _drawDash(canvas, origin, tShrink, paint);
        else
          _drawCheck(canvas, origin, tShrink, paint);
      }
    } else { // Two cases: null to true, true to null
      final RRect outer = _outerRectAt(origin, 1.0);
      final Paint paint = Paint() ..color = _colorAt(1.0);
      canvas.drawRRect(outer, paint);

      _initStrokePaint(paint);
      if (tNormalized <= 0.5) {
        final double tShrink = 1.0 - tNormalized * 2.0;
        if (_oldValue == true)
          _drawCheck(canvas, origin, tShrink, paint);
        else
          _drawDash(canvas, origin, tShrink, paint);
      } else {
        final double tExpand = (tNormalized - 0.5) * 2.0;
        if (value == true)
          _drawCheck(canvas, origin, tExpand, paint);
        else
          _drawDash(canvas, origin, tExpand, paint);
      }
    }
  }
}
