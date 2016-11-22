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
import boots.model.Task;
import boots.service.StoreService;
import boots.service.TaskService;

@Controller
public class MainController {
	
	@Autowired
	private TaskService taskService;
	
	
	@GetMapping("/")
	public String home(HttpServletRequest request){
		request.setAttribute("mode", "MODE_HOME");
		return"index";
		}
	
	@GetMapping("/all-tasks")
	public String AllTasks(HttpServletRequest request){
		request.setAttribute("tasks", taskService.findAll());
		request.setAttribute("mode", "MODE_TASKS");
		return "index";
	}
	
	@GetMapping("/new-tasks")
	public String newTasks(HttpServletRequest request){
		request.setAttribute("mode", "MODE_NEW");
		return "index";
	}
	
	@GetMapping("/update-task")
	public String updateTasks(@RequestParam int id, HttpServletRequest request){
		request.setAttribute("task", taskService.findOne(id));
		request.setAttribute("mode", "MODE_UPDATE");
		return "index";
	}
	
	@GetMapping("/delete-task")
	public String deleteTasks(@RequestParam int id, HttpServletRequest request){
		taskService.delete(id);
		request.setAttribute("tasks", taskService.findAll());
		request.setAttribute("mode", "MODE_TASKS");
		return "index";
	}
	
	@PostMapping("/save-task")
	public String savedTask(@ModelAttribute Task task,
		BindingResult bindingResult, HttpServletRequest request){
		taskService.save(task);
		request.setAttribute("tasks", taskService.findAll());
		request.setAttribute("mode", "MODE_TASKS");
		return "index";
	}
	
	
	@Autowired
	private StoreService storeService;
	
	@GetMapping("/all-stores")
	public String AllStores(HttpServletRequest request){
		request.setAttribute("stores", storeService.findAll());
		request.setAttribute("mode", "MODE_STORES");
		return "index";
	}
	
	@GetMapping("/new-stores")
	public String newStores(HttpServletRequest request){
		request.setAttribute("mode", "MODE_NEW_STORE");
		return "index";
	}
	
	@GetMapping("/update-store")
	public String updateStores(@RequestParam int id, HttpServletRequest request){
		request.setAttribute("store", storeService.findOne(id));
		request.setAttribute("mode", "MODE_UPDATE_STORE");
		return "index";
	}
	
	@GetMapping("/delete-store")
	public String deleteStores(@RequestParam int id, HttpServletRequest request){
		storeService.delete(id);
		request.setAttribute("stores", storeService.findAll());
		request.setAttribute("mode", "MODE_STORES");
		return "index";
	}
	
	@PostMapping("/save-store")
	public String savedStore(@ModelAttribute Store store,
		BindingResult bindingResult, HttpServletRequest request){
		storeService.save(store);
		request.setAttribute("stores", storeService.findAll());
		request.setAttribute("mode", "MODE_STORES");
		return "index";
	}
}
