class MaterialCemen {
  String name;

  MaterialCemen(this.name);

  static List<MaterialCemen> getMaterials() {
    return <MaterialCemen>[
      MaterialCemen('Clinker'),
      MaterialCemen('Trass'),
      MaterialCemen('Gypsum'),
      MaterialCemen('Limestone'),
    ];
  }
}

class LineMill {
  String name;

  LineMill(this.name);

  static List<LineMill> getLines() {
    return <LineMill>[
      LineMill('Line 1'),
      LineMill('Line 2'),
    ];
  }
}
