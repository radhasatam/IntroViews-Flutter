import 'package:flutter/material.dart';
import 'package:intro_screens/Models/page_view_model.dart';

/// This is the class which contains the Page UI.
class Page extends StatelessWidget {
  ///page details
  final PageViewModel pageViewModel;

  ///percent visible of page
  final double percentVisible;

  /// [MainAxisAligment]
  final MainAxisAlignment columnMainAxisAlignment;

  //Constructor
  Page({
    this.pageViewModel,
    this.percentVisible = 1.0,
    this.columnMainAxisAlignment = MainAxisAlignment.spaceEvenly,
  });

  @override
  Widget build(BuildContext context) {
    return new Container(
      // padding: const EdgeInsets.all(8.0),
      width: double.infinity,
      color: pageViewModel.pageColor,
      child: new Opacity(
        //Opacity is used to create fade in effect
        opacity: percentVisible,
        child: new OrientationBuilder(
            builder: (BuildContext context, Orientation orientation) {
          return orientation == Orientation.portrait
              ? _buildPortraitPage()
              : _buildPortraitPage();
        }), //OrientationBuilder
      ),
    );
  }

  /// when device is Portrait place title, image and body in a column
  Widget _buildPortraitPage() {
    return new Column(
      children: <Widget>[
        Text("FUCK YOU"),
        _ImagePageTransform(
          percentVisible: percentVisible,
          pageViewModel: pageViewModel,
        ),
        _TitlePageTransform(
          percentVisible: percentVisible,
          pageViewModel: pageViewModel,
        ),
        _BodyPageTransform(
          percentVisible: percentVisible,
          pageViewModel: pageViewModel,
        ),
      ],
    );
  }

  /// if Device is Landscape reorder with row and column
  Widget __buildLandscapePage() {
    return new Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        Expanded(
          child: new _ImagePageTransform(
            percentVisible: percentVisible,
            pageViewModel: pageViewModel,
          ),
        ), //Transform

        new Flexible(
          child: new Column(
            mainAxisAlignment: columnMainAxisAlignment,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              new _TitlePageTransform(
                percentVisible: percentVisible,
                pageViewModel: pageViewModel,
              ), //Transform
              new _BodyPageTransform(
                percentVisible: percentVisible,
                pageViewModel: pageViewModel,
              ), //Transform
            ],
          ), // Column
        ),
      ],
    );
  }
}

/// Body for the Page.
class _BodyPageTransform extends StatelessWidget {
  final double percentVisible;

  final PageViewModel pageViewModel;

  const _BodyPageTransform({
    Key key,
    @required this.percentVisible,
    @required this.pageViewModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle.merge(
      style: pageViewModel.bodyTextStyle,
      textAlign: TextAlign.center,
      child: pageViewModel.body,
    );
  }
}

/// Main Image of the Page
class _ImagePageTransform extends StatelessWidget {
  final double percentVisible;

  final PageViewModel pageViewModel;

  const _ImagePageTransform({
    Key key,
    @required this.percentVisible,
    @required this.pageViewModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: pageViewModel.mainImage, //Loading main
    ); //Container
  }
}

/// Title for the Page
class _TitlePageTransform extends StatelessWidget {
  final double percentVisible;

  final PageViewModel pageViewModel;

  const _TitlePageTransform({
    Key key,
    @required this.percentVisible,
    @required this.pageViewModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new DefaultTextStyle(
      style: pageViewModel.titleTextStyle,
      child: pageViewModel.title,
    );
  }
}
