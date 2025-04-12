extension PathHandler on String? {
  String? get fileName {
    if (this == null) return null;
    List<String> parts = this!.split("/");
    return parts.last;
  }

  String? get fileNameWithoutExtension {
    if (this == null) return null;
    List<String> parts = this!.split("/");
    String fileName = parts.last;
    List<String> fileNameParts = fileName.split(".");
    return fileNameParts.first;
  }

  String? get extension {
    if (this == null) return null;
    List<String> parts = this!.split("/");
    String fileName = parts.last;
    List<String> fileNameParts = fileName.split(".");
    return fileNameParts.last;
  }

  String? get parentPath {
    if (this == null) return null;
    List<String> parts = this!.split("/");
    parts.removeLast();
    return parts.join("/");
  }
}
