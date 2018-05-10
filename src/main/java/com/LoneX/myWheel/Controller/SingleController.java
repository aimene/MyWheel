package com.LoneX.myWheel.Controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.LoneX.myWheel.Reservation.Reservation;
import com.LoneX.myWheel.Reservation.ReservationService;
import com.LoneX.myWheel.User.MyUser;
import com.LoneX.myWheel.User.MyUserService;
import com.LoneX.myWheel.Vehicule.Vehicule;
import com.LoneX.myWheel.Vehicule.VehiculeService;

@Controller
@SessionAttributes("reservation")

public class SingleController {
	
	@Autowired
	VehiculeService vehiculeService;
	@Autowired
	MyUserService myUserService;
	@Autowired
	ReservationService reservationService;
	
	@Autowired
	HttpServletRequest request;
 
	
		@ModelAttribute("reservation")
		public Reservation getReservation() {
		
				return new Reservation();
			
		}
		
	
	 
	@RequestMapping("/single/{idVehicule}")
	public ModelAndView singleGet(@PathVariable ("idVehicule") int idVehicule ,String dateD , String dateR) {
		
		
		
		ModelAndView model=new ModelAndView("single");
		
		HttpSession session=request.getSession();
		Reservation reservation=this.getReservation();
		session.setAttribute("reservation",reservation);
		
		Date dateDeb;
		Date dateRet;
		try {
			dateDeb = new SimpleDateFormat("yyyy-MM-dd").parse(dateD);
			dateRet=new SimpleDateFormat("yyyy-MM-dd").parse(dateR);
			reservation.setDateD(dateDeb);
			reservation.setDateR(dateRet);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		System.out.println("dateD : "+ reservation.getDateD());
		System.out.println("dateR : "+ reservation.getDateR());
		
		session.setAttribute("reservation" , reservation);
		
		Vehicule vehicule = vehiculeService.getVehicule(idVehicule);
		
		model.addObject("vehicule" , vehicule);
		model.addObject("reservation" , reservation);
		
		return model;
	}
	
	@RequestMapping(value="/single/{idVehicule}/reserver" , method=RequestMethod.POST)
	public ModelAndView singleReserver(@PathVariable("idVehicule") int idVehicule , Reservation reservation) {
		
		ModelAndView model = new ModelAndView("single");
		
		Vehicule vehicule = vehiculeService.getVehicule(idVehicule);
		
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		String currentUserName = authentication.getName();
		
		MyUser user= myUserService.getMyUser( currentUserName );
		
		System.out.println("user : "+ user.getEmail());
		System.out.println("vehicule : "+ vehicule.getModel());
		System.out.println("dateD : "+ reservation.getDateD());
		System.out.println("dateR : "+ reservation.getDateR());
		
		reservation.setUser(user);
		reservation.setVehicule(vehicule);
		
		reservationService.reserver(reservation);
		
		return model;
	}
	@RequestMapping("/checkout")
	public ModelAndView checkoutPage() {
		
		ModelAndView model=new ModelAndView ("checkout");
		
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		String currentUserName = authentication.getName();
		
		MyUser user= myUserService.getMyUser( currentUserName );
		
		List<Reservation> cart=reservationService.getUserReservations(user.getId());
		
		System.out.println("user : "+ user.getEmail());
		System.out.println("numReservation : "+ cart.size());
		
		List<Vehicule> vehicules=new ArrayList();
		//getting vehicules by id from reservations
		for(Reservation reservation: cart) {
			vehicules.add( vehiculeService.getVehicule( reservation.getVehicule().getIdVehicule() ) );
		}
		
		model.addObject("numVehicules" , vehicules.size());
		model.addObject("vPage" , vehicules );
		model.addObject("cart" , cart);
		model.addObject("numReservation" , cart.size());
		
		return model;
	}
	
	
}
