package com.klef.jfsd.springboot.sdp.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.klef.jfsd.springboot.sdp.model.Admin;


@Repository
public interface AdminRepository extends JpaRepository<Admin,Long>{
	@Query("select a from Admin a where a.email=?1 and a.password=?2")
	public Admin checkAdminLogin(String username, String password);
}
