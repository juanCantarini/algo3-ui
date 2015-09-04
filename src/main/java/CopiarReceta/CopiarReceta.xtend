package CopiarReceta

import ar.tp.dieta.Receta
import ar.tp.dieta.Usuario
import org.uqbar.arena.aop.windows.TransactionalDialog
import org.uqbar.arena.layout.HorizontalLayout
import org.uqbar.arena.layout.VerticalLayout
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.TextBox
import org.uqbar.arena.windows.WindowOwner

class CopiarReceta extends TransactionalDialog<CopiarRecetaAplicationModel>{
	
	new(WindowOwner owner, Receta receta, Usuario usuario) {
		super(owner, new CopiarRecetaAplicationModel(receta,usuario))
	}
	
	def defaultTitle() {
			"Copiar receta"
	}
		
	override createFormPanel(Panel mainPanel) {
			
		mainPanel.layout = new VerticalLayout
		
		val panelNombre = new Panel(mainPanel)
		panelNombre.layout = new HorizontalLayout
		new Label(panelNombre).text = "Receta:  "
		new Label(panelNombre).bindValueToProperty("receta.nombreDeLaReceta")
		
		val panelNombreCopia = new Panel(mainPanel)
		panelNombreCopia.layout = new HorizontalLayout
		new Label(panelNombreCopia).text = "Nombre de copia:  "
		new TextBox(panelNombreCopia) => [
			bindValueToProperty("nombreCopia")
			//como poner un valor default
		]
		
		new Button(mainPanel) => [
			caption = "Copiar"
			onClick [ | modelObject.copiar()
				super.executeTask()
				this.close()
			]
		]
		
	}
}