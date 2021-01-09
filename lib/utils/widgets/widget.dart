// here we add our reusable widgets
import 'package:flutter/material.dart';

/// StreamWidget is the same as StreamBuilder but you only pass the stream and the widget that you want to build as a function (same as builder function), so you don't have to treat all the stream scenarios like weather there's an error or the stream didn't get any data yet
class StreamWidget<T> extends StatelessWidget {
  final Stream<T> stream;
  final Widget Function(BuildContext context, T data) widget;
  const StreamWidget({
    this.stream,
    this.widget,
  });

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<T>(
      stream: stream,
      builder: (context, snapshot) {
        if (snapshot.hasData)
          return widget(context, snapshot.data);
        else if (snapshot.hasError)
          return Center(
            child: Text("Error while loading data:\n${snapshot.error}"),
          );
        else
          return Center(
            child: CircularProgressIndicator(),
          );
      },
    );
  }
}

/// FutureWidget is the same as FutureBuilder but you only pass the stream and the widget that you want to build as a function (same as builder function), so you don't have to treat all the future scenarios like whether there's an error or the future didn't get any data yet
class FutureWidget<T> extends StatelessWidget {
  final Future<T> future;
  final Widget Function(BuildContext context, T data) widget;
  const FutureWidget({
    this.future,
    this.widget,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<T>(
      future: future,
      builder: (context, snapshot) {
        if (snapshot.hasData)
          return widget(context, snapshot.data);
        else if (snapshot.hasError)
          return Center(
            child: Text("Error while loading data:\n${snapshot.error}"),
          );
        else
          return Center(
            child: CircularProgressIndicator(),
          );
      },
    );
  }
}
