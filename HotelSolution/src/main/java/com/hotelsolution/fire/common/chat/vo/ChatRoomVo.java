package com.hotelsolution.fire.common.chat.vo;

import java.util.HashSet;
import java.util.Set;
import java.util.UUID;

import org.springframework.web.socket.WebSocketSession;

import lombok.Data;

@Data
public class ChatRoomVo {

    private String no;
    private String user1No;
    private String user1Name;
    private String user1PositionName;
    private String user1TeamName;
    private String user1Image;
    private String user2No;
    private String user2Name;
    private String user2PositionName;
    private String user2TeamName;
    private String user2Image;
    private String updateTime1;
    private String updateTime2;
    private Set<WebSocketSession> sessions = new HashSet<>();

   
}