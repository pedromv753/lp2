package com.example.demo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.demo.interfaces.interfaceproductos;
import com.example.demo.modelos.productos;

	@Controller
	@RequestMapping("/catalogo")
	public class catalogoController {
	
	@Autowired
	private interfaceproductos productosRep;
	
	
	@GetMapping("/")
	public String catalogo(Model model) {
		List<productos> productos = productosRep.findAll();
		model.addAttribute("productos", productos);
		return "catalogo"; 
	}
	
	@GetMapping("/nuevo")
	public String nuevocatalogo(Model model) {
		model.addAttribute("productos", new productos());
		return "nuevocatalogo"; // nombre de la vista
	}
}

