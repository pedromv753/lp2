package controllador;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import modelos.productos;
import interfaces.interfacesproductos;

public class productocontroller {

	@Controller
	@RequestMapping("/cliente")
	public class ClienteController {
		@Autowired
		private interfacesproductos productosRep;
		
		@GetMapping("/")
		public String listarproductos(Model model) {
			List<productos> productos = productosRep.findAll();
			model.addAttribute("productos", productos);
			return "listarproductos"; 
		}

		@GetMapping("/nuevo")
		public String nuevocliente(Model model) {
			model.addAttribute("productos", new productos());
			return "nuevo"; // nombre de la vista
		}

		@PostMapping("/guardar")
		public String guardarcompras(@ModelAttribute productos productos) {
			productosRep.save(productos);
			return "redirect:/productos/"; 
		}

		@GetMapping("/editar/{id}")
		public String editarproductos(@PathVariable Integer id, Model model) {
			productos productos= productosRep.findById(id)
					.orElseThrow(() -> new IllegalArgumentException("ID de cliente no válido"));
			model.addAttribute("productos", productos);
			return "editaproductos"; // Vista de edición
		}

		@GetMapping("/eliminar/{id}")
		public String eliminarproductos(@PathVariable Integer id) {
			productosRep.deleteById(id);
			return "redirect:/compras/";
		}
	}
}
