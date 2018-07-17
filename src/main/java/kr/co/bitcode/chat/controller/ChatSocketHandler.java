package kr.co.bitcode.chat.controller;

import java.util.HashMap;
import java.util.Map;
import java.util.Set;

import org.springframework.stereotype.Component;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

// 컴포넌트 정보 등록 : config/spring/spring-websocket.xml 파일에 등록처리함
@Component("chat")
public class ChatSocketHandler extends TextWebSocketHandler{

	private Map<String, WebSocketSession> users = new HashMap<>();
	
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		System.out.println(session.getId() + "연결 종료됨");
		// 종료된 사용자 정보를 삭제
		users.remove(session.getId());
	}

	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		System.out.println(session.getId() + "연결됨");
		// 요청한 사용자 정보를 관리
		users.put(session.getId(), session);
		System.out.println("------------------------------");
		System.out.println("접속한 사용자 관리 목록");
		System.out.println("------------------------------");
		Set<String> keys = users.keySet();
		for(String key : keys) {
			System.out.println(key);
		}
		System.out.println("------------------------------");
	}

	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		System.out.println("보낸 아이디 : " + session.getId());
		System.out.println("보낸 메세지 : " + message.getPayload());
		
		
		// 서버에 접속한 모든 사용자에게 메세지 전송하기
		Set<String> keys = users.keySet();
		for(String key : keys) {
			System.out.println(key);
			WebSocketSession wss = users.get(key);
			wss.sendMessage(
					new TextMessage(message.getPayload()));
		};
	}
	
}