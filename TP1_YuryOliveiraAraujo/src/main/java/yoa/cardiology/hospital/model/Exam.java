package yoa.cardiology.hospital.model;

import java.util.Calendar;

public class Exam {
	private long id;
	private String patientCpf;
	private String examType;
	private String status;
	private String hypothesis;
	private Calendar dateRequested;
	private Calendar datePerformed;	
	private String doctorCrm;
	private byte[] pdfData;
	
	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
	public String getPatientCpf() {
		return patientCpf;
	}
	public void setPatientCpf(String patientCpf) {
		this.patientCpf = patientCpf;
	}
	public String getExamType() {
		return examType;
	}
	public void setExamType(String examType) {
		this.examType = examType;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getHypothesis() {
		return hypothesis;
	}
	public void setHypothesis(String hypothesis) {
		this.hypothesis = hypothesis;
	}
	public Calendar getDateRequested() {
		return dateRequested;
	}
	public void setDateRequested(Calendar dateRequested) {
		this.dateRequested = dateRequested;
	}
	public Calendar getDatePerformed() {
		return datePerformed;
	}
	public void setDatePerformed(Calendar datePerformed) {
		this.datePerformed = datePerformed;
	}
	public String getDoctorCrm() {
		return doctorCrm;
	}
	public void setDoctorCrm(String doctorCrm) {
		this.doctorCrm = doctorCrm;
	}
	public byte[] getPdfData() {
		return pdfData;
	}
	public void setPdfData(byte[] pdfData) {
		this.pdfData = pdfData;
	}
}
