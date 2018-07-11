package kr.co.bitcode.repository.domain;

import org.springframework.web.multipart.MultipartFile;

public class Share {
	private MultipartFile attach;
	private String id;
	public MultipartFile getAttach() {
		return attach;
	}
	public void setAttach(MultipartFile attach) {
		this.attach = attach;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	
	
}
