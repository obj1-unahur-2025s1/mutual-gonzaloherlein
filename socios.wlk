class Socio{
    const property actividades = []
    const maximoDeActividades
    var edad
    const property idiomas = #{}
    method leAtrae(unaActividad)

    method edad() = edad
    method esAdoradorDelSol() = actividades.all({a => a.sirveParaBroncearse()})
    method actividadesEsforzadas() = actividades.filter({a => a.implicaEsfuerzo()})
    method registrarActividad(unaActividad){
        if(maximoDeActividades == actividades.size()){
            self.error("Se llegó al maximo de actividades")
        }
        actividades.add(unaActividad)
    }
}

class SocioTranquilo inherits Socio{
    override method leAtrae(unaActividad) = unaActividad.dias() >= 4
}

class SocioCoherente inherits Socio{
    override method leAtrae(unaActividad) = if(self.esAdoradorDelSol()) unaActividad.sirveParaBroncearse() else unaActividad.implicaEsfuerzo()
}

class SocioRelajado inherits Socio{
    override method leAtrae(unaActividad) = not idiomas.intersection(unaActividad.idiomas()).isEmpty()
}
