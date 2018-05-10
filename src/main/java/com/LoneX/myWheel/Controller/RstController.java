package com.LoneX.myWheel.Controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.LoneX.myWheel.Vehicule.VehiculeService;

@RestController
public class RstController {
	@Autowired
	VehiculeService vehiculeService;
	
	@RequestMapping("/shop/getMarqueList")
    public List<String> getMarqueList(String category)
    {
    	List<String> list = vehiculeService.getMarquesByCategory( category );
    	
        return list;
    }
	
	@RequestMapping("/shop/getModelList")
    public List<String> getModelList(String marque , String category)
    {
    	List<String> list = vehiculeService.getModelsByMarque( marque ,category);
    	
        return list;
    }
	@RequestMapping("/cart/remove")
    public void removeVehicule(String idVehicule)
    {
		
    	vehiculeService.removeVehicule(idVehicule);
		
    }
}
