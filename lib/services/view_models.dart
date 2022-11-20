import 'package:provider/provider.dart';

import 'package:flutter/material.dart';

/*class ProjectViewModel extends ChangeNotifier {

  Project? _project;
  // todo: name, path, remote OBJ, description

  Project? get current => _project;

  void currentProject(Project pjt) {
    _project = pjt;
    notifyListeners();
  }
}*/

/*class Project {
  final String name;

  /// The color of this fruit.
  final colors.Color color;

  final Shape shape;

  final List<String> likedBy;

  // Value getters.
  bool get isRed => this.color == colors.Color.red;
  bool get isNotRed => this.color != colors.Color.red;
  bool get isYellow => this.color == colors.Color.yellow;
  bool get isNotYellow => this.color != colors.Color.yellow;
  bool get isGreen => this.color == colors.Color.green;
  bool get isNotGreen => this.color != colors.Color.green;
  bool get isBrown => this.color == colors.Color.brown;
  bool get isNotBrown => this.color != colors.Color.brown;
  bool get isShapeRound => this.shape == Shape.round;
  bool get isShapeCurved => this.shape == Shape.curved;

  /// Default constructor that creates a new [Fruit] with the given
  /// attributes.
  const Project({
    @required this.name,
    @required this.color,
    @required this.shape,
    @required this.likedBy,
  })  : assert(name != null),
        assert(color != null),
        assert(shape != null),
        assert(likedBy != null);

  /// Checks if this [Fruit] is equal to the other one.
  @override
  bool operator ==(Object other) {
    return other is Fruit &&
        name == other.name &&
        color == other.color &&
        shape == other.shape &&
        likedBy == other.likedBy;
  }

  @override
  int get hashCode {
    return hashList([name, color, shape, likedBy]);
  }*/
