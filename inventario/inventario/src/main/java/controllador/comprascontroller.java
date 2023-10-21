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

import modelos.compras;
import interfaces.interfacescompras;
	
	@Controller
	@RequestMapping("/compras")
	public class comprascontroller {
		@Autowired
		private interfacescompras comprasRep;
		
		@GetMapping("/")
		public String listarcliente(Model model) {
			List<compras> compras = comprasRep.findAll();
			model.addAttribute("compras", compras);
			return "listarcompras"; 
		}

		@GetMapping("/nuevo")
		public String nuevocompras(Model model) {
			model.addAttribute("compras", new compras());
			return "nuevo"; 
		}

		@PostMapping("/guardar")
		public String guardarproducto(@ModelAttribute compras compras) {
			comprasRep.save(compras);
			return "redirect:/productos/"; 
		}

		@GetMapping("/editar/{id}")
		public String editarcompra(@PathVariable Integer id, Model model) {
			compras compras = comprasRep.findById(id)
					.orElseThrow(() -> new IllegalArgumentException("ID de cliente no válido"));
			model.addAttribute("compras", compras);
			return "editacompra";
		}

		@GetMapping("/eliminar/{id}")
		public String eliminarcompras(@PathVariable Integer id) {
			comprasRep.deleteById(id);
			return "redirect:/productos/";
		}
	}

