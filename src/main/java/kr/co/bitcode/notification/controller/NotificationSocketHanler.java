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
	//private Map<String, Object> maps = new HashMap<>();
	
	@Autowired
	private QnaMapper mapper;

	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		System.out.println(session.getId() + "연결됨");
		users.put(session.getId(),session);
		System.out.println("세션 아이디 체크 "+ users.get(session.getId()));
	}
	

	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		
		String reMsg = message.getPayload();
		System.out.println("메세지 잘 담겼는지 확인 " + reMsg);
		List<Qna> ansList = mapper.selectNtf(reMsg);
		List<Qna> readList = mapper.selectNoRead(reMsg);
		for(Qna read:readList) {
			System.out.println("읽음여부 아이디" + read.getId());
			System.out.println("읽음여부 확인 " + read.getReadAns());
		}
		
		Set<String> keys = users.keySet();
		for (String key : keys) {
			WebSocketSession wSession = users.get(key);
			for(Qna qna:ansList) {
				System.out.println("답변여부리스트 아이디 :" + qna.getId());
				System.out.println("답변여부리스트  확인:" + qna.getAnswerAt());
				System.out.println("답변여부리스트  글번호:" + qna.getNo());
			System.out.println("답변여부길이 :" + ansList.size() );
			System.out.println("읽음여부길이 :" + readList.size() );
				//wSession.sendMessage(new TextMessage(qna.getNo()+"번게시글이 "+ ansList.size()+"개 답변이 달렸습니다.")); //전체 사용자에게 텍스트 멧세지를 전송한ㄳ
				wSession.sendMessage(new TextMessage(":" + qna.getNo()+","+ ansList.size())); //전체 사용자에게 텍스트 멧세지를 전송한ㄳ
				//wSession.sendMessage(new TextMessage(readList.size()+"개에 글을 읽었습니다.")); //전체 사용자에게 텍스트 멧세지를 전송한ㄳ
			}
				
		}
		
	}

	


	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		System.out.println(session.getId() + " 연결 종료됨");
		users.remove(session.getId());
		System.out.println("왔으면 찍어줘");
//		Map<String,Object> attr =  session.getAttributes();
//		System.out.println(attr.toString() +"맵정보");
//		User user = (User)attr.get("user");
//		System.out.println(user.getId() +"유저아이디" );
//		System.out.println(user.getName() +"이름");
//		users.remove(session);
	
	}
	

	

	
	
	
}
