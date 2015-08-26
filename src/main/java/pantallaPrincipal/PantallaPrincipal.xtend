package pantallaPrincipal

import ar.tp.dieta.Receta
import org.uqbar.arena.layout.VerticalLayout
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
		title = "Bienvenido a ¿Que comemos?"
		mainPanel.layout = new VerticalLayout
		
		new Label(mainPanel).bindValueToProperty("mensaje")// = "Estas fueron sus ultimas consultas"
		grillaConsulta(mainPanel)
	}
	
	
	def grillaConsulta(Panel mainPanel){
			val grilla = new Table(mainPanel, typeof(Receta)) => [
				width = 400
				height = 1000
				bindItemsToProperty("recetas")
			]
			new Column<Receta>(grilla) => [
				title = "Nombre"
				bindContentsToProperty("nombreDeLaReceta")
			]
			
			new Column<Receta>(grilla) => [
				title = "Calorias"
				bindContentsToProperty("calorias")
			]
			
			new Column<Receta>(grilla) => [
				title = "Dificultad"
				bindContentsToProperty("dificultadDePreparacion")
			]
			
			new Column<Receta>(grilla) => [
				title = "Temporada"
				bindContentsToProperty("temporadaALaQueCorresponde")
			]
		}
		
		
}