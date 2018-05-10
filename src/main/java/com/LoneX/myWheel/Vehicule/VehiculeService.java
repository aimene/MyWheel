package com.LoneX.myWheel.Vehicule;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;

import com.LoneX.myWheel.Filters.Filter;



@Service
public class VehiculeService {
	
	@Autowired
	VehiculeRepository VehiculeRepository;
	
	
	
	
	
	public Vehicule getVehicule(int idVehicule) {
		return VehiculeRepository.findOne(idVehicule);
	}
	public Vehicule getVehiculeByMatricule(String matricule) {
		return VehiculeRepository.findByMatricule(matricule);
	}
	public List<Vehicule> getAllVehicules(){
		
		List<Vehicule> VehiculeList=new ArrayList<Vehicule>();
		VehiculeRepository.findAll().forEach(VehiculeList::add);;
	    return VehiculeList;
	}
	
	public Page<Vehicule> getVehiculesPaged(int page){
		Page<Vehicule> vPage = VehiculeRepository.findAll(new PageRequest(page, 12));
		return vPage;
	}
	
	public void addVehicule(Vehicule Vehicule) {
		VehiculeRepository.save(Vehicule);
	}
	
	
	public void removeVehicule(String matricule) {
		
		int id = VehiculeRepository.findByMatricule(matricule).getIdVehicule();
		  
		VehiculeRepository.delete(id);	}
	
	
	public Page<Vehicule> getVehiculeFilteredAndPaged(Filter filter ,int  page){
		
		Page<Vehicule> filteredPage=this.getVehiculesPaged(page);
		
		String categorie=filter.getCategory();
		String model=filter.getModel();
		String marque=filter.getMarque();
		double plj=filter.getPriceRange();
		
		Date dateD = null;
		Date dateR=null;
		try {
			dateD = new SimpleDateFormat("yyyy-MM-dd").parse(filter.getDateR());
			dateR=new SimpleDateFormat("yyyy-MM-dd").parse(filter.getDateD());
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	
		
			filteredPage=VehiculeRepository.findByFullFilter(dateD, dateR, marque, plj , categorie, model, new PageRequest(page , 12));
		
		
		return filteredPage ;
	}

		public List<String> getAllCategories(){
			return VehiculeRepository.getAllCategories();
		}
		public List<String> getModelsByMarque( String marque, String category ) {
			// TODO Auto-generated method stub
			return VehiculeRepository.getModelsByMarque(marque,category);
		}
		public List<String> getAllMarques() {
			// TODO Auto-generated method stub
			return VehiculeRepository.getAllMarques();
		}
		public List<String> getMarquesByCategory(String category) {
			// TODO Auto-generated method stub
			return VehiculeRepository.getMarquesByCategory(category);
		}
	

	
}

    
	
