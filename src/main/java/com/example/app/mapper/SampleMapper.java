package com.example.app.mapper;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.example.app.model.Sample;

@Repository
public interface SampleMapper {
	/**
	 * 用户列表
	 * 
	 * @return
	 */
	List<Sample> list();

}
