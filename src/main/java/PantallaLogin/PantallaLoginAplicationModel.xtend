package PantallaLogin

import ar.tp.dieta.RepositorioUsuarios
import ar.tp.dieta.Usuario
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable

@Accessors
@Observable
class PantallaLoginAplicationModel{
	
	RepositorioUsuarios repoUsuarios = new RepositorioUsuarios
	String nombre
	String contraseña
	Usuario usuario
	
	def validar(){
		usuario = repoUsuarios.validarLogin(nombre,contraseña)
		
	}
}