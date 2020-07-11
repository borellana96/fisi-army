class Departamentos {

  List<Departamento> items = new List();

  Departamentos();

  Departamentos.fromJsonList( List<dynamic> jsonList  ) {

    if ( jsonList == null ) return;

    for ( var item in jsonList  ) {
      final departamento = new Departamento.fromJsonMap(item);
      items.add( departamento );
    }
  }
}

class Departamento {
  int id;
  String departamento;
  int prc;
  int pruebarapida;
  int totalcasos;
  int fallecidos;
  double letalidad;

  Departamento({
    this.id,
    this.departamento,
    this.prc,
    this.pruebarapida,
    this.totalcasos,
    this.fallecidos,
    this.letalidad,
  });
  static List<Departamento> getLanguages() {
     return <Departamento>[
        Departamento(id: 1,departamento:'departamento1' ,prc: 1,pruebarapida: 1, totalcasos: 1, fallecidos: 1,letalidad: 1),
        Departamento(id: 2,departamento:'departamento2' ,prc: 1,pruebarapida: 1, totalcasos: 1, fallecidos: 1,letalidad: 1),
        Departamento(id: 3,departamento:'departamento3' ,prc: 1,pruebarapida: 1, totalcasos: 1, fallecidos: 1,letalidad: 1),
     ];
   }
  Departamento.fromJsonMap( Map<String, dynamic> json ) {

    id               = json['id'];
    departamento     = json['departamento'];
    prc              = json['prc'];
    pruebarapida     = json['pruebarapida'];
    totalcasos       = json['totalcasos'];
    fallecidos       = json['fallecidos'];
    letalidad        = json['letalidad'] / 1;
  }
}