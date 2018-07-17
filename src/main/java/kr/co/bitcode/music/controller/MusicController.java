package kr.co.bitcode.music.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@CrossOrigin(origins = "*")
@RequestMapping("/music")
public class MusicController {

	//@Autowired
	//private MusicService service;
	
	/** 내음악 플레이어 */
	@RequestMapping("/player.do")
	public void player() {
	}
}
