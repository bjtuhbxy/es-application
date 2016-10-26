package com.cmcc.es.app.mapper;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.cmcc.es.app.model.Catalog;

@Repository
public interface CatalogMapper {

	 List<Catalog> selectParentList();
	
	 List<Catalog> selectSonList();
	
	 List<Catalog> selectGrSonList();
    
	
}
