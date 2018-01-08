/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import com.opensymphony.xwork2.ActionSupport;
import dao.LibrarianDAO;
import java.util.Map;
import javax.servlet.http.HttpSession;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.dispatcher.SessionMap;
import org.apache.struts2.interceptor.SessionAware;

/**
 *
 * @author oswal
 */
public class AuthenticationActionSupport extends ActionSupport implements SessionAware {

    private String username;
    private String password;
    private SessionMap<String, Object> sessionMap;

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public AuthenticationActionSupport() {
    }

    @Override
    public void setSession(Map<String, Object> map) {
        sessionMap = (SessionMap<String, Object>) map;
    }
    
    public String login() {
        String loggedUsername = null;
        
        // check if username is already stored in the session
        if (sessionMap.containsKey("username")) {
            loggedUsername = (String) sessionMap.get("username");
        }
        if (loggedUsername != null) {
            return "success";
        }
        
        // if no username stored in session, check the username and password
        if (new LibrarianDAO().checkLogin(username, password)) {
            // add username to session
            sessionMap.put("username", username);
            return "success";
        }
        return "login";
    }

    public String logout() {
        // remove username from session
        if (sessionMap.containsKey("username")) {
            sessionMap.remove("username");
        }
        return "success";
    }
}
