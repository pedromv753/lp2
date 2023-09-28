package farmaciaController;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.farmacia.modelo.farmacia;
import com.farmacia.reporsitorio.JfarmaciaRepositorio;

@Controller
@RequestMapping("/farmacia")
public class farmaciacontrolar {
	
	@Autowired
	private JfarmaciaRepositorio JfarmaciaRepositorio; // Inyeccion de dependencias

	@GetMapping("/")
	public String listarfarmacia(Model model) {
		List<farmacia> farmacia = JfarmaciaRepositorio.findAll();
		model.addAttribute("farmacia", farmacia);
		return "listarfarmacia"; // nombre de la vista
	}

	@GetMapping("/nuevo")
	public String nuevofarmacia(Model model) {
		model.addAttribute("libro", new farmacia());
		return "nuevo"; // nombre de la vista
	}

	@PostMapping("/guardar")
	public String guardarfarmacia(@ModelAttribute farmacia farmacia) {
		JfarmaciaRepositorio.save(farmacia);
		return "redirect:/libros/"; // redirecciona para ver la lista
	}

	@GetMapping("/editar/{id}")
	public String editarfarmacia(@PathVariable Integer id, Model model) {
		farmacia farmacia = JfarmaciaRepositorio.findById(id)
				.orElseThrow(() -> new IllegalArgumentException("ID de medicamento no válido"));
		model.addAttribute("farmacia", farmacia);
		return "editafarmacia"; // Vista de edición
	}

	@GetMapping("/eliminar/{id}")
	public String eliminarfarmacia(@PathVariable Integer id) {
		JfarmaciaRepositorio.deleteById(id);
		return "redirect:/farmacia/";
	}
	
	
}

	




