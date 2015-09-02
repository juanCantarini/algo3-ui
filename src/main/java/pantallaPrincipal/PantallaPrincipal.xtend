package pantallaPrincipal

import ar.tp.dieta.Busqueda2
import ar.tp.dieta.Receta
import detalleReceta.DetalleReceta
import java.awt.Color
import org.uqbar.arena.bindings.NotNullObservable
import org.uqbar.arena.layout.ColumnLayout
import org.uqbar.arena.layout.HorizontalLayout
import org.uqbar.arena.layout.VerticalLayout
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.CheckBox
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.Selector
import org.uqbar.arena.widgets.TextBox
import org.uqbar.arena.widgets.tables.Column
import org.uqbar.arena.widgets.tables.Table
import org.uqbar.arena.windows.MainWindow
import CopiarReceta.CopiarReceta

class PantallaPrincipal extends MainWindow<PantallaPrincipalAplicationModel>{
	
	new(){
		super (new PantallaPrincipalAplicationModel)
	}
	
	def static void main(String[] args) {
			new PantallaPrincipal().startApplication
	}
	
	override createContents(Panel mainPanel){
		
		val elementSelected = new NotNullObservable("recetaSeleccionada")
		
		title = "Consulta de recetas"
		mainPanel.layout = new VerticalLayout
		
		val PanelConsulta = new Panel(mainPanel)
		PanelConsulta.layout = new ColumnLayout(2)
		val PanelIzq = new Panel(PanelConsulta)
		val PanelDerecho = new Panel(PanelConsulta)
		
		new Label(PanelIzq).text = "Nombre"
		new TextBox(PanelIzq).bindValueToProperty("busquedaUsuario.nombre")
		new Label(PanelIzq).text = "Dificultad"
		new Selector<String>(PanelIzq) => [
			bindItemsToProperty("busquedaUsuario.dificultades")
			bindValueToProperty("busquedaUsuario.dificultad")
		]
		new Label(PanelIzq).text = "Que contenga ingrediente"
		new TextBox(PanelIzq).bindValueToProperty("busquedaUsuario.ingrediente")
		
		new Label(PanelDerecho).text = "Calorias"
		
		val PanelCalorias = new Panel(PanelDerecho)
		PanelCalorias.layout = new HorizontalLayout
		
		new Label(PanelCalorias).text = "De "
		new TextBox(PanelCalorias).bindValueToProperty("busquedaUsuario.caloriasMinimas")
		new Label(PanelCalorias).text = " a "
		new TextBox(PanelCalorias).bindValueToProperty("busquedaUsuario.caloriasMaximas")
		
		new Label(PanelDerecho).text = "Temporada"
		new Selector<String> (PanelDerecho)=> [
			bindItemsToProperty("busquedaUsuario.temporadas")
			bindValueToProperty("busquedaUsuario.temporadas")
		]
		
		val PanelFiltroUsuario = new Panel(PanelDerecho)
		PanelFiltroUsuario.layout = new HorizontalLayout
		
		new CheckBox(PanelFiltroUsuario) => [
			bindValueToProperty("busquedaUsuario.aplicarFiltro")	
		]
		
		new Label(PanelFiltroUsuario).text = "Aplicar filtros del perfil de usuario"
		
		val PanelBotoneraBusqueda = new Panel(PanelDerecho)
		PanelBotoneraBusqueda.layout = new HorizontalLayout	
		
		new Button(PanelBotoneraBusqueda) => [
			caption = "Buscar"
			onClick [ | modelObject.filtrar
				modelObject.getRecetas
			]
		]
		
		new Button(PanelBotoneraBusqueda) => [
			caption = "Volver"
			onClick [ | modelObject.busquedaUsuario = new Busqueda2]
		]
				
		new Label(mainPanel).bindValueToProperty("mensaje")// = "Estas fueron sus ultimas consultas"
		grillaConsulta(mainPanel)
		val PanelBotonera = new Panel(mainPanel)
		PanelBotonera.layout = new HorizontalLayout
		new Button(PanelBotonera) => [
			caption = "Ver"
			onClick [ | this.verReceta()]
			bindEnabled(elementSelected)	
		]
		
		new Button(PanelBotonera) => [
			caption = "Favorita"
			onClick [ | modelObject.agregarORemoverRecetaFavorita
			]
			bindEnabled(elementSelected)
		] 
		
		new Button(PanelBotonera) => [
			caption = "Copiar receta"
			onClick [ | this.copiar()]
			bindEnabled(elementSelected)
		]
	}
	
	
	def grillaConsulta(Panel mainPanel){
			val grilla = new Table(mainPanel, typeof(Receta)) => [
				width = 400
				height = 2000
				bindItemsToProperty("recetas")
				bindValueToProperty("recetaSeleccionada")
			]
			new Column<Receta>(grilla) => [
				fixedSize = 200
				title = "Nombre"
				bindContentsToProperty("nombreDeLaReceta")
				bindBackground("nombreDeLaReceta").transformer =
				[ String recibe | if (modelObject.usuarios.get(0).devolverReceta(recibe) != null) Color.RED 
					else {if (modelObject.usuarios.get(0).recetario.busquedaReceta(recibe) != null) Color.GREEN
					else { Color.BLUE
						}
					}
				]
			]
			
			new Column<Receta>(grilla) => [
				fixedSize = 200
				title = "Calorias"
				bindContentsToProperty("calorias")
			]
			
			new Column<Receta>(grilla) => [
				fixedSize = 200
				title = "Dificultad"
				bindContentsToProperty("dificultadDePreparacion")
			]
			
			new Column<Receta>(grilla) => [
				fixedSize = 200
				title = "Temporada"
				bindContentsToProperty("temporadaALaQueCorresponde")
			]
		}
		
		def void verReceta() {
			(new DetalleReceta(this, modelObject.recetaSeleccionada, modelObject.usuarios.get(0))).open
	}
	
		def void copiar() {
			(new CopiarReceta(this, modelObject.recetaSeleccionada, modelObject.usuarios.get(0))).open
		}
}