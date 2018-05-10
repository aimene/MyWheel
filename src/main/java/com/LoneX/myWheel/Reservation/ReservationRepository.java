package com.LoneX.myWheel.Reservation;





import java.util.List;

import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.stereotype.Repository;

import com.LoneX.myWheel.User.MyUser;

@Repository
public interface ReservationRepository extends PagingAndSortingRepository<Reservation, Integer>{

	public List<Reservation> findByUserId(int userId);

	

}
