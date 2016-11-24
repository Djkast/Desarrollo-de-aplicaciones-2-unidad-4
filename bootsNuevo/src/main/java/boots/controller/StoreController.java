package boots.controller;

import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import boots.model.Store;
import boots.service.StoreService;


@Controller
public class StoreController {
	
	@Autowired
	private StoreService storeService;
	
	@GetMapping("/all-stores")
	public String AllStores(HttpServletRequest request){
		request.setAttribute("stores", storeService.findAll());
		request.setAttribute("mode", "MODE_STORES");
		return "store";
	}
	
	@GetMapping("/new-stores")
	public String newStores(HttpServletRequest request){
		request.setAttribute("mode", "MODE_NEW_STORE");
		return "store";
	}
	
	@GetMapping("/update-store")
	public String updateStores(@RequestParam int id, HttpServletRequest request){
		request.setAttribute("store", storeService.findOne(id));
		request.setAttribute("mode", "MODE_UPDATE_STORE");
		return "store";
	}
	
	@GetMapping("/delete-store")
	public String deleteStores(@RequestParam int id, HttpServletRequest request){
		storeService.delete(id);
		request.setAttribute("stores", storeService.findAll());
		request.setAttribute("mode", "MODE_STORES");
		return "store";
	}
	
	@PostMapping("/save-store")
	public String savedStore(@ModelAttribute Store store,
		BindingResult bindingResult, HttpServletRequest request){
		storeService.save(store);
		request.setAttribute("stores", storeService.findAll());
		request.setAttribute("mode", "MODE_STORES");
		return "store";
	}
}
