package yoa.cardiology.hospital.logic;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public interface Logic {
	String execute(HttpServletRequest request, HttpServletResponse response) throws Exception;
}
