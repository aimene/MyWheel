package com.LoneX.myWheel.Reservation;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.LoneX.myWheel.User.MyUser;



@Service
public class ReservationService {
	
	@Autowired
	ReservationRepository ReservationRepository;
	
	
	
	
	
	public Reservation getReservation(int idReservation) {
		return ReservationRepository.findOne(idReservation);
	}
	
	public void reserver(Reservation reservation) {
		
		ReservationRepository.save(reservation);
	}
	public List<Reservation> getUserReservations(int userId){
		
		return ReservationRepository.findByUserId(userId);
	}
	

	
}

    
	
