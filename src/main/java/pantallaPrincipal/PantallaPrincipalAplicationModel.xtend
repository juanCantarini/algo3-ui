package pantallaPrincipal

import ar.tp.dieta.Accion2
import ar.tp.dieta.Busqueda
import ar.tp.dieta.Busqueda2
import ar.tp.dieta.Filtro
import ar.tp.dieta.FiltroPorGustos
import ar.tp.dieta.FiltroPorIngredienteCaro
import ar.tp.dieta.PosteriorBusquedaDiezPrimeros
import ar.tp.dieta.PosteriorBusquedaOrdenadoCalorias
import ar.tp.dieta.Receta
import ar.tp.dieta.RecetarioPublico
import ar.tp.dieta.RutinaActiva
import ar.tp.dieta.TestRepositorio
import ar.tp.dieta.Usuario
import java.util.ArrayList
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable

@Accessors
@Observable
class PantallaPrincipalAplicationModel extends TestRepositorio{
	
	Busqueda2 busquedaUsuario = new Busqueda2
	Receta recetaSeleccionada
	Accion2 accion = new Accion2
	List<Receta> recetas = new ArrayList<Receta>
	Usuario usuario
	RecetarioPublico recetario = new RecetarioPublico
	String mensaje
	Busqueda busqueda1 = new Busqueda => [
			agregarFiltro(new FiltroPorIngredienteCaro)
	]
	Busqueda busqueda2 = new Busqueda => [
			agregarFiltro(new PosteriorBusquedaOrdenadoCalorias)
	]
	Busqueda busqueda3 = new Busqueda => [
			agregarFiltro(new FiltroPorGustos)
	]
	Filtro filtroPrimeras = new PosteriorBusquedaDiezPrimeros
	
	new(Usuario parametroUsuario){
		
		this.usuario = parametroUsuario 
		basket = new RutinaActiva => [
			setTiempoDeEjercicio(240)
		]
		
		recetas.addAll(establecerRecetas())
	}
	
	def establecerRecetas() {
	
			if(!usuario.recetasFavoritas2.isEmpty){	
				mensaje = "Estas son sus recetas favoritas"
				return(filtroPrimeras.aplicarFiltroUsuario(usuario,usuario.recetasFavoritas2))
			}else{
				if(!usuario.recetasBuscadas.isEmpty){
					mensaje = "Este es el resultado de su ultima consulta"
					return(filtroPrimeras.aplicarFiltroUsuario(usuario,usuario.recetasBuscadas))
				}else{
					mensaje = "Estas son las recetas mas consultadas"
					return(filtroPrimeras.aplicarFiltroUsuario(usuario,usuario.accion2.getRecetasFinales))
				}
		}
	}
	
	def refrescar() {
		recetas.removeAll
		recetas = filtrar()
		usuario.accion2.seRealizoBusqueda(recetas)
		usuario.agregarRecetasBuscadas(recetas)
	}
	
	//////////////////  ENTRA A FAVORITO/////////////////////
	
	def void agregarORemoverRecetaFavorita(){
			if(usuario.recetasFavoritas2.contains(recetaSeleccionada)){
				usuario.eliminarRecetaFavorita(recetaSeleccionada)
			} else{ 
				usuario.agregarRecetaFavorita(recetaSeleccionada)
			}
	}
	
	def filtrar(){
		busquedaUsuario.filtrar(usuario,usuario.recetasQuePuedoVer)
	}
}
