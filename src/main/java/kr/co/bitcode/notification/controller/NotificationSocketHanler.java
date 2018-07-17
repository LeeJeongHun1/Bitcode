package kr.co.bitcode.notification.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import kr.co.bitcode.repository.domain.Qna;
import kr.co.bitcode.repository.domain.User;
import kr.co.bitcode.repository.mapper.QnaMapper;
 
@Component("notification")
public class NotificationSocketHanler extends TextWebSocketHandler {

	private Map<String, WebSocketSession> users = new HashMap<>();
	private Map<String, Object> maps = new HashMap<>();
	
	@Autowired
	private QnaMapper mapper;

	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		System.out.println("연결여부" + session.getId());
		System.out.println("보낸메세지" + message.getPayload());
		String reMsg = message.getPayload();
		users.put(reMsg, session);
		System.out.println("사용자 정보 " + users);
		
		Map<String,Object> attr =  session.getAttributes();
		User user = (User)attr.get("user");
		List<Qna> ansList = mapper.selectNtf(user.getId());
		for(Qna qna:ansList) {
			System.out.println(qna.getId() +"아이디");
			System.out.println(qna.getAnswerAt() +"답변");
		}
		List<Qna> readList = mapper.selectNoRead(user.getId());
		maps.put("qnaList", ansList);
		maps.put("readList",readList);
		String sendMsg = maps.get("qnaList").toString();
		//System.out.println(sendMsg);
		Set<String> keys = users.keySet();
		for (String key : keys) {
			WebSocketSession wSession = users.get(key);
				wSession.sendMessage(new TextMessage(ansList.size()+"개에 답변이 달렸습니다.")); //전체 사용자에게 텍스트 멧세지를 전송한ㄳ
				wSession.sendMessage(new TextMessage(readList.size()+"개에 글을 읽었습니다.")); //전체 사용자에게 텍스트 멧세지를 전송한ㄳ
				
		}
		
	}

	


	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		System.out.println(session.getId() + " 연결 종료됨");
/*		Map<String,Object> attr =  session.getAttributes();
		System.out.println(attr.toString() +"맵정보");
		User user = (User)attr.get("user");
		System.out.println(user.getId() +"유저아이디" );
		System.out.println(user.getName() +"이름");
		users.remove(user.getId());
		System.out.println("종료");*/
	
	}
	

	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		System.out.println(session.getId() + "연결됨");
	}

	
	
	
}
