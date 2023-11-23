package com.hotel.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.hotel.modelos.habitaciones;
import com.hotel.modelos.reservas;
import com.hotel.repositorio.IHabitacionesRepositorio;
import com.hotel.repositorio.IReservasRepositorio;
import com.hotel.modelos.clientes;

import jakarta.servlet.http.HttpSession;

@Controller
public class HotelController {
	
	@Autowired
	private IReservasRepositorio reservasRepo;
	
	@Autowired
	private IHabitacionesRepositorio habitacionesRepositorio;
	
	@GetMapping("/")
	public String catalogo(Model model, HttpSession session) {
		
		if(session.getAttribute("carrito") == null) {
			session.setAttribute("carrito", new ArrayList<reservas>());
		}
		
		model.addAttribute("habitaciones",habitacionesRepositorio.findAll());
		return "catalogo";
	}
	
	@GetMapping("/carrito")
	public String carrito(Model model, HttpSession session) {
		List<reservas> reservas = (List<reservas>) session.getAttribute("carrito");
		model.addAttribute("reservas", reservas);
		return "carrito";
	}
	
	@PostMapping("/AgregarCarrito")
	public String agregar(Model model, HttpSession session, @RequestParam Integer codigo) {
		List<reservas> reservas = (List<reservas>) session.getAttribute("carrito");
		
		habitaciones hab = habitacionesRepositorio.findById(codigo).get();
		
		return "redirect:/carrito";
	}
	
	@GetMapping("/Comprar")
    public String Comprar(
            Model model,
            HttpSession session
    ){
        List<reservas> list = (List<reservas>) session.getAttribute("carrito");
        for (int i = 0; i < list.size(); i++){
            clientes cliente = new clientes();
            cliente.setId(1);
            list.get(i).setCliente_id(i);
            reservasRepo.save(list.get(i));
        }

        return "redirect:/";
    }
}
