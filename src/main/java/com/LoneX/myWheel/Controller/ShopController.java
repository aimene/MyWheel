package com.LoneX.myWheel.Controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.LoneX.myWheel.Filters.Filter;
import com.LoneX.myWheel.Vehicule.Vehicule;
import com.LoneX.myWheel.Vehicule.VehiculeService;

@Controller
@SessionAttributes("filter ,marqueList ,listCategory")
public class ShopController {
	 
	@Autowired
	VehiculeService vehiculeService;
	@Autowired
	HttpServletRequest request;
	
	@ModelAttribute("filter")
	public Filter getFilter() {
		return new Filter();
	}
		

		@RequestMapping("/shop")
		public ModelAndView redirectShop() {
			
			ModelAndView model=new ModelAndView("redirect:/shop/0");
			
			HttpSession session=request.getSession();
			
			
			session.setAttribute("filter", this.getFilter());
	
			return model;
			
		}
		
		@RequestMapping("/shop/{pageId}")
        public ModelAndView shop(@PathVariable ("pageId") int pageId) {
			
			ModelAndView model=new ModelAndView("filter");
		     
			 Page<Vehicule> vPage = vehiculeService.getVehiculesPaged(pageId);
			 List<Vehicule> list = new ArrayList<Vehicule>();
			 
		     for(Vehicule v : vPage) {
		    	 list.add(v);
		     }
		     
		     int numOfPages = vPage.getTotalPages();
		    
				List<String> listCateg=vehiculeService.getAllCategories();
				
				HttpSession session=request.getSession();
				session.setAttribute("listCategory", listCateg);
				
		     
				
			 model.addObject("numOfPages" , numOfPages);
			 model.addObject("vPage", list);
			 model.addObject("numVehicules" , list.size());
	         return model;
         }
		
		@RequestMapping(value="/shop/{pageId}/filter",method=RequestMethod.GET)
		public ModelAndView shopFiltered(@PathVariable int pageId ,@ModelAttribute("filter") Filter filter , BindingResult bindingResult) {
			ModelAndView model=new ModelAndView("shop");
		
			
			
			System.out.println("categ : " + filter.getCategory());
			System.out.println("model : " + filter.getModel());
			System.out.println("dateD : " + filter.getDateD());
			
			Page<Vehicule> page=vehiculeService.getVehiculeFilteredAndPaged(filter , pageId );
			 List<Vehicule> list = new ArrayList<Vehicule>();
			
			 System.out.println("ListContent :");
			for(Vehicule v : page) {
		    	 list.add(v);
		    	 System.out.println("vModel : "+ v.getModel() );
		    	 System.out.println("imagePath : "+ v.getImagePath());
		     }
			 System.out.println("/ListContent---");
			 
			 HttpSession session=request.getSession();
				session.setAttribute("filter", filter);
			
			int numOfPages = page.getTotalPages();
			
			model.addObject("currentPage" , page.getNumber());
			model.addObject("numOfPages" , numOfPages);
			model.addObject("numVehicules" , list.size());
			model.addObject("vPage", list);
			
			return model;
		}
		
		
	
		
}
