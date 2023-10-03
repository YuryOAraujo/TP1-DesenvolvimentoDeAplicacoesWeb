package yoa.cardiology.hospital.model;

public class Doctor {
	private String crm;
	private String name;
	private String doctorType;
	private String password;
	private String title;
	private String residencyYear;
	
	public String getCrm() {
		return crm;
	}
	public void setCrm(String crm) {
		this.crm = crm;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getDoctorType() {
		return doctorType;
	}
	public void setDoctorType(String doctorType) {
		this.doctorType = doctorType;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getResidencyYear() {
		return residencyYear;
	}
	public void setResidencyYear(String residencyYear) {
		this.residencyYear = residencyYear;
	}		
}
