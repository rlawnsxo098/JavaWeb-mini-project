package model.domain;

import java.sql.SQLException;

import exception.MessageException;
import model.domain.datainfo.LoginDTO;

public class LoginService {

	
	public static boolean addLoginDAO(LoginDTO login) throws MessageException{
		boolean result = false;
		try{
			result = LoginDAO.addLogin(login);
		}catch(SQLException s){
			throw new MessageException("이미 존재하는 ID입니다 다시 시도 하세요");
		}
		return result;
	}

	
}
