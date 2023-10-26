package com.example.demo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.example.demo.interfaces.interfaceproductos;
import com.example.demo.modelos.productos;
	
	@Controller
	@RequestMapping("/productos")
	public class productosController {
		
	@Autowired
	private interfaceproductos productosRep;
	
	
	@GetMapping("/")
	public String listarproductos(Model model) {
		List<productos> productos = productosRep.findAll();
		model.addAttribute("productos", productos);
		return "listarproductos"; 
		
	}
	@GetMapping("/nuevo")
	public String nuevocliente(@ModelAttribute("mensaje") String mensaje,Model model) {
		model.addAttribute("productos", new productos());
		model.addAttribute("mensaje",mensaje);
		return "nuevoproductos"; // nombre de la vista
	}

	@PostMapping("/guardar")
	public String guardarcompras(@ModelAttribute productos productos, RedirectAttributes redirec) {
		productosRep.save(productos);
		redirec.addFlashAttribute("mensaje", "La compra fue un exito");
		return "redirect:/productos/nuevo"; 
	}

	@GetMapping("/editar/{id}")
	public String editarproductos(@PathVariable Integer id, Model model) {
		productos productos= productosRep.findById(id)
				.orElseThrow(() -> new IllegalArgumentException("ID de cliente no válido"));
		model.addAttribute("productos", productos);
		return "editarProducto"; // Vista de edición
	}

	@GetMapping("/eliminar/{id}")
	public String eliminarproductos(@PathVariable Integer id) {
		productosRep.deleteById(id);
		return "redirect:/productos/";
	}
}

