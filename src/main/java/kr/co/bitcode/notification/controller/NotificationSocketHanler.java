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
	private Map<String, WebSocketSession> chatUsers = new HashMap<>();
	//private Map<String, Object> maps = new HashMap<>();
	
	@Autowired
	private QnaMapper mapper;

	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		System.out.println(session.getId() + "연결됨");
		users.put(session.getId(),session);
		System.out.println("세션 아이디 체크 "+ users.get(session.getId()));
	
	// 채팅부분
		Map<String, Object> attrs = session.getAttributes();
		User u = (User)attrs.get("user");
		chatUsers.put(u.getNickName(), session);
		System.out.println("------------------------------");
		System.out.println("접속한 사용자 관리 목록");
		System.out.println("------------------------------");		
		Set<String> chatKeys = chatUsers.keySet();
		String userList = "userList:";
		for(String key : chatKeys) {
			System.out.println(key);
			userList = userList + key + ":";			
		}
		for(String key : chatKeys) {
			WebSocketSession wss = chatUsers.get(key);
			wss.sendMessage(new TextMessage(userList));
		}
		
		System.out.println("------------------------------");		
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
		// 채팅 부분
		System.out.println("보낸 아이디 : " + session.getId());
		System.out.println("보낸 메세지 : " + message.getPayload());		
		// 서버에 접속한 모든 사용자에게 메세지 전송하기
		Set<String> chatKeys = chatUsers.keySet();
		for(String key : chatKeys) {
			System.out.println(key);
			WebSocketSession wss = chatUsers.get(key);
			wss.sendMessage(
					new TextMessage(message.getPayload()));
		};		
		
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
		
		// 채팅 부분
		Map<String, Object> attrs = session.getAttributes();
		User u = (User)attrs.get("user");
		// 종료된 사용자 정보를 삭제
		chatUsers.remove(u.getNickName());	
	}	
}
