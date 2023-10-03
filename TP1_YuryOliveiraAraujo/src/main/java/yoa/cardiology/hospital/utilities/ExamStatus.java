package yoa.cardiology.hospital.utilities;

public enum ExamStatus {
	WAITING_EXAM("Aguardando Exame"),
	WAITING_REPORT("Aguardando Laudo"),
	REPORT_DONE("Laudo Realizado"),
	CANCELED_EXAM("Exame Cancelado");
	
	private final String STATUS;

	private ExamStatus(String STATUS) {
		this.STATUS = STATUS;
	}

	public String getSTATUS() {
		return STATUS;
	}	
	
	@Override
	public String toString() {
		return this.STATUS;
	}
}
