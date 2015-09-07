package detalleReceta

import ar.tp.dieta.Receta
import ar.tp.dieta.Usuario
import org.uqbar.arena.aop.windows.TransactionalDialog
import org.uqbar.arena.layout.ColumnLayout
import org.uqbar.arena.layout.HorizontalLayout
import org.uqbar.arena.layout.VerticalLayout
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.CheckBox
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.List
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.tables.Column
import org.uqbar.arena.widgets.tables.Table
import org.uqbar.arena.windows.WindowOwner

class DetalleReceta extends TransactionalDialog<DetalleRecetaAplicationModel>{
		
		new(WindowOwner owner, Receta receta, Usuario usuario) {
			super(owner, new DetalleRecetaAplicationModel(receta,usuario))
			title = "Consulta de recetas"
		}
		
		def defaultTitle() {
			"Detalle receta"
		}
		
		override createFormPanel(Panel mainPanel) {
			
			mainPanel.layout = new VerticalLayout
			//val Usuario usuario = construirUsuario()
			
			
			//PANELES
			
			val panelNombreReceta = new Panel(mainPanel)
			
			val panelSuperior = new Panel(mainPanel)
			panelSuperior.layout = new HorizontalLayout
			
			val panelInfo = new Panel(mainPanel)
			panelInfo.layout = new ColumnLayout(2)
			
			val panelMedio = new Panel(mainPanel)
			panelMedio.layout = new ColumnLayout(2)
			
			val panelIzquierdo = new Panel(panelMedio)
			
			val panelDerecho = new Panel(panelMedio)
			
			val panelProceso = new Panel(mainPanel)
			
			//CONTENIDO DE LOS PANELES
			
			new Label(panelNombreReceta).bindValueToProperty("receta.nombreDeLaReceta")
			
			//PANEL SUPERIOR - CALORIAS Y AUTOR
			
			new Label(panelSuperior).bindValueToProperty("receta.calorias")
			new Label(panelSuperior).text = "calorias  ---- creado por"
			new Label(panelSuperior).bindValueToProperty("receta.autor")
			
			//PANEL MEDIO - DIFICULTAD, TEMPORADA E INGREDIENTES
			
			new Label(panelInfo).text = "Dificultad"
			new Label(panelInfo).text = "Temporada"
			new Label(panelInfo).bindValueToProperty("receta.dificultadDePreparacion")
			new Label(panelInfo).bindValueToProperty("receta.temporadaALaQueCorresponde")
			new Label(panelInfo).text = "Ingredientes"
			new Label(panelInfo).text = "Condimentos"
			
			grillaIngredientes(panelIzquierdo)
			
			new List(panelDerecho).bindItemsToProperty("receta.condimentos")			
			new Label(panelDerecho).text = "Condiciones Preexistentes"
			new List(panelDerecho).bindItemsToProperty("receta.condicionesPreexistentes")
			
			//PANEL FAVORITO - CHECKBOX FAVORITO
			
			val panelFavo = new Panel(panelIzquierdo)
			panelFavo.layout = new HorizontalLayout
			
			new Label(panelFavo).text = "Favorita"
			
			new CheckBox(panelFavo) => [
				bindValueToProperty("favorita")
				bindEnabledToProperty("editable")
			]
			
			
			//PANEL PROCESO - PROCEDIMIENTO DE LA RECETA
			
			new Label(panelProceso).text = "Proceso de preparacion"
			new Label(panelProceso).bindValueToProperty("receta.procesoDePreparacion")			
			new Button(panelProceso) => [
				caption = "Volver"
				onClick [ | this.close()]			
			]
				super.executeTask()
			
		}
		
		def grillaIngredientes(Panel panelMedio){
			val grilla = new Table(panelMedio, typeof(Receta)) => [
				width = 400
				height = 1000
				bindItemsToProperty("receta.ingredientes")
			]
			new Column<Receta>(grilla) => [
				title = "Ingrediente"
				bindContentsToProperty("nombre")
			]
			
			new Column<Receta>(grilla) => [
				title = "Cantidad"
				bindContentsToProperty("cantidad")
			]
		}
		
		/*def Usuario construirUsuario(){
			val Usuario usuario= new UsuarioBuilder("Daniel").peso(70.4).altura(1.83).fechaNacimiento(1992, 6, 4).sexo("M").rutina(new RutinaActiva => [
			setTiempoDeEjercicio(90)]).preferencia("carne").preferencia("pescado").email("usuariosincondicion@mail.com").build()
			val recetarioPublico = new RecetarioPublico
			recetarioPublico.recetas.add(modelObject)
			usuario.recetario = recetarioPublico
			return usuario
		}*/
		
		/*def static void main(String[] args) {
			new DetalleReceta().startApplication
		}*/
		
	
		
}
