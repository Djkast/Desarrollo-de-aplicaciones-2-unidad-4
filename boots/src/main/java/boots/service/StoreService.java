package boots.service;

import java.util.ArrayList;
import java.util.List;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import boots.dao.StoreRepository;
import boots.model.Store;

@Service @Transactional
public class StoreService {

	private final StoreRepository storeRepository;
	
	public StoreService(StoreRepository storeRepository){
		super();
		this.storeRepository = storeRepository;
	}
	
	public List<Store> findAll(){
		List<Store> stores = new ArrayList<Store>();
		for(Store store : storeRepository.findAll()){
			stores.add(store);
		}
		return stores;
	}
	
	public void save(Store store){
		storeRepository.save(store);
	}
	
	public void delete(int id){
		storeRepository.delete(id);
	}
	
	public Store findOne(int id){
		return storeRepository.findOne(id);
	}
}
