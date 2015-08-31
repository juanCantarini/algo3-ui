package pantallaPrincipal

import ar.tp.dieta.Receta
import detalleReceta.DetalleReceta
import org.uqbar.arena.bindings.NotNullObservable
import org.uqbar.arena.layout.HorizontalLayout
import org.uqbar.arena.layout.VerticalLayout
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.tables.Column
import org.uqbar.arena.widgets.tables.Table
import org.uqbar.arena.windows.MainWindow

class PantallaPrincipal extends MainWindow<PantallaPrincipalAplicationModel>{
	
	new(){
		super (new PantallaPrincipalAplicationModel)
	}
	
	def static void main(String[] args) {
			new PantallaPrincipal().startApplication
	}
	
	override createContents(Panel mainPanel){
		
		val elementSelected = new NotNullObservable("recetaSeleccionada")
		
		title = "Bienvenido a ¿Que comemos?"
		mainPanel.layout = new VerticalLayout
		
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
			onClick [ | modelObject.agregarORemoverRecetaFavorita]
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
}