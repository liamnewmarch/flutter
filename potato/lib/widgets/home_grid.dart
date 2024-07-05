import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomeGridGap {
  const HomeGridGap({
    this.horizontal = 0.0,
    this.vertical = 0.0,
  });
  final double horizontal;
  final double vertical;
}

class HomeGrid extends StatelessWidget {
  const HomeGrid({
    required this.children,
    required this.columnsToTry,
    required this.crossAxisItemExtent,
    this.gap = const HomeGridGap(horizontal: 0.0, vertical: 0.0),
    super.key,
  });

  final List<Widget> children;
  final List<int> columnsToTry;
  final double crossAxisItemExtent;
  final HomeGridGap gap;

  int getNumColumns(double containerWidth, double columnWidth) {
    for (final column in columnsToTry) {
      if (containerWidth >= columnWidth * column) {
        return column;
      }
    }
    return columnsToTry.last;
  }

  List<List<Widget>> buildRows(BoxConstraints constraints, double columnWidth) {
    final int columnCount = getNumColumns(constraints.maxWidth, columnWidth);
    final List<List<Widget>> rows = [];
    for (final child in children) {
      List<Widget>? row = rows.lastOrNull;
      if (row == null || row.length >= columnCount) {
        rows.add(row = []);
      }
      row.add(child);
    }
    return rows;
  }

  @override
  Widget build(BuildContext context) {
    final double columnWidth = crossAxisItemExtent + gap.horizontal;
    return ConstrainedBox(
      constraints: BoxConstraints(maxWidth: columnWidth * columnsToTry.first),
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          final List<List<Widget>> rows = buildRows(constraints, columnWidth);
          return Column(
            children: [
              for (final List<Widget> row in rows)
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    for (final Widget child in row)
                      Flexible(
                        child: Container(
                          padding: EdgeInsets.only(
                            bottom: row == rows.last ? 0 : gap.vertical,
                            right: child == row.last ? 0 : gap.horizontal,
                          ),
                          child: Center(child: child),
                        ),
                      ),
                  ],
                ),
            ],
          );
        },
      ),
    );
  }
}
