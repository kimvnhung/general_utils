import 'package:flutter/material.dart';

class CategoryTreeNode {
  final String name;
  final IconData? icon;
  bool? isSelected;
  final List<CategoryTreeNode> children;

  CategoryTreeNode(
    this.name, {
    this.icon,
    this.isSelected = false,
    this.children = const [],
  });
}
