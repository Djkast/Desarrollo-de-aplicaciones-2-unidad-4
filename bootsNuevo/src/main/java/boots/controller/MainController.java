package boots.controller;

import javax.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;


@Controller
public class MainController {
	
	@GetMapping("/")
	public String home(HttpServletRequest request){
		request.setAttribute("mode", "MODE_HOME");
		return"index";
	}
	
	@GetMapping("/task")
	public String homeTask(HttpServletRequest request){
		request.setAttribute("mode", "MODE_HOME");
		return"task";
	}	
	
	@GetMapping("/store")
	public String homeStore(HttpServletRequest request){
		request.setAttribute("mode", "MODE_HOME");
		return"store";
	}
	
	@GetMapping("/song")
	public String homeSong(HttpServletRequest request){
		request.setAttribute("mode", "MODE_HOME");
		return"song";
	}
	
}
