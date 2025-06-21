class Viaje{
  const property idiomas = #{}

  method implicaEsfuerzo()
  method sirveParaBroncearse() = false
  method dias()
  method esInteresante() = idiomas.size() > 1
  method esRecomendada(unSocio) = self.esInteresante() && unSocio.leAtrae(self) && !unSocio.actividades().contains(self)
}

class ViajeDePlaya inherits Viaje{
  const largo
  override method dias() = largo / 500
  override method implicaEsfuerzo() = largo > 1200
  override method sirveParaBroncearse() = true
}

class ExcursionACiudad inherits Viaje{
  const cuantasAtracciones
  override method dias() = cuantasAtracciones / 2
  override method implicaEsfuerzo() = cuantasAtracciones.between(5, 8)
  override method esInteresante() = super() || cuantasAtracciones == 5
}

class ExcursionACiudadTroplical inherits ExcursionACiudad{
  override method dias() = super() + 1
  override method sirveParaBroncearse() = true
}

class SalidaDeTrekking inherits Viaje{
  const kilometros
  const diasDeSol
  override method dias() = kilometros / 50
  override method implicaEsfuerzo() = kilometros > 80
  override method sirveParaBroncearse() = diasDeSol > 200 || (diasDeSol.between(100, 200) && kilometros > 120)
  override method esInteresante() = super() && diasDeSol > 140
}

class ClaseDeGimnasia inherits Viaje{
  method initialize(){
    idiomas.clear()
    idiomas.add("español")
  }

  override method dias() = 1
  override method implicaEsfuerzo() = true 
  override method esRecomendada(unSocio) = unSocio.edad().between(20, 30)
}

class TallerLiterario inherits Viaje{
  const property libros = #{}

  override method idiomas() = libros.map({l => l.idioma()})
  override method dias() = libros.size() + 1
  override method implicaEsfuerzo() = libros.any({l => l.cantidadPaginas() > 500}) || (libros.all({l => l.nombreAutor() == libros.first().nombreAutor()}) && libros.size() > 1)
  override method esRecomendada(unSocio) = unSocio.idiomas().size() > 1
}

class Libro{
  const property idioma
  const property cantidadPaginas
  const property nombreAutor
}
