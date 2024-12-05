package com.klef.jfsd.springboot.sdp.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.klef.jfsd.springboot.sdp.model.ActivityLogs;

public interface ActivityLogsRepository extends JpaRepository<ActivityLogs, Integer>{

}
