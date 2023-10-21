package com.example.demo.controlador;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;


import com.example.demo.interfaces.interfacesCompras;
import com.example.demo.interfaces.interfacesProductos;
import com.example.demo.modelos.Compras;
import com.example.demo.modelos.Productos;
	
@Controller
@RequestMapping("/compras")
public class ComprasController {
	@Autowired
	private interfacesCompras comprasRep;
	
	@Autowired
	private interfacesProductos productosRep;
	
	@GetMapping("/")
	public String listarcliente(Model model) {
		List<Compras> compras = comprasRep.findAll();
		model.addAttribute("compras", compras);
		return "listarcompras"; 
	}

	@GetMapping("/nuevo")
	public String nuevocompras(Model model) {
		List<Productos> productos = productosRep.findAll();
		model.addAttribute("productos", productos);
		model.addAttribute("compras", new Compras());
		return "nuevoCompras"; 
	}

	@PostMapping("/guardar")
	public String guardarproducto(@ModelAttribute Compras compras) {
		String fechaString = "2023-11-05"; // Ejemplo de una cadena de fecha
		Date fecha = null;
		try {
		    fecha = new SimpleDateFormat("yyyy-MM-dd").parse(fechaString);
		} catch (ParseException e) {
			
		}
		compras.setFecha(fecha);
		comprasRep.save(compras);
		return "redirect:/compras/"; 
	}

	@GetMapping("/editar/{id}")
	public String editarcompra(@PathVariable Integer id, Model model) {
		Compras compras = comprasRep.findById(id)
				.orElseThrow(() -> new IllegalArgumentException("ID de cliente no válido"));
		List<Productos> productos = productosRep.findAll();
		model.addAttribute("productos", productos);
		model.addAttribute("compras", compras);
		return "editacompra";
	}

	@GetMapping("/eliminar/{id}")
	public String eliminarcompras(@PathVariable Integer id) {
		comprasRep.deleteById(id);
		return "redirect:/productos/";
	}
}